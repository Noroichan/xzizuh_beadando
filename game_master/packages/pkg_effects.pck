CREATE OR REPLACE PACKAGE pkg_effects IS
  TYPE ty_effect_names IS TABLE OF NUMBER INDEX BY VARCHAR2(40);

  FUNCTION find_effect_id_by_name(p_name VARCHAR2) RETURN NUMBER;

  PROCEDURE add_effect(p_name             VARCHAR2
                      ,p_damage_per_round NUMBER
                      ,p_description      VARCHAR2);

  PROCEDURE erease_effect(p_name VARCHAR2);

  PROCEDURE change_description(p_name        VARCHAR2
                              ,p_description VARCHAR2);

  PROCEDURE change_damage(p_name             VARCHAR2
                         ,p_damage_per_round NUMBER);

  FUNCTION list_of_effects RETURN ty_effect_names;

END pkg_effects;
/
CREATE OR REPLACE PACKAGE BODY pkg_effects IS
  v_data_not_found NUMBER;

  FUNCTION find_effect_id_by_name(p_name VARCHAR2) RETURN NUMBER IS
    v_id NUMBER;
  BEGIN
    SELECT COUNT(e.id)
      INTO v_data_not_found
      FROM effects e
     WHERE e.nev LIKE p_name;
  
    IF v_data_not_found = 0
    THEN
      raise_application_error(pkg_exceptions.gc_effect_not_found_code,
                              p_name || ' nevû effect nem található!');
      RETURN NULL;
    ELSE
      SELECT e.id INTO v_id FROM effects e WHERE e.nev = p_name;
      RETURN v_id;
    END IF;
  END find_effect_id_by_name;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE add_effect(p_name             VARCHAR2
                      ,p_damage_per_round NUMBER
                      ,p_description      VARCHAR2) IS
  BEGIN
    pkg_assist.bigger_than_zero(p_damage_per_round);
  
    INSERT INTO effects
      (nev
      ,damage_per_rounds
      ,leiras)
    VALUES
      (p_name
      ,p_damage_per_round
      ,p_description);
  
  EXCEPTION
    WHEN dup_val_on_index THEN
      raise_application_error(pkg_exceptions.gc_unique_name_code,
                              p_name || ' nevû effect már létezik!' ||
                              chr(10) ||
                              'Az effect-ek nevei nem egyezhetnek meg!');
  END add_effect;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE erease_effect(p_name VARCHAR2) IS
    v_id NUMBER;
  BEGIN
    v_id := find_effect_id_by_name(p_name);
  
    SELECT COUNT(s.id)
      INTO v_data_not_found
      FROM skills s
     WHERE s.effect_id = v_id;
  
    IF v_data_not_found = 0
    THEN
      DELETE FROM effects e WHERE e.id = v_id;
    ELSE
      raise_application_error(pkg_exceptions.gc_used_by_skill_code,
                              v_data_not_found ||
                              ' számú skill rendelkezik ezzel az effect-tel, így nem törölhetõ!');
    END IF;
  END erease_effect;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE change_description(p_name        VARCHAR2
                              ,p_description VARCHAR2) IS
    v_id NUMBER;
  BEGIN
    v_id := find_effect_id_by_name(p_name);
  
    UPDATE effects e SET e.leiras = p_description WHERE e.id = v_id;
  END change_description;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE change_damage(p_name             VARCHAR2
                         ,p_damage_per_round NUMBER) IS
    v_id NUMBER;
  BEGIN
    v_id := find_effect_id_by_name(p_name);
    pkg_assist.bigger_than_zero(p_damage_per_round);
  
    UPDATE effects e
       SET e.damage_per_rounds = p_damage_per_round
     WHERE e.id = v_id;
  END change_damage;

  -----------------------------------------------------------------------------------------------------------------

  FUNCTION list_of_effects RETURN ty_effect_names IS
    v_list ty_effect_names;
  BEGIN
    FOR i IN (SELECT e.* FROM effects e)
    LOOP
      v_list(i.nev) := i.id;
    END LOOP;
    RETURN v_list;
  END list_of_effects;

END pkg_effects;
/
