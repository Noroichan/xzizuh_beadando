CREATE OR REPLACE VIEW vw_effects AS
SELECT e.id
      ,e.nev
      ,e.damage_per_rounds
      ,e.leiras
  FROM effects e;
