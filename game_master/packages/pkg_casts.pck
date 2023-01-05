CREATE OR REPLACE PACKAGE pkg_casts IS

  FUNCTION find_cast_id_by_name(p_name VARCHAR2) RETURN NUMBER;

  PROCEDURE update_bonus_by_names(p_cast_name   VARCHAR2
                                 ,p_bonus_type  VARCHAR2
                                 ,p_bonus_value NUMBER);

  PROCEDURE add_cast(p_name VARCHAR2);

  PROCEDURE erease_cast(p_name VARCHAR2);

END pkg_casts;
/
CREATE OR REPLACE PACKAGE BODY pkg_casts IS
  v_data_not_found NUMBER;

  FUNCTION find_cast_id_by_name(p_name VARCHAR2) RETURN NUMBER IS
    v_id NUMBER;
  BEGIN
  
    SELECT COUNT(c.id)
      INTO v_data_not_found
      FROM casts c
     WHERE c.nev LIKE p_name;
  
    IF v_data_not_found = 0
    THEN
      raise_application_error(pkg_exceptions.gc_cast_not_found_code,
                              p_name || ' nevû cast nem található!');
      RETURN NULL;
    ELSE
      SELECT c.id INTO v_id FROM casts c WHERE c.nev = p_name;
      RETURN v_id;
    END IF;
  
  END find_cast_id_by_name;
  
    -----------------------------------------------------------------------------------------------------------------

  PROCEDURE update_bonus_by_names(p_cast_name   VARCHAR2
                                 ,p_bonus_type  VARCHAR2
                                 ,p_bonus_value NUMBER) IS
    v_id NUMBER;
  BEGIN
    v_id := find_cast_id_by_name(p_cast_name);
  
    CASE p_bonus_type
      WHEN 'health' THEN
        UPDATE casts c
           SET c.health_bonus = p_bonus_value
         WHERE c.id = v_id;
      WHEN 'evasion' THEN
        UPDATE casts c
           SET c.evasion_bonus = p_bonus_value
         WHERE c.id = v_id;
      WHEN 'mana' THEN
        UPDATE casts c SET c.mana_bonus = p_bonus_value WHERE c.id = v_id;
      WHEN 'speed' THEN
        UPDATE casts c SET c.speed_bonus = p_bonus_value WHERE c.id = v_id;
      WHEN 'attack' THEN
        UPDATE casts c
           SET c.attack_bonus = p_bonus_value
         WHERE c.id = v_id;
      WHEN 'aim' THEN
        UPDATE casts c SET c.aim_bonus = p_bonus_value WHERE c.id = v_id;
      WHEN 'stealth' THEN
        UPDATE casts c
           SET c.stealth_bonus = p_bonus_value
         WHERE c.id = v_id;
      WHEN 'luck' THEN
        UPDATE casts c SET c.luck_bonus = p_bonus_value WHERE c.id = v_id;
      ELSE
        raise_application_error(pkg_exceptions.gc_not_bonus_code,
                                p_bonus_type || ' nem egy bonus típusa!' ||
                                chr(10) ||
                                'Kisbetûkkel, a bonus szó nélkül!');
    END CASE;
  END update_bonus_by_names;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE add_cast(p_name VARCHAR2) IS
  BEGIN
    INSERT INTO casts (nev) VALUES (p_name);
  
  EXCEPTION
    WHEN dup_val_on_index THEN
      raise_application_error(pkg_exceptions.gc_unique_name_code,
                              p_name || ' nevû cast már létezik!' || chr(10) ||
                              'A cast-ok nevei nem egyezhetnek meg!');
  END add_cast;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE erease_cast(p_name VARCHAR2) IS
    v_id NUMBER;
  BEGIN
    v_id := find_cast_id_by_name(p_name);
  
    SELECT COUNT(c.id)
      INTO v_data_not_found
      FROM characters c
     WHERE c.cast_id = v_id;
  
    IF v_data_not_found = 0
    THEN
      DELETE FROM casts c WHERE c.id = v_id;
    ELSE
      raise_application_error(pkg_exceptions.gc_used_by_character_code,
                              v_data_not_found ||
                              ' számú karakter rendelkezik ezzel a cast-tal, így nem törölhetõ!');
    END IF;
  END erease_cast;
END pkg_casts;
/
