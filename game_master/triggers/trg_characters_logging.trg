CREATE OR REPLACE TRIGGER trg_characters_logging
  AFTER INSERT OR UPDATE OR DELETE ON characters
  FOR EACH ROW
BEGIN
  IF deleting
  THEN
    INSERT INTO characters_h
      (character_id
      ,character_nev
      ,character_race_id
      ,character_cast_id
      ,character_religion_id
      ,character_health
      ,character_evasion
      ,character_mana
      ,character_speed
      ,character_attack
      ,character_aim
      ,character_stealth
      ,character_luck
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
      ,:old.race_id
      ,:old.cast_id
      ,:old.religion_id
      ,:old.health
      ,:old.evasion
      ,:old.mana
      ,:old.speed
      ,:old.attack
      ,:old.aim
      ,:old.stealth
      ,:old.luck
      ,characters_h_seq.nextval
      ,USER
      ,systimestamp
      ,:old.keszito_user
      ,:old.keszitesi_ido
      ,'D'
      ,:old.row_version + 1);
  ELSE
    INSERT INTO characters_h
      (character_id
      ,character_nev
      ,character_race_id
      ,character_cast_id
      ,character_religion_id
      ,character_health
      ,character_evasion
      ,character_mana
      ,character_speed
      ,character_attack
      ,character_aim
      ,character_stealth
      ,character_luck
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
      ,:new.race_id
      ,:new.cast_id
      ,:new.religion_id
      ,:new.health
      ,:new.evasion
      ,:new.mana
      ,:new.speed
      ,:new.attack
      ,:new.aim
      ,:new.stealth
      ,:new.luck
      ,characters_h_seq.nextval
      ,:new.modosito_user
      ,:new.modositasi_ido
      ,:new.keszito_user
      ,:new.keszitesi_ido
      ,:new.dml_tipus
      ,:new.row_version);
  END IF;
END trg_characters_logging;
/
