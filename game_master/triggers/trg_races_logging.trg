CREATE OR REPLACE TRIGGER trg_races_logging
  AFTER INSERT OR UPDATE OR DELETE ON races
  FOR EACH ROW
BEGIN
  IF deleting
  THEN
    INSERT INTO races_h
      (race_id
      ,race_nev
      ,race_health_bonus
      ,race_evasion_bonus
      ,race_mana_bonus
      ,race_speed_bonus
      ,race_attack_bonus
      ,race_aim_bonus
      ,race_stealth_bonus
      ,race_luck_bonus
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
      ,races_h_seq.nextval
      ,USER
      ,systimestamp
      ,:old.keszito_user
      ,:old.keszitesi_ido
      ,'D'
      ,:old.row_version + 1);
  ELSE
    INSERT INTO races_h
      (race_id
      ,race_nev
      ,race_health_bonus
      ,race_evasion_bonus
      ,race_mana_bonus
      ,race_speed_bonus
      ,race_attack_bonus
      ,race_aim_bonus
      ,race_stealth_bonus
      ,race_luck_bonus
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
      ,races_h_seq.nextval
      ,:new.modosito_user
      ,:new.modositasi_ido
      ,:new.keszito_user
      ,:new.keszitesi_ido
      ,:new.dml_tipus
      ,:new.row_version);
  END IF;
END trg_races_logging;
/
