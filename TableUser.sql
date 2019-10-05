-------------------------TABLE USUARIO------------------------------------
create table Usuario(
       username varchar2(20) CONSTRAINT Usuario_username_nn NOT null,
       identification number(6) CONSTRAINT Usuario_identification_nn NOT NULL,
       Id_user_type varchar2(20) CONSTRAINT Usuario_usertype_nn NOT NULL,
       id_favorite number(6) Constraint Usuario_id_Favorite_nn NOT Null,
       password varchar2(20)CONSTRAINT Usuario_password_nn NOT NULL
);


ALTER TABLE Usuario
  ADD CONSTRAINT pk_Usuario PRIMARY KEY (username)
  USING INDEX
  TABLESPACE admin_ind PCTFREE 20
  STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0
);
-----------revisar pa bajo
ALTER TABLE Usuario
  ADD CONSTRAINT fk_Usuario_Person FOREIGN KEY
  (identification) REFERENCES
  Person(identification);

ALTER TABLE Usuario
    ADD CONSTRAINT fk_Usuario_User_Type FOREIGN KEY
    (id_User_Type ) REFERENCES
    User_Type(id_User_Type );

ALTER TABLE Usuario
    ADD CONSTRAINT fk_Usuario_Favorite FOREIGN KEY
    (id_Favorite) REFERENCES
    Favorite(id_Favorite);
 
   
    
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
