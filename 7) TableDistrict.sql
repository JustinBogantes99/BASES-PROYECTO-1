--------------CREACION TABLA DISTRITO----------------------------
create table district (
       id_district number(6) CONSTRAINT id_district_nn NOT null,
       name varchar2(20) CONSTRAINT district_name_nn NOT null,
       id_canton number(6) CONSTRAINT id_district_canton_nn NOT null
);
---------- CREACION DE LA LLAVE PRIMARIA -------------------------
ALTER TABLE district
  ADD CONSTRAINT pk_district PRIMARY KEY (id_district)
  USING INDEX
  TABLESPACE admin_ind PCTFREE 20
  STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);
---------- CREACION DE LAS LLAVE FORANEA -------------------------
ALTER TABLE district
  ADD CONSTRAINT fk_district_canton FOREIGN KEY
  (id_canton) REFERENCES
  canton(id_canton);
----------- COMENTARIOS DE LA TABLA ------------------------------
COMMENT ON TABLE district
  IS 'Repositorio para almacenar los diferentes distritos'; 
COMMENT ON COLUMN district.id_District
  IS 'Identificador del distrito';  
COMMENT ON COLUMN district.name
  IS 'Nombre del distrito';
COMMENT ON COLUMN district.id_Canton
  IS 'Identificador del canton al que pertenece (Llave foranea)';
------------ CREACION DE SEQUENCIA PARA EL ID DE CANTON-----
CREATE SEQUENCE s_district
  START WITH 0
  INCREMENT BY 1
  MINVALUE 0
  MAXVALUE 10000000
  NOCACHE
  NOCYCLE;
---------------------CREACION DEL TRIGGER-------------------------
ALTER TABLE district ADD created_by VARCHAR(20);
ALTER TABLE district ADD creation_date DATE;  
COMMENT ON COLUMN district.created_by
  IS 'Nombre del usuario que ingresó el dato al sistema';
COMMENT ON COLUMN district.creation_date
  IS 'Fecha en la que el dato fué ingresado al sistema';
CREATE OR REPLACE TRIGGER admin.beforeInsertDistrict
       BEFORE INSERT
       ON admin.district
       FOR EACH ROW
       BEGIN 
           :new.created_by:=USER;
           :new.creation_date:=SYSDATE;
       END beforeInsertDistrict;  


