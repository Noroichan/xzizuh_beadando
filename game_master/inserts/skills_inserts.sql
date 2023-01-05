INSERT INTO skills
  (id
  ,nev
  ,mana_cost
  ,leiras)
VALUES
  (skills_seq.nextval
  ,'Sword Strike'
  ,2
  ,'Deals base dmg + 3');
INSERT INTO skills
  (id
  ,nev
  ,mana_cost
  ,leiras
  ,effect_id)
VALUES
  (skills_seq.nextval
  ,'Dragon Breath'
  ,10
  ,'Deals 2 times the base dmg, set Burning for 3 rounds'
  ,1);
INSERT INTO skills
  (id
  ,nev
  ,leiras)
VALUES
  (skills_seq.nextval
  ,'Pick Pocket'
  ,'Steals from somebody');
INSERT INTO skills
  (id
  ,nev
  ,mana_cost
  ,leiras)
VALUES
  (skills_seq.nextval
  ,'Piercing Arrow'
  ,7
  ,'Deals 3 times the base dmg, gives 2 aim bonus');
INSERT INTO skills
  (id
  ,nev
  ,mana_cost
  ,leiras
  ,effect_id)
VALUES
  (skills_seq.nextval
  ,'Thunder Strike'
  ,4
  ,'Deals base dmg + 3, set Stunned for the next round'
  ,2);
INSERT INTO skills
  (id
  ,nev
  ,leiras
  ,effect_id)
VALUES
  (skills_seq.nextval
  ,'Poison'
  ,'Set Poisoned for until death'
  ,3);
INSERT INTO skills
  (id
  ,nev
  ,mana_cost
  ,leiras)
VALUES
  (skills_seq.nextval
  ,'Heal'
  ,3
  ,'Heals somebody by (base dmg + hp of the user) / 2 hp ');

-- véglegesít
COMMIT;

-- test
SELECT * FROM skills;
