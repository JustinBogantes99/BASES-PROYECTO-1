--------------CREACION TABLA PROVINCIA----------------------------
CREATE TABLE province(
 id_Province NUMBER(9), 
 id_Country NUMBER(9),
 name VARCHAR(20) CONSTRAINT province_name_nn NOT NULL
);
---------- CREACION DE LA LLAVE PRIMARIA -------------------------
ALTER TABLE province
  ADD CONSTRAINT pk_province PRIMARY KEY (id_Province)
  USING INDEX
  TABLESPACE admin_ind PCTFREE 20
  STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0
);
---------- CREACION DE LA LLAVE FORANEA -------------------------
ALTER TABLE province
  ADD CONSTRAINT fk_province_country FOREIGN KEY
  (id_Country) REFERENCES
  country(id_Country);
----------- COMENTARIOS DE LA TABLA ------------------------------
COMMENT ON TABLE province
  IS 'Repositorio para almacenar las diferentes provincias'; 
COMMENT ON COLUMN province.id_Province
  IS 'Identificador de la provincia';  
COMMENT ON COLUMN province.id_Country
  IS 'Identificador del pais (Llave for�nea)';
COMMENT ON COLUMN province.name
  IS 'Nombre de la provincia';
------------ CREACION DE SEQUENCIA PARA EL ID DE PROVINCIA-----
CREATE SEQUENCE s_province  
  START WITH 0
  INCREMENT BY 1
  MINVALUE 0
  MAXVALUE 10000000
  NOCACHE
  NOCYCLE;
---------------------CREACION DEL TRIGGER-------------------------
ALTER TABLE province ADD created_by VARCHAR(20);
ALTER TABLE province ADD creation_date DATE;  
COMMENT ON COLUMN province.created_by
  IS 'Nombre del usuario que ingres� el dato al sistema';
COMMENT ON COLUMN province.creation_date
  IS 'Fecha en la que el dato fu� ingresado al sistema';
CREATE OR REPLACE TRIGGER admin.beforeInsertProvince
       BEFORE INSERT
       ON admin.province
       FOR EACH ROW
       BEGIN 
           :new.created_by:=USER;
           :new.creation_date:=SYSDATE;
       END beforeInsertProvince;  
