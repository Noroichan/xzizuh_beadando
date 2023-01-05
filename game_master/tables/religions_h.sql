CREATE TABLE religions_h(
       religion_id NUMBER,
       religion_nev VARCHAR2(40 CHAR),
       religion_leiras VARCHAR2(4000 CHAR),
       id NUMBER PRIMARY KEY,
       modosito_user VARCHAR2(250),
       modositasi_ido TIMESTAMP(6),
       keszito_user VARCHAR2(250),
       keszitesi_ido TIMESTAMP(6),
       dml_tipus CHAR(1),
       row_version NUMBER
);
