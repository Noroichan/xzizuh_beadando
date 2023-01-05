CREATE OR REPLACE PACKAGE pkg_characters IS

  PROCEDURE create_character(p_name          VARCHAR2
                            ,p_race_name     VARCHAR2
                            ,p_cast_name     VARCHAR2
                            ,p_religion_name VARCHAR2
                            ,p_health        NUMBER
                            ,p_evasion       NUMBER
                            ,p_mana          NUMBER
                            ,p_speed         NUMBER
                            ,p_attack        VARCHAR2
                            ,p_aim           VARCHAR2
                            ,p_stealth       VARCHAR2
                            ,p_luck          VARCHAR2);

  PROCEDURE erease_character(p_id NUMBER);

  PROCEDURE change_cast(p_character_id NUMBER
                       ,p_cast_name    VARCHAR2);

  PROCEDURE change_religion(p_character_id  NUMBER
                           ,p_religion_name VARCHAR2);

  PROCEDURE change_character_name(p_id   NUMBER
                                 ,p_name VARCHAR2);

  PROCEDURE learn_skill_by_name(p_character_id NUMBER
                               ,p_skill_name   VARCHAR2);

  PROCEDURE forget_skill_by_name(p_character_id NUMBER
                                ,p_skill_name   VARCHAR2);

  FUNCTION character_exists(p_id NUMBER) RETURN BOOLEAN;

  FUNCTION character_with_skills(p_character_id NUMBER)
    RETURN ty_character_with_skills;

