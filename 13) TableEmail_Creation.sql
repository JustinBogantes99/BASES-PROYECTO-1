--------------CREACION TABLA EMAIL----------------------------
Create table Email(
       Email Varchar(50) Constraint Email_nn NOT Null,
       id_Identification Varchar(20) Constraint Email_Identification_nn NOT Null --Identification hace referencia a Identification de la tabla Person
);
---------- CREACION DE LA LLAVE PRIMARIA -------------------------
ALTER Table Email
      ADD Constraint pk_Email Primary Key (Email)
      Using index
      Tablespace admin_ind PCTFREE 20          --Nota: Cambiar "Proyecto_Index" por el nombre del tablaspace Index realizada anteriormente
      Storage (INITIAL 10k NEXT 10k PCTINCREASE 0);
----------- CREACION DE LLAVES FORANEAS ------------------------------     
ALTER TABLE Email
  ADD CONSTRAINT fk_email_person FOREIGN KEY
  (id_identification) REFERENCES
  Person(id_identification);
----------- COMENTARIOS DE LA TABLA ------------------------------       
Comment on table Email
is 'Repositario para almacenar la información de los emails de los Usuarios de la plataforma';
COMMENT on Column Email.Email 
is 'Email del usuario';
COMMENT on Column Email.Id_Identification 
is 'Referencia a "Identification" de la tabla "Person"';
------------ CREACION DE SEQUENCIA PARA EL ID DE CANTON-----
CREATE SEQUENCE s_email
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 10000000
NOCACHE
NOCYCLE;
---------------------CREACION DEL TRIGGER-------------------------
ALTER TABLE Email ADD created_by VARCHAR(20);
ALTER TABLE Email ADD creation_date DATE;  
COMMENT ON COLUMN Email.created_by
  IS 'Nombre del usuario que ingresó el dato al sistema';
COMMENT ON COLUMN Email.creation_date
  IS 'Fecha en la que el dato fué ingresado al sistema';
CREATE OR REPLACE TRIGGER admin.beforeInsertEmail
       BEFORE INSERT
       ON admin.Email
       FOR EACH ROW
       BEGIN 
           :new.created_by:=USER;
           :new.creation_date:=SYSDATE;
       END beforeInsertEmail;  



