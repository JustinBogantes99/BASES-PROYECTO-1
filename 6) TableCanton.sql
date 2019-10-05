--------------CREACION TABLA CANTON----------------------------
create table canton (
       id_canton number(6)CONSTRAINT id_canton_nn NOT null,
       name varchar2(20)CONSTRAINT canton_name_nn NOT null,
       id_Comunity number(6)CONSTRAINT id_Comunity_nn NOT null,
       id_province number(6)CONSTRAINT id_province_nn NOT null
);
---------- CREACION DE LA LLAVE PRIMARIA -------------------------
ALTER TABLE canton
  ADD CONSTRAINT pk_canton PRIMARY KEY (id_canton)
  USING INDEX
  TABLESPACE admin_ind PCTFREE 20
  STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);
---------- CREACION DE LAS LLAVE FORANEA -------------------------
ALTER TABLE canton
  ADD CONSTRAINT fk_canton_Comunity FOREIGN KEY
  (id_Comunity) REFERENCES
  comunity(id_Comunity);
ALTER TABLE canton
  ADD CONSTRAINT fk_canton_province FOREIGN KEY
  (id_province) REFERENCES
  province(id_province);
----------- COMENTARIOS DE LA TABLA ------------------------------
COMMENT ON TABLE canton
  IS 'Repositorio para almacenar los diferentes cantones'; 
COMMENT ON COLUMN canton.id_Canton
  IS 'Identificador del canton';  
COMMENT ON COLUMN canton.name
  IS 'Nombre del canton';
COMMENT ON COLUMN canton.id_Comunity
  IS 'Identificador de la comunidad (Llave foranea)';
COMMENT ON COLUMN canton.id_Province
  IS 'Identificador de la Provincia a la que pertenece (Llave foranea)';
------------ CREACION DE SEQUENCIA PARA EL ID DE CANTON-----
CREATE SEQUENCE s_canton
  START WITH 0
  INCREMENT BY 1
  MINVALUE 0
  MAXVALUE 10000000
  NOCACHE
  NOCYCLE;
---------------------CREACION DEL TRIGGER-------------------------
ALTER TABLE canton ADD created_by VARCHAR(20);
ALTER TABLE canton ADD creation_date DATE;  
COMMENT ON COLUMN canton.created_by
  IS 'Nombre del usuario que ingresó el dato al sistema';
COMMENT ON COLUMN canton.creation_date
  IS 'Fecha en la que el dato fué ingresado al sistema';
CREATE OR REPLACE TRIGGER admin.beforeInsertCanton
       BEFORE INSERT
       ON admin.canton
       FOR EACH ROW
       BEGIN 
           :new.created_by:=USER;
           :new.creation_date:=SYSDATE;
       END beforeInsertCanton;  

