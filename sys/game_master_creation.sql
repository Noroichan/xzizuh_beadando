DECLARE
  l_cnt NUMBER;
BEGIN
  SELECT COUNT(*) INTO l_cnt FROM dba_users t WHERE t.username='GAME_MASTER';
  IF l_cnt=1 THEN 
    EXECUTE IMMEDIATE 'DROP USER game_master CASCADE';
  END IF;
END;
/
CREATE USER game_master
IDENTIFIED BY dndfanboy
DEFAULT TABLESPACE USERS
QUOTA UNLIMITED ON users
;

GRANT CREATE SESSION TO game_master;
GRANT CREATE TABLE TO game_master;
GRANT CREATE VIEW TO game_master;
GRANT CREATE SEQUENCE TO game_master;
GRANT CREATE PROCEDURE TO game_master;
GRANT CREATE TRIGGER TO game_master;
GRANT CREATE TYPE TO game_master;
GRANT EXECUTE ON dbms_lock TO game_master;
