CREATE OR REPLACE TRIGGER trg_skills_logging
  AFTER INSERT OR UPDATE OR DELETE ON skills
  FOR EACH ROW
BEGIN
  IF deleting
  THEN
    INSERT INTO skills_h
      (skill_id
      ,skill_nev
      ,skill_mana_cost
      ,skill_leiras
      ,skill_effect_id
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
      ,:old.mana_cost
      ,:old.leiras
      ,:old.effect_id
      ,skills_h_seq.nextval
      ,USER
      ,systimestamp
      ,:old.keszito_user
      ,:old.keszitesi_ido
      ,'D'
      ,:old.row_version + 1);
  ELSE
    INSERT INTO skills_h
      (skill_id
      ,skill_nev
      ,skill_mana_cost
      ,skill_leiras
      ,skill_effect_id
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
      ,:new.mana_cost
      ,:new.leiras
      ,:new.effect_id
      ,skills_h_seq.nextval
      ,:new.modosito_user
      ,:new.modositasi_ido
      ,:new.keszito_user
      ,:new.keszitesi_ido
      ,:new.dml_tipus
      ,:new.row_version);
  END IF;
END trg_skills_logging;
/
