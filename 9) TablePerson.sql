--------------CREACION TABLA PERSONA----------------------------
Create table Person (
id_Identification Varchar(20) Constraint id_identification_nn NOT Null,
first_Name Varchar(20) Constraint Person_first_Name_nn NOT Null,
first_Last_Name Varchar(20) Constraint Person_first_Last_Name_nn NOT Null,
second_Last_Name Varchar(20) Constraint Person_second_Last_Name_nn NOT Null,
birthdate Date Constraint Person_birthday_nn NOT Null
--Photo BFILE  (PREGUNTAR SI PHOTO NO TIENE UNA TABLA APARTE)
);
---------- CREACION DE LA LLAVE PRIMARIA -------------------------
ALTER Table Person
      ADD Constraint pk_Person Primary Key (id_Identification)
      Using index
      Tablespace admin_ind PCTFREE 20          --Nota: Cambiar "Proyecto_Index" por el nombre del tablaspace Index realizada anteriormente
      Storage (INITIAL 10k NEXT 10k PCTINCREASE 0);
----------- COMENTARIOS DE LA TABLA ------------------------------     
Comment on table Person
is 'Repositario para almacenar la información de los miembros de la plataforma';
COMMENT on Column Person.id_identification 
is 'Identificación del miembro';
COMMENT on Column Person.first_name 
is 'Nombre de pila del miembro';
COMMENT on Column Person.first_Last_Name 
is 'Primer apellido del miembro';
COMMENT on Column Person.second_Last_Name 
is 'Segundo apellido del miembro';
COMMENT on Column Person.birthdate 
is 'Cumpleaños del miembro';
---------------------CREACION DEL TRIGGER-------------------------
ALTER TABLE person ADD created_by VARCHAR(20);
ALTER TABLE person ADD creation_date DATE;  
COMMENT ON COLUMN person.created_by
  IS 'Nombre del usuario que ingresó el dato al sistema';
COMMENT ON COLUMN person.creation_date
  IS 'Fecha en la que el dato fué ingresado al sistema';
CREATE OR REPLACE TRIGGER admin.beforeInsertPerson
       BEFORE INSERT
       ON admin.person
       FOR EACH ROW
       BEGIN 
           :new.created_by:=USER;
           :new.creation_date:=SYSDATE;
       END beforeInsertPerson;  

