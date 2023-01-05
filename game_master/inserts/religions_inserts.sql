INSERT INTO religions
  (id
  ,nev
  ,leiras)
VALUES
  (religions_seq.nextval
  ,'Angels'
  ,'Gain 1 exp for every 5 good karma points');
INSERT INTO religions
  (id
  ,nev
  ,leiras)
VALUES
  (religions_seq.nextval
  ,'Demons'
  ,'Gain 1 exp for every 10 good karma points');
INSERT INTO religions
  (id
  ,nev
  ,leiras)
VALUES
  (religions_seq.nextval
  ,'Knowledge'
  ,'Gain 1 exp for every skill you learn');

-- véglegesítés
COMMIT;

-- test
SELECT * FROM religions;
