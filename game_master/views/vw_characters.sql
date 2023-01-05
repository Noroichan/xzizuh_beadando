CREATE OR REPLACE VIEW vw_characters AS
SELECT c.id
      ,c.nev
      ,c.race_id
      ,c.cast_id
      ,c.religion_id
      ,c.health
      ,c.evasion
      ,c.mana
      ,c.speed
      ,c.attack
      ,c.aim
      ,c.stealth
      ,c.luck
  FROM characters c;
