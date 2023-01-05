CREATE OR REPLACE VIEW vw_characters_with_bonuses AS
SELECT ch.id
      ,ch.nev
      ,r.nev as race_nev
      ,c.nev as cast_nev
      ,(ch.health + r.health_bonus + c.health_bonus) AS health
      ,(ch.evasion + r.evasion_bonus + c.evasion_bonus) AS evasion
      ,(ch.mana + r.mana_bonus + c.mana_bonus) AS mana
      ,(ch.speed + r.speed_bonus + c.speed_bonus) AS speed
      ,(ch.attack + r.attack_bonus + c.attack_bonus) AS attack
      ,(ch.aim + r.aim_bonus + c.aim_bonus) AS aim
      ,(ch.stealth + r.stealth_bonus + c.stealth_bonus) AS stealth
      ,(ch.luck + r.luck_bonus + c.luck_bonus) AS luck
  FROM characters ch
 INNER JOIN races r
    ON ch.race_id = r.id
 INNER JOIN casts c
    ON ch.cast_id = c.id;
