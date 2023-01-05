CREATE TABLE casts AS SELECT * FROM races WHERE 1=2;

COMMENT ON TABLE casts IS 'Különbözõ cast-ok és azok attribútum bónuszai';
COMMENT ON COLUMN casts.id IS 'Cast-ok azonosítója';
