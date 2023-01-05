INSERT INTO effects
  (id
  ,nev
  ,damage_per_rounds
  ,leiras)
VALUES
  (effect_seq.nextval
  ,'Burning'
  ,3
  ,'Deals dmg every round');
INSERT INTO effects
  (id
  ,nev
  ,damage_per_rounds
  ,leiras)
VALUES
  (effect_seq.nextval
  ,'Stun'
  ,2
  ,'Until effect is active, the victim is unable to move');
INSERT INTO effects
  (id
  ,nev
  ,damage_per_rounds
  ,leiras)
VALUES
  (effect_seq.nextval
  ,'Poison'
  ,1
  ,'Deals dmg every round');

-- véglegesít
COMMIT;

-- test
SELECT * FROM effects;
