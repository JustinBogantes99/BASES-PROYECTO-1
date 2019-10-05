CREATE TABLE province(
 id_Province NUMBER(9), 
 id_Country NUMBER(9),
 name VARCHAR(20) CONSTRAINT province_name_nn NOT NULL
);

ALTER TABLE province
  ADD CONSTRAINT pk_province PRIMARY KEY (id_Province)
  USING INDEX
  TABLESPACE admin_ind PCTFREE 20
  STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0
);

ALTER TABLE province
  ADD CONSTRAINT fk_province_country FOREIGN KEY
  (id_Country) REFERENCES
  country(id_Country);

COMMENT ON TABLE province
  IS 'Repositorio para almacenar los numeros de telefonos de las personas';
  
COMMENT ON COLUMN province.id_Province
  IS 'Identificador de  la provincia';  
  
COMMENT ON COLUMN province.id_Country
  IS 'Identificador del pais';
  
COMMENT ON COLUMN province.name
  IS 'Nombre de la provincia';
  
  ------------ CREACION DE SEQUENCIA PARA EL ID DE PAIS-----
CREATE SEQUENCE s_country   
  START WITH 0
  INCREMENT BY 1
  MINVALUE 0
  MAXVALUE 10000000
  NOCACHE
  NOCYCLE;
---------------------CREACION DEL TRIGGER-------------------------
ALTER TABLE country ADD created_by VARCHAR(20);
ALTER TABLE country ADD creation_date DATE;  
COMMENT ON COLUMN country.created_by
  IS 'Nombre del usuario que ingresó el dato al sistema';
COMMENT ON COLUMN country.creation_date
  IS 'Fecha en la que el dato fué ingresado al sistema';
CREATE OR REPLACE TRIGGER admin.beforeInsertCountry
       BEFORE INSERT
       ON admin.country
       FOR EACH ROW
       BEGIN 
           :new.created_by:=USER;
           :new.creation_date:=SYSDATE;
       END beforeInsertCountry;  