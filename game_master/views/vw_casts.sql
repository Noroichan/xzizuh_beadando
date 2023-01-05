CREATE OR REPLACE VIEW vw_casts AS
SELECT c.id
      ,c.nev
      ,c.health_bonus
      ,c.evasion_bonus
      ,c.mana_bonus
      ,c.speed_bonus
      ,c.attack_bonus
      ,c.aim_bonus
      ,c.stealth_bonus
      ,c.luck_bonus
  FROM casts c;
