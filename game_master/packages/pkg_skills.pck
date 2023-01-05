CREATE OR REPLACE PACKAGE pkg_skills IS
  TYPE ty_skill_descripts IS TABLE OF VARCHAR2(4000) INDEX BY VARCHAR2(40);

  FUNCTION find_skill_id_by_name(p_name VARCHAR2) RETURN NUMBER;

  PROCEDURE create_skill(p_name        VARCHAR2
                        ,p_description VARCHAR2);

  PROCEDURE change_mana_cost(p_name      VARCHAR2
                            ,p_mana_cost NUMBER);

  PROCEDURE change_description(p_name        VARCHAR2
                              ,p_description VARCHAR2);

  PROCEDURE erease_skill(p_name VARCHAR2);

  PROCEDURE connect_with_effects;

  FUNCTION skill_descriptions RETURN ty_skill_descripts;

END pkg_skills;
/
CREATE OR REPLACE PACKAGE BODY pkg_skills IS
  v_data_not_found NUMBER;

  FUNCTION find_skill_id_by_name(p_name VARCHAR2) RETURN NUMBER IS
    v_id NUMBER;
  BEGIN
    SELECT COUNT(s.id)
      INTO v_data_not_found
      FROM skills s
     WHERE s.nev LIKE p_name;
  
    IF v_data_not_found = 0
    THEN
      raise_application_error(pkg_exceptions.gc_skill_not_found_code,
                              p_name || ' nevû skill nem található!');
      RETURN NULL;
    ELSE
      SELECT s.id INTO v_id FROM skills s WHERE s.nev = p_name;
      RETURN v_id;
    END IF;
  END find_skill_id_by_name;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE create_skill(p_name        VARCHAR2
                        ,p_description VARCHAR2) IS
  BEGIN
    INSERT INTO skills
      (nev
      ,leiras)
    VALUES
      (p_name
      ,p_description);
  
  EXCEPTION
    WHEN dup_val_on_index THEN
      raise_application_error(pkg_exceptions.gc_unique_name_code,
                              p_name || ' nevû skill már létezik!' ||
                              chr(10) ||
                              'Az skill-ek nevei nem egyezhetnek meg!');
  END create_skill;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE change_mana_cost(p_name      VARCHAR2
                            ,p_mana_cost NUMBER) IS
    v_id NUMBER;
  BEGIN
    v_id := find_skill_id_by_name(p_name);
    pkg_assist.bigger_than_zero(p_mana_cost);
  
    UPDATE skills s SET s.mana_cost = p_mana_cost WHERE s.id = v_id;
  END change_mana_cost;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE change_description(p_name        VARCHAR2
                              ,p_description VARCHAR2) IS
    v_id NUMBER;
  BEGIN
    v_id := find_skill_id_by_name(p_name);
  
    UPDATE skills s SET s.leiras = p_description WHERE s.id = v_id;
  END change_description;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE erease_skill(p_name VARCHAR2) IS
    v_id NUMBER;
  BEGIN
    v_id := find_skill_id_by_name(p_name);
  
    DELETE FROM skills_of_characters soc WHERE soc.skill_id = v_id;
    DELETE FROM skills s WHERE s.id = v_id;
  END erease_skill;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE connect_with_effects IS
    v_effects_name pkg_effects.ty_effect_names;
    v_descripts    ty_skill_descripts;
    v_desc_idx     VARCHAR2(40);
    v_eff_idx      VARCHAR(40);
  BEGIN
    v_effects_name := pkg_effects.list_of_effects;
    v_descripts    := skill_descriptions;
  
    v_desc_idx := v_descripts.first;
    WHILE (v_desc_idx IS NOT NULL)
    LOOP
      v_eff_idx := v_effects_name.first;
    
      WHILE (v_eff_idx IS NOT NULL)
      LOOP
      
        IF instr(v_descripts(v_desc_idx), v_eff_idx) > 0
        THEN
          UPDATE skills s
             SET s.effect_id = v_effects_name(v_eff_idx)
           WHERE s.nev = v_desc_idx;
        END IF;
      
        v_eff_idx := v_effects_name.next(v_eff_idx);
      END LOOP;
    
      v_desc_idx := v_effects_name.next(v_eff_idx);
    END LOOP;
  END connect_with_effects;

  -----------------------------------------------------------------------------------------------------------------

  FUNCTION skill_descriptions RETURN ty_skill_descripts IS
    v_descripts ty_skill_descripts;
  BEGIN
    FOR i IN (SELECT s.* FROM skills s)
    LOOP
      v_descripts(i.nev) := i.leiras;
    END LOOP;
    RETURN v_descripts;
  END skill_descriptions;

END pkg_skills;

/*
skill_leiras1 -> skill_nev1
skill_leiras2 -> skill_nev2
.
.
.
skill_leirasN -> skill_nevN;
*/
/
