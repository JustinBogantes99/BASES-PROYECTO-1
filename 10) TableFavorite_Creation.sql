--------------CREACION TABLA FAVORITO----------------------------
Create table Favorite (
       id_Favorite Number(6) Constraint id_Favorite_nn NOT Null
);
---------- CREACION DE LA LLAVE PRIMARIA -------------------------
ALTER Table Favorite
      ADD Constraint pk_Favorite Primary Key (id_Favorite)
      Using index
      Tablespace admin_ind PCTFREE 20          --Nota: Cambiar "Proyecto_Index" por el nombre del tablaspace Index realizada anteriormente
      Storage (INITIAL 10k NEXT 10k PCTINCREASE 0);
----------- COMENTARIOS DE LA TABLA ------------------------------         
Comment on table Favorite
is 'Repositario para almacenar la informaci�n de la lista de categor�as Favoritas de los usuarios';
COMMENT on Column Favorite.id_Favorite 
is 'Identificaci�n de la lista de Categor�as Favoritas';
---------------------CREACION DEL TRIGGER-------------------------
ALTER TABLE Favorite ADD created_by VARCHAR(20);
ALTER TABLE Favorite ADD creation_date DATE;  
COMMENT ON COLUMN Favorite.created_by
  IS 'Nombre del usuario que ingres� el dato al sistema';
COMMENT ON COLUMN Favorite.creation_date
  IS 'Fecha en la que el dato fu� ingresado al sistema';
CREATE OR REPLACE TRIGGER admin.beforeInsertFavorite
       BEFORE INSERT
       ON admin.Favorite
       FOR EACH ROW
       BEGIN 
           :new.created_by:=USER;
           :new.creation_date:=SYSDATE;
       END beforeInsertFavorite;  

