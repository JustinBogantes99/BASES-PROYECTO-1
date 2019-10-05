--------------CREACION TABLA PARAMETERIZABLE----------------------------
CREATE TABLE parameterizable(
 id_Parameterizable NUMBER(4), 
 name VARCHAR(20) CONSTRAINT parameterizable_name_nn NOT NULL,
 value NUMBER(3) CONSTRAINT parameterizable_value_nn NOT NULL
);
---------- CREACION DE LA LLAVE PRIMARIA -------------------------
ALTER TABLE parameterizable
  ADD CONSTRAINT pk_parameterizable PRIMARY KEY (id_Parameterizable)
  USING INDEX
  TABLESPACE admin_ind PCTFREE 20
  STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0
);
----------- COMENTARIOS DE LA TABLA ------------------------------
COMMENT ON TABLE parameterizable
  IS 'Repositorio para almacenar la informacion de los distintos valores parametrizables para ver reportes';  
COMMENT ON COLUMN parameterizable.id_Parameterizable
  IS 'Codigo para diferenciar los distintos codigos de parametrizables';    
COMMENT ON COLUMN parameterizable.name
  IS 'Nombre de los distintos parametrizables'; 
COMMENT ON COLUMN parameterizable.value
  IS 'Valor de los distintos parametrizables';
------------ CREACION DE SEQUENCIA PARA EL ID DE CANTON-----
CREATE SEQUENCE s_parameterizable
  START WITH 0
  INCREMENT BY 1
  MINVALUE 0
  MAXVALUE 10000000
  NOCACHE
  NOCYCLE;
---------------------CREACION DEL TRIGGER-------------------------
ALTER TABLE parameterizable ADD created_by VARCHAR(20);
ALTER TABLE parameterizable ADD creation_date DATE;  
COMMENT ON COLUMN parameterizable.created_by
  IS 'Nombre del usuario que ingresó el dato al sistema';
COMMENT ON COLUMN parameterizable.creation_date
  IS 'Fecha en la que el dato fué ingresado al sistema';
CREATE OR REPLACE TRIGGER admin.beforeInsertParameterizable
       BEFORE INSERT
       ON admin.parameterizable
       FOR EACH ROW
       BEGIN 
           :new.created_by:=USER;
           :new.creation_date:=SYSDATE;
       END beforeInsertParameterizable;  

