--------------CREACION TABLA USUARIO----------------------------
create table User_Name(
       username varchar2(20) CONSTRAINT username_nn NOT null,
       id_identification varchar(20) CONSTRAINT Usuario_identification_nn NOT NULL,
       Id_user_type number(6) CONSTRAINT Usuario_Usertype_nn NOT NULL,
       id_favorite number(6) Constraint Usuario_id_Favorite_nn NOT Null,
       password varchar2(20)CONSTRAINT Usuario_password_nn NOT NULL
);
---------- CREACION DE LA LLAVE PRIMARIA -------------------------
ALTER TABLE User_Name
  ADD CONSTRAINT pk_User_name PRIMARY KEY (username)
  USING INDEX
  TABLESPACE admin_ind PCTFREE 20
  STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0
);
----------- CREACION DE LLAVES FORANEAS ------------------------------     
ALTER TABLE User_Name
  ADD CONSTRAINT fk_User_person FOREIGN KEY
  (id_identification) REFERENCES
  Person(id_identification);
ALTER TABLE User_Name
    ADD CONSTRAINT fk_User_User_Type FOREIGN KEY
    (id_User_Type ) REFERENCES
    User_Type(id_User_Type );
ALTER TABLE User_Name
    ADD CONSTRAINT fk_User_Favorite FOREIGN KEY 
    (id_Favorite) REFERENCES
    Favorite(id_Favorite);
----------- COMENTARIOS DE LA TABLA ------------------------------     
Comment on table User_Name
is 'Repositario para almacenar los distintos usuarios del sistema';
COMMENT on Column User_Name.id_User_Type 
is 'Identificación del tipo de usuario';
COMMENT on Column User_Name.userName 
is 'Nombre del usuario';
COMMENT on Column User_Name.id_identification 
is 'Identificacion de la persona a la que esta asociado el usuario';
COMMENT on Column User_Name.password
is 'Contraseña del usuario';
COMMENT on Column User_Name.id_favorite
is 'Identificacion de la categoria favorita';
---------------------CREACION DEL TRIGGER-------------------------
ALTER TABLE User_Name ADD created_by VARCHAR(20);
ALTER TABLE User_Name ADD creation_date DATE;  
COMMENT ON COLUMN User_Name.created_by
  IS 'Nombre del usuario que ingresó el dato al sistema';
COMMENT ON COLUMN User_Name.creation_date
  IS 'Fecha en la que el dato fué ingresado al sistema';
CREATE OR REPLACE TRIGGER admin.beforeInsertUser_Name
       BEFORE INSERT
       ON admin.User_Name
       FOR EACH ROW
       BEGIN 
           :new.created_by:=USER;
           :new.creation_date:=SYSDATE;
       END beforeInsertUser_Name;  


