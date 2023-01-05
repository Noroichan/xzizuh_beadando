CREATE OR REPLACE VIEW vw_skills AS
SELECT s.id
      ,s.nev
      ,s.mana_cost
      ,s.leiras
      ,s.effect_id
  FROM skills s;
