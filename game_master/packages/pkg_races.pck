CREATE OR REPLACE PACKAGE pkg_races IS

  FUNCTION find_race_id_by_name(p_name VARCHAR2) RETURN NUMBER;

  PROCEDURE update_bonus_by_names(p_race_name   VARCHAR2
                                 ,p_bonus_type  VARCHAR2
                                 ,p_bonus_value NUMBER);

  PROCEDURE add_race(p_name VARCHAR2);

  PROCEDURE erease_race(p_name VARCHAR2);

END pkg_races;
/
CREATE OR REPLACE PACKAGE BODY pkg_races IS
  v_data_not_found NUMBER;

  FUNCTION find_race_id_by_name(p_name VARCHAR2) RETURN NUMBER IS
    v_id NUMBER;
  BEGIN
  
    SELECT COUNT(r.id)
      INTO v_data_not_found
      FROM races r
     WHERE r.nev LIKE p_name;
  
    IF v_data_not_found = 0
    THEN
      raise_application_error(pkg_exceptions.gc_race_not_found_code,
                              p_name || ' nevû faj nem található!');
      RETURN NULL;
    ELSE
      SELECT r.id INTO v_id FROM races r WHERE r.nev = p_name;
      RETURN v_id;
    END IF;
  
  END find_race_id_by_name;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE update_bonus_by_names(p_race_name   VARCHAR2
                                 ,p_bonus_type  VARCHAR2
                                 ,p_bonus_value NUMBER) IS
    v_id NUMBER;
  BEGIN
    v_id := find_race_id_by_name(p_race_name);
  
    CASE p_bonus_type
      WHEN 'health' THEN
        UPDATE races r
           SET r.health_bonus = p_bonus_value
         WHERE r.id = v_id;
      WHEN 'evasion' THEN
        UPDATE races r
           SET r.evasion_bonus = p_bonus_value
         WHERE r.id = v_id;
      WHEN 'mana' THEN
        UPDATE races r SET r.mana_bonus = p_bonus_value WHERE r.id = v_id;
      WHEN 'speed' THEN
        UPDATE races r SET r.speed_bonus = p_bonus_value WHERE r.id = v_id;
      WHEN 'attack' THEN
        UPDATE races r
           SET r.attack_bonus = p_bonus_value
         WHERE r.id = v_id;
      WHEN 'aim' THEN
        UPDATE races r SET r.aim_bonus = p_bonus_value WHERE r.id = v_id;
      WHEN 'stealth' THEN
        UPDATE races r
           SET r.stealth_bonus = p_bonus_value
         WHERE r.id = v_id;
      WHEN 'luck' THEN
        UPDATE races r SET r.luck_bonus = p_bonus_value WHERE r.id = v_id;
      ELSE
        raise_application_error(pkg_exceptions.gc_not_bonus_code,
                                p_bonus_type || ' nem egy bonus típusa!' ||
                                chr(10) ||
                                'Kisbetûkkel, a bonus szó nélkül!');
    END CASE;
  END update_bonus_by_names;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE add_race(p_name VARCHAR2) IS
  BEGIN
    INSERT INTO races (nev) VALUES (p_name);
  
  EXCEPTION
    WHEN dup_val_on_index THEN
      raise_application_error(pkg_exceptions.gc_unique_name_code,
                              p_name || ' nevû faj már létezik!' || chr(10) ||
                              'A fajok nevei nem egyezhetnek meg!');
  END add_race;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE erease_race(p_name VARCHAR2) IS
    v_id NUMBER;
  BEGIN
    v_id := find_race_id_by_name(p_name);
  
    SELECT COUNT(c.id)
      INTO v_data_not_found
      FROM characters c
     WHERE c.race_id = v_id;
  
    IF v_data_not_found = 0
    THEN
      DELETE FROM races r WHERE r.id = v_id;
    ELSE
      raise_application_error(pkg_exceptions.gc_used_by_character_code,
                              v_data_not_found ||
                              ' számú karakter rendelkezik ezzel a fajjal, így nem törölhetõ!');
    END IF;
  END erease_race;

END pkg_races;
/
