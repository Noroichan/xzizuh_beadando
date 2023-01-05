-- characters
ALTER TABLE characters ADD modosito_user VARCHAR2(250);
ALTER TABLE characters ADD modositasi_ido TIMESTAMP;
ALTER TABLE characters ADD keszito_user VARCHAR2(250);
ALTER TABLE characters ADD keszitesi_ido TIMESTAMP;
ALTER TABLE characters ADD dml_tipus CHAR(1);
ALTER TABLE characters ADD row_version NUMBER;

-- races
ALTER TABLE races ADD modosito_user VARCHAR2(250);
ALTER TABLE races ADD modositasi_ido TIMESTAMP;
ALTER TABLE races ADD keszito_user VARCHAR2(250);
ALTER TABLE races ADD keszitesi_ido TIMESTAMP;
ALTER TABLE races ADD dml_tipus CHAR(1);
ALTER TABLE races ADD row_version NUMBER;

-- casts
ALTER TABLE casts ADD modosito_user VARCHAR2(250);
ALTER TABLE casts ADD modositasi_ido TIMESTAMP;
ALTER TABLE casts ADD keszito_user VARCHAR2(250);
ALTER TABLE casts ADD keszitesi_ido TIMESTAMP;
ALTER TABLE casts ADD dml_tipus CHAR(1);
ALTER TABLE casts ADD row_version NUMBER;

-- religions
ALTER TABLE religions ADD modosito_user VARCHAR2(250);
ALTER TABLE religions ADD modositasi_ido TIMESTAMP;
ALTER TABLE religions ADD keszito_user VARCHAR2(250);
ALTER TABLE religions ADD keszitesi_ido TIMESTAMP;
ALTER TABLE religions ADD dml_tipus CHAR(1);
ALTER TABLE religions ADD row_version NUMBER;

-- skills
ALTER TABLE skills ADD modosito_user VARCHAR2(250);
ALTER TABLE skills ADD modositasi_ido TIMESTAMP;
ALTER TABLE skills ADD keszito_user VARCHAR2(250);
ALTER TABLE skills ADD keszitesi_ido TIMESTAMP;
ALTER TABLE skills ADD dml_tipus CHAR(1);
ALTER TABLE skills ADD row_version NUMBER;

-- effects
ALTER TABLE effects ADD modosito_user VARCHAR2(250);
ALTER TABLE effects ADD modositasi_ido TIMESTAMP;
ALTER TABLE effects ADD keszito_user VARCHAR2(250);
ALTER TABLE effects ADD keszitesi_ido TIMESTAMP;
ALTER TABLE effects ADD dml_tipus CHAR(1);
ALTER TABLE effects ADD row_version NUMBER;
