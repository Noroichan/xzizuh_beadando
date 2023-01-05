INSERT INTO races
  (id
  ,nev
  ,speed_bonus
  ,luck_bonus)
VALUES
  (races_seq.nextval
  ,'Human'
  ,1
  ,2);
INSERT INTO races
  (id
  ,nev
  ,evasion_bonus
  ,mana_bonus)
VALUES
  (races_seq.nextval
  ,'Elf'
  ,1
  ,2);
INSERT INTO races
  (id
  ,nev
  ,health_bonus
  ,luck_bonus)
VALUES
  (races_seq.nextval
  ,'Dwarf'
  ,2
  ,1);
INSERT INTO races
  (id
  ,nev
  ,health_bonus
  ,attack_bonus)
VALUES
  (races_seq.nextval
  ,'Orc'
  ,1
  ,2);
INSERT INTO races
  (id
  ,nev
  ,health_bonus
  ,mana_bonus
  ,luck_bonus)
VALUES
  (races_seq.nextval
  ,'Slime'
  ,1
  ,1
  ,1);

-- véglegesítés
COMMIT;

-- test
SELECT * FROM races;
