CREATE OR REPLACE PACKAGE pkg_religions IS

  FUNCTION find_religion_id_by_name(p_name VARCHAR2) RETURN NUMBER;

  PROCEDURE add_religion(p_name        VARCHAR2
                        ,p_description VARCHAR2);

  PROCEDURE erease_religion(p_name VARCHAR2);

  PROCEDURE change_description(p_name        VARCHAR2
                              ,p_description VARCHAR2);

END pkg_religions;
/
CREATE OR REPLACE PACKAGE BODY pkg_religions IS
  v_data_not_found NUMBER;

  FUNCTION find_religion_id_by_name(p_name VARCHAR2) RETURN NUMBER IS
    v_id NUMBER;
  BEGIN
    SELECT COUNT(r.id)
      INTO v_data_not_found
      FROM religions r
     WHERE r.nev LIKE p_name;
  
    IF v_data_not_found = 0
    THEN
      raise_application_error(pkg_exceptions.gc_religion_not_found_code,
                              p_name || ' nev� vall�s nem tal�lhat�!');
      RETURN NULL;
    ELSE
      SELECT r.id INTO v_id FROM religions r WHERE r.nev = p_name;
      RETURN v_id;
    END IF;
  END find_religion_id_by_name;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE add_religion(p_name        VARCHAR2
                        ,p_description VARCHAR2) IS
  BEGIN
    INSERT INTO religions
      (nev
      ,leiras)
    VALUES
      (p_name
      ,p_description);
  
  EXCEPTION
    WHEN dup_val_on_index THEN
      raise_application_error(pkg_exceptions.gc_unique_name_code,
                              p_name || ' nev� vall�s m�r l�tezik!' ||
                              chr(10) ||
                              'A vall�sok nevei nem egyezhetnek meg!');
  END add_religion;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE erease_religion(p_name VARCHAR2) IS
    v_id NUMBER;
  BEGIN
    v_id := find_religion_id_by_name(p_name);
  
    SELECT COUNT(c.id)
      INTO v_data_not_found
      FROM characters c
     WHERE c.religion_id = v_id;
  
    IF v_data_not_found = 0
    THEN
      DELETE FROM religions r WHERE r.id = v_id;
    ELSE
      raise_application_error(pkg_exceptions.gc_used_by_character_code,
                              v_data_not_found ||
                              ' sz�m� karakter rendelkezik ezzel a vall�ssal, �gy nem t�r�lhet�!');
    END IF;
  END erease_religion;

  -----------------------------------------------------------------------------------------------------------------

  PROCEDURE change_description(p_name        VARCHAR2
                              ,p_description VARCHAR2) IS
    v_id NUMBER;
  BEGIN
    v_id := find_religion_id_by_name(p_name);
  
    UPDATE religions r SET r.leiras = p_description WHERE r.id = v_id;
  END change_description;

END pkg_religions;
/
