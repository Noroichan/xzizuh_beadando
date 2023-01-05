CREATE OR REPLACE VIEW vw_characters_readable AS
SELECT ch.id
      ,ch.nev
      ,ra.nev as race_nev
      ,c.nev as cast_nev
      ,re.nev as religion_nev
      ,ch.health
      ,ch.evasion
      ,ch.mana
      ,ch.speed
      ,ch.attack
      ,ch.aim
      ,ch.stealth
      ,ch.luck
  FROM characters ch
 INNER JOIN races ra
    ON ch.race_id = ra.id
 INNER JOIN casts c
    ON ch.cast_id = c.id
 INNER JOIN religions re
    ON ch.religion_id = re.id;
