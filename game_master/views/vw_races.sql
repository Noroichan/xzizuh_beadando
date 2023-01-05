CREATE OR REPLACE VIEW vw_races AS
SELECT r.id
      ,r.nev
      ,r.health_bonus
      ,r.evasion_bonus
      ,r.mana_bonus
      ,r.speed_bonus
      ,r.attack_bonus
      ,r.aim_bonus
      ,r.stealth_bonus
      ,r.luck_bonus
  FROM races r;
