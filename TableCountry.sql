CREATE TABLE country(
 id_Country NUMBER(4), 
 name VARCHAR(20) CONSTRAINT country_name_nn NOT NULL
);

ALTER TABLE country
  ADD CONSTRAINT pk_country PRIMARY KEY (id_Country)
  USING INDEX
  TABLESPACE admin_ind PCTFREE 20
  STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0
);

COMMENT ON TABLE country
  IS 'Repositorio para almacenar la informacion de los distintos paises';
  
COMMENT ON COLUMN country.id_Country
  IS 'Codigo para diferenciar los distintos paises';  
  
COMMENT ON COLUMN country.name
  IS 'Nombre de los distintos paises';
  
  
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
