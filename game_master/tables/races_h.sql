CREATE TABLE races_h(
       race_id NUMBER,
       race_nev VARCHAR2(40 CHAR),
       race_health_bonus NUMBER,
       race_evasion_bonus NUMBER,
       race_mana_bonus NUMBER,
       race_speed_bonus NUMBER,
       race_attack_bonus NUMBER,
       race_aim_bonus NUMBER,
       race_stealth_bonus NUMBER,
       race_luck_bonus NUMBER,
       id NUMBER PRIMARY KEY,
       modosito_user VARCHAR2(250),
       modositasi_ido TIMESTAMP(6),
       keszito_user VARCHAR2(250),
       keszitesi_ido TIMESTAMP(6),
       dml_tipus CHAR(1),
       row_version NUMBER
);
