CREATE OR REPLACE TRIGGER trg_casts_logging
  AFTER INSERT OR UPDATE OR DELETE ON casts
  FOR EACH ROW
DECLARE
  -- local variables here
BEGIN
  IF deleting
  THEN
    INSERT INTO casts_h
      (cast_id
      ,cast_nev
      ,cast_health_bonus
      ,cast_evasion_bonus
      ,cast_mana_bonus
      ,cast_speed_bonus
      ,cast_attack_bonus
      ,cast_aim_bonus
      ,cast_stealth_bonus
      ,cast_luck_bonus
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
      ,:old.health_bonus
      ,:old.evasion_bonus
      ,:old.mana_bonus
      ,:old.speed_bonus
      ,:old.attack_bonus
      ,:old.aim_bonus
      ,:old.stealth_bonus
      ,:old.luck_bonus
      ,casts_h_seq.nextval
      ,USER
      ,systimestamp
      ,:old.keszito_user
      ,:old.keszitesi_ido
      ,'D'
      ,:old.row_version + 1);
  ELSE
    INSERT INTO casts_h
      (cast_id
      ,cast_nev
      ,cast_health_bonus
      ,cast_evasion_bonus
      ,cast_mana_bonus
      ,cast_speed_bonus
      ,cast_attack_bonus
      ,cast_aim_bonus
      ,cast_stealth_bonus
      ,cast_luck_bonus
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
      ,:new.health_bonus
      ,:new.evasion_bonus
      ,:new.mana_bonus
      ,:new.speed_bonus
      ,:new.attack_bonus
      ,:new.aim_bonus
      ,:new.stealth_bonus
      ,:new.luck_bonus
      ,casts_h_seq.nextval
      ,:new.modosito_user
      ,:new.modositasi_ido
      ,:new.keszito_user
      ,:new.keszitesi_ido
      ,:new.dml_tipus
      ,:new.row_version);
  END IF;
END trg_casts_logging;
/
