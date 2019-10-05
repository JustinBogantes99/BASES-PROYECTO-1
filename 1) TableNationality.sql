--------- CREACION TABLA NACIONALIDAD ----------------------------
CREATE TABLE nationality(
 id_Nationality NUMBER(4),
 nationality_Name VARCHAR(20) CONSTRAINT nationality_name_nn NOT NULL
);
---------- CREACION DE LA LLAVE PRIMARIA -------------------------
ALTER TABLE nationality
  ADD CONSTRAINT pk_nationality PRIMARY KEY (id_Nationality)
  USING INDEX
  TABLESPACE admin_ind PCTFREE 20
  STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0
);
----------- COMENTARIOS DE LA TABLA ------------------------------
COMMENT ON TABLE nationality
  IS 'Repositorio para almacenar la informacion de las nacionalidades de las personas';
COMMENT ON COLUMN nationality.id_Nationality
  IS 'Codigo para diferenciar las distintas nacionalidades';  
COMMENT ON COLUMN nationality.name
  IS 'Nombre de las distintas nacionalidades';
------------ CREACION DE SEQUENCIA PARA EL ID DE NACIONALIDAD-----
CREATE SEQUENCE s_nationality   
  START WITH 0
  INCREMENT BY 1
  MINVALUE 0
  MAXVALUE 10000000
  NOCACHE
  NOCYCLE;
---------------------CREACION DEL TRIGGER-------------------------
ALTER TABLE nationality ADD created_by VARCHAR(20);
ALTER TABLE nationality ADD creation_date DATE;  
COMMENT ON COLUMN nationality.created_by
  IS 'Nombre del usuario que ingresó el dato al sistema';
COMMENT ON COLUMN nationality.creation_date
  IS 'Fecha en la que el dato fué ingresado al sistema';
CREATE OR REPLACE TRIGGER admin.beforeInsertNationality
       BEFORE INSERT
       ON admin.nationality
       FOR EACH ROW
       BEGIN 
           :new.created_by:=USER;
           :new.creation_date:=SYSDATE;
       END beforeInsertNationality;
