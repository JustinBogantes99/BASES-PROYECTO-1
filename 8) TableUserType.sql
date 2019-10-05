--------------CREACION TABLA TIPO DE USUARIO----------------------------
Create table User_Type(
id_User_Type Number(10) Constraint User_Type_id NOT Null,
Name Varchar(20) Constraint User_Type_Name_nn NOT Null
);
---------- CREACION DE LA LLAVE PRIMARIA -------------------------
ALTER Table User_Type
      ADD Constraint pk_User_Type Primary Key (id_User_Type)
      Using index
      Tablespace admin_ind PCTFREE 20          --Nota: Cambiar "Proyecto_Index" por el nombre del tablaspace Index realizada anteriormente
      Storage (INITIAL 10k NEXT 10k PCTINCREASE 0);    
----------- COMENTARIOS DE LA TABLA ------------------------------     
Comment on table User_Type
is 'Repositario para almacenar la información de los tipos de Usuarios de la plataforma';
COMMENT on Column User_Type.id_User_Type 
is 'Identificación del tipo de usuario';
COMMENT on Column User_Type.Name 
is 'Nombre del tipo de usuario';
------------ CREACION DE SEQUENCIA PARA EL ID DE CATEGORIA-----
CREATE SEQUENCE s_user_type  
  START WITH 0
  INCREMENT BY 1
  MINVALUE 0
  MAXVALUE 10000000
  NOCACHE
  NOCYCLE;
---------------------CREACION DEL TRIGGER-------------------------
ALTER TABLE user_Type ADD created_by VARCHAR(20);
ALTER TABLE user_Type ADD creation_date DATE;  
COMMENT ON COLUMN user_Type.created_by
  IS 'Nombre del usuario que ingresó el dato al sistema';
COMMENT ON COLUMN user_Type.creation_date
  IS 'Fecha en la que el dato fué ingresado al sistema';
CREATE OR REPLACE TRIGGER admin.beforeInsertUser_Type
       BEFORE INSERT
       ON admin.user_Type
       FOR EACH ROW
       BEGIN 
           :new.created_by:=USER;
           :new.creation_date:=SYSDATE;
       END beforeInsertUser_Type;  