END pkg_characters;
/
CREATE OR REPLACE PACKAGE BODY pkg_characters IS

  v_data_not_found NUMBER;
  v_race_id        NUMBER;
  v_cast_id        NUMBER;
  v_religion_id    NUMBER;
  v_skill_id       NUMBER;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE create_character(p_name          VARCHAR2
                            ,p_race_name     VARCHAR2
                            ,p_cast_name     VARCHAR2
                            ,p_religion_name VARCHAR2
                            ,p_health        NUMBER
                            ,p_evasion       NUMBER
                            ,p_mana          NUMBER
                            ,p_speed         NUMBER
                            ,p_attack        VARCHAR2
                            ,p_aim           VARCHAR2
                            ,p_stealth       VARCHAR2
                            ,p_luck          VARCHAR2) IS
  BEGIN
    v_race_id     := pkg_races.find_race_id_by_name(p_race_name);
    v_cast_id     := pkg_casts.find_cast_id_by_name(p_cast_name);
    v_religion_id := pkg_religions.find_religion_id_by_name(p_religion_name);
  
    pkg_assist.bigger_than_zero(p_health);
    pkg_assist.bigger_than_zero(p_evasion);
    pkg_assist.bigger_than_zero(p_mana);
    pkg_assist.bigger_than_zero(p_speed);
  
    pkg_assist.is_this_a_dice(p_attack);
    pkg_assist.is_this_a_dice(p_aim);
    pkg_assist.is_this_a_dice(p_stealth);
    pkg_assist.is_this_a_dice(p_luck);
  
    INSERT INTO characters
      (nev
      ,race_id
      ,cast_id
      ,religion_id
      ,health
      ,evasion
      ,mana
      ,speed
      ,attack
      ,aim
      ,stealth
      ,luck)
    VALUES
      (p_name
      ,v_race_id
      ,v_cast_id
      ,v_religion_id
      ,p_health
      ,p_evasion
      ,p_mana
      ,p_speed
      ,p_attack
      ,p_aim
      ,p_stealth
      ,p_luck);
  END create_character;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE erease_character(p_id NUMBER) IS
  BEGIN
    IF character_exists(p_id)
    THEN
      DELETE FROM skills_of_characters soc WHERE soc.character_id = p_id;
      DELETE FROM characters c WHERE c.id = p_id;
    END IF;
  END erease_character;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE change_cast(p_character_id NUMBER
                       ,p_cast_name    VARCHAR2) IS
  BEGIN
    v_cast_id := pkg_casts.find_cast_id_by_name(p_cast_name);
  
    IF character_exists(p_character_id)
    THEN
      UPDATE characters c
         SET c.cast_id = v_cast_id
       WHERE c.id = p_character_id;
    END IF;
  END change_cast;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE change_religion(p_character_id  NUMBER
                           ,p_religion_name VARCHAR2) IS
  BEGIN
    v_religion_id := pkg_religions.find_religion_id_by_name(p_religion_name);
  
    IF character_exists(p_character_id)
    THEN
      UPDATE characters c
         SET c.religion_id = v_religion_id
       WHERE c.id = p_character_id;
    END IF;
  END change_religion;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE change_character_name(p_id   NUMBER
                                 ,p_name VARCHAR2) IS
  BEGIN
    IF character_exists(p_id)
    THEN
      UPDATE characters c SET c.nev = p_name WHERE c.id = p_id;
    END IF;
  END change_character_name;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE learn_skill_by_name(p_character_id NUMBER
                               ,p_skill_name   VARCHAR2) IS
  BEGIN
    v_skill_id := pkg_skills.find_skill_id_by_name(p_skill_name);
  
    IF character_exists(p_character_id)
    THEN
      SELECT COUNT(s.id)
        INTO v_data_not_found
        FROM skills_of_characters s
       WHERE s.character_id = p_character_id
         AND s.skill_id = v_skill_id;
    
      IF v_data_not_found = 0
      THEN
        INSERT INTO skills_of_characters
          (character_id
          ,skill_id)
        VALUES
          (p_character_id
          ,v_skill_id);
      ELSE
        raise_application_error(pkg_exceptions.gc_skill_has_learnt_code,
                                p_character_id ||
                                ' id-val rendelkezõ karakter már ismeri a(z) ' ||
                                p_skill_name || ' nevû skill-t!');
      END IF;
    END IF;
  
  END learn_skill_by_name;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE forget_skill_by_name(p_character_id NUMBER
                                ,p_skill_name   VARCHAR2) IS
  BEGIN
    v_skill_id := pkg_skills.find_skill_id_by_name(p_skill_name);
  
    IF character_exists(p_character_id)
    THEN
      SELECT COUNT(s.id)
        INTO v_data_not_found
        FROM skills_of_characters s
       WHERE s.character_id = p_character_id
         AND s.skill_id = v_skill_id;
    
      IF v_data_not_found = 0
      THEN
        raise_application_error(pkg_exceptions.gc_skill_has_not_learnt_code,
                                p_character_id ||
                                ' id-val rendelkezõ karakter nem ismeri a(z) ' ||
                                p_skill_name || ' nevû skill-t!');
      ELSE
        DELETE FROM skills_of_characters s
         WHERE s.character_id = p_character_id
           AND s.skill_id = v_skill_id;
      END IF;
    END IF;
  END forget_skill_by_name;

  -----------------------------------------------------------------------------------------------------------------

  FUNCTION character_exists(p_id NUMBER) RETURN BOOLEAN IS
  BEGIN
    SELECT COUNT(c.id)
      INTO v_data_not_found
      FROM characters c
     WHERE c.id = p_id;
  
    IF v_data_not_found = 0
    THEN
      raise_application_error(pkg_exceptions.gc_character_not_found_code,
                              p_id ||
                              ' id-val rendelkezõ karakter nem található!');
      RETURN FALSE;
    ELSE
      RETURN TRUE;
    END IF;
  END character_exists;

  -----------------------------------------------------------------------------------------------------------------

  FUNCTION character_with_skills(p_character_id NUMBER)
    RETURN ty_character_with_skills IS
  
    v_char_with_skills ty_character_with_skills;
    v_skill_list       ty_skill_list_l;
    v_character_name   VARCHAR2(40);
  
  BEGIN
    IF character_exists(p_character_id)
    THEN
    
      SELECT COUNT(soc.id)
        INTO v_data_not_found
        FROM skills_of_characters soc
       WHERE soc.character_id = p_character_id;
    
      IF v_data_not_found = 0
      THEN
        raise_application_error(pkg_exceptions.gc_has_no_skills_code,
                                p_character_id ||
                                ' id-val rendelkezõ karakternek nincsnek skill-jei!');
        RETURN NULL;
      ELSE
        SELECT s.nev
          BULK COLLECT
          INTO v_skill_list
          FROM skills_of_characters soc
         INNER JOIN skills s
            ON soc.skill_id = s.id
         WHERE soc.character_id = p_character_id;
      
        SELECT c.nev
          INTO v_character_name
          FROM characters c
         WHERE c.id = p_character_id;
      
        v_char_with_skills := ty_character_with_skills(id             => p_character_id,
                                                       character_name => v_character_name,
                                                       skill_list     => v_skill_list);
      
        RETURN v_char_with_skills;
      END IF;
    ELSE
      RETURN NULL;
    END IF;
  END character_with_skills;

END pkg_characters;
/
