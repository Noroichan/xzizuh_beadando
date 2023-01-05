CREATE OR REPLACE TRIGGER trg_religions_logging
  AFTER INSERT OR UPDATE OR DELETE ON religions
  FOR EACH ROW
BEGIN
  IF deleting
  THEN
    INSERT INTO religions_h
      (religion_id
      ,religion_nev
      ,religion_leiras
      ,id
      ,modosito_user
      ,modositasi_ido
      ,keszito_user
      ,keszitesi_ido
      ,dml_tipus
      ,row_version)
    VALUES
      (:old.id
      ,:old.nev
      ,:old.leiras
      ,religions_h_seq.nextval
      ,USER
      ,systimestamp
      ,:old.keszito_user
      ,:old.keszitesi_ido
      ,'D'
      ,:old.row_version + 1);
  ELSE
    INSERT INTO religions_h
      (religion_id
      ,religion_nev
      ,religion_leiras
      ,id
      ,modosito_user
      ,modositasi_ido
      ,keszito_user
      ,keszitesi_ido
      ,dml_tipus
      ,row_version)
    VALUES
      (:new.id
      ,:new.nev
      ,:new.leiras
      ,religions_h_seq.nextval
      ,:new.modosito_user
      ,:new.modositasi_ido
      ,:new.keszito_user
      ,:new.keszitesi_ido
      ,:new.dml_tipus
      ,:new.row_version);
  END IF;
END trg_religions_logging;
/
