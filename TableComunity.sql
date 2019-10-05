-------------------------------TABLE comunity------------------------------------------------
create table comunity
(
       id_Comunity number(6) CONSTRAINT comunity_id_Comunity_nn NOT null,
       name varchar2(20) CONSTRAINT comunity_name_nn NOT null
);

ALTER TABLE comunity
  ADD CONSTRAINT pk_comunity PRIMARY KEY (id_Comunity)
  USING INDEX
  TABLESPACE admin_ind PCTFREE 20
  STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);
  
  ------------ CREACION DE SEQUENCIA PARA EL ID DE CANTON-----
CREATE SEQUENCE s_comunity
  START WITH 0
  INCREMENT BY 1
  MINVALUE 0
  MAXVALUE 10000000
  NOCACHE
  NOCYCLE;
---------------------CREACION DEL TRIGGER-------------------------
ALTER TABLE comunity ADD created_by VARCHAR(20);
ALTER TABLE comunity ADD creation_date DATE;  
COMMENT ON COLUMN comunity.created_by
  IS 'Nombre del usuario que ingresó el dato al sistema';
COMMENT ON COLUMN comunity.creation_date
  IS 'Fecha en la que el dato fué ingresado al sistema';
CREATE OR REPLACE TRIGGER admin.beforeInsertComunity
       BEFORE INSERT
       ON admin.comunity
       FOR EACH ROW
       BEGIN 
           :new.created_by:=USER;
           :new.creation_date:=SYSDATE;
       END beforeInsertComunity;  


