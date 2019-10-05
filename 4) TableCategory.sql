--------------CREACION TABLA CATEGORIA----------------------------
CREATE TABLE category(
 id_Category NUMBER(4), 
 category_name VARCHAR(20) CONSTRAINT category_name_nn NOT NULL
);
---------- CREACION DE LA LLAVE PRIMARIA -------------------------
ALTER TABLE category
  ADD CONSTRAINT pk_category PRIMARY KEY (id_Category)
  USING INDEX
  TABLESPACE admin_ind PCTFREE 20
  STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0
);
----------- COMENTARIOS DE LA TABLA ------------------------------
COMMENT ON TABLE category
  IS 'Repositorio para almacenar la informacion de las categorias de las propuestas';
COMMENT ON COLUMN category.id_Category
  IS 'Codigo para diferenciar las distintas categorias';  
COMMENT ON COLUMN category.name
  IS 'Nombre de las distintas categorias';
------------ CREACION DE SEQUENCIA PARA EL ID DE CATEGORIA-----
CREATE SEQUENCE s_category   
  START WITH 0
  INCREMENT BY 1
  MINVALUE 0
  MAXVALUE 10000000
  NOCACHE
  NOCYCLE;
---------------------CREACION DEL TRIGGER-------------------------
ALTER TABLE category ADD created_by VARCHAR(20);
ALTER TABLE category ADD creation_date DATE;  
COMMENT ON COLUMN category.created_by
  IS 'Nombre del usuario que ingresó el dato al sistema';
COMMENT ON COLUMN category.creation_date
  IS 'Fecha en la que el dato fué ingresado al sistema';
CREATE OR REPLACE TRIGGER admin.beforeInsertCategory
       BEFORE INSERT
       ON admin.category
       FOR EACH ROW
       BEGIN 
           :new.created_by:=USER;
           :new.creation_date:=SYSDATE;
       END beforeInsertCategory;  
