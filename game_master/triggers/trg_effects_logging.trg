CREATE OR REPLACE TRIGGER trg_effects_logging
  AFTER INSERT OR UPDATE OR DELETE ON effects
  FOR EACH ROW
BEGIN
  IF deleting
  THEN
    INSERT INTO effects_h
      (effect_id
      ,effect_nev
      ,effect_damage_per_rounds
      ,effect_leiras
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
      ,:old.damage_per_rounds
      ,:old.leiras
      ,effect_h_seq.nextval
      ,USER
      ,systimestamp
      ,:old.keszito_user
      ,:old.keszitesi_ido
      ,'D'
      ,:old.row_version + 1);
  ELSE
    INSERT INTO effects_h
      (effect_id
      ,effect_nev
      ,effect_damage_per_rounds
      ,effect_leiras
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
      ,:new.damage_per_rounds
      ,:new.leiras
      ,effect_h_seq.nextval
      ,:new.modosito_user
      ,:new.modositasi_ido
      ,:new.keszito_user
      ,:new.keszitesi_ido
      ,:new.dml_tipus
      ,:new.row_version);
  END IF;
END trg_effects_logging;
/
