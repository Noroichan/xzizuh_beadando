CREATE OR REPLACE VIEW vw_skills_and_effects AS
SELECT s.id
      ,s.nev
      ,s.mana_cost
      ,s.leiras
      ,e.nev as effect_nev
      ,e.damage_per_rounds
      ,e.leiras as effect_leiras
  FROM skills s
 RIGHT JOIN effects e
    ON s.effect_id = e.id;
