CREATE OR REPLACE TRIGGER trg_races_iu_b
  BEFORE INSERT OR UPDATE ON races
  FOR EACH ROW
BEGIN
  IF inserting
  THEN
    IF :new.id IS NULL
    THEN
      :new.id := races_seq.nextval;
    END IF;
    :new.keszito_user  := USER;
    :new.keszitesi_ido := systimestamp;
    :new.dml_tipus     := 'I';
    :new.row_version   := 1;
  ELSIF updating
  THEN
    :new.dml_tipus   := 'U';
    :new.row_version := :old.row_version + 1;
  END IF;
  :new.modosito_user  := USER;
  :new.modositasi_ido := systimestamp;
END trg_races_iu_b;
/
