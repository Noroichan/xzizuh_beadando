CREATE TABLE casts_h(
       cast_id NUMBER,
       cast_nev VARCHAR2(40 CHAR),
       cast_health_bonus NUMBER,
       cast_evasion_bonus NUMBER,
       cast_mana_bonus NUMBER,
       cast_speed_bonus NUMBER,
       cast_attack_bonus NUMBER,
       cast_aim_bonus NUMBER,
       cast_stealth_bonus NUMBER,
       cast_luck_bonus NUMBER,
       id NUMBER PRIMARY KEY,
       modosito_user VARCHAR2(250),
       modositasi_ido TIMESTAMP(6),
       keszito_user VARCHAR2(250),
       keszitesi_ido TIMESTAMP(6),
       dml_tipus CHAR(1),
       row_version NUMBER
);
