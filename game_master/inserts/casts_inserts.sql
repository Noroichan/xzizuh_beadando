INSERT INTO casts
  (id
  ,nev
  ,health_bonus
  ,attack_bonus)
VALUES
  (casts_seq.nextval
  ,'Warrior'
  ,1
  ,2);
INSERT INTO casts
  (id
  ,nev
  ,aim_bonus
  ,luck_bonus)
VALUES
  (casts_seq.nextval
  ,'Archer'
  ,2
  ,1);
INSERT INTO casts
  (id
  ,nev
  ,mana_bonus
  ,attack_bonus
  ,aim_bonus)
VALUES
  (casts_seq.nextval
  ,'Mage'
  ,1
  ,1
  ,1);
INSERT INTO casts
  (id
  ,nev
  ,health_bonus
  ,mana_bonus)
VALUES
  (casts_seq.nextval
  ,'Priest'
  ,1
  ,2);

-- véglegesítés
COMMIT;

-- test
SELECT * FROM casts;
