---------------------------------------------Table Person-----------------------------------------------------------------------
Create table Person
(
Identification Varchar(20) Constraint Person_Identification_nn NOT Null,
first_Name Varchar(20) Constraint Person_first_Name_nn NOT Null,
first_Last_Name Varchar(20) Constraint Person_first_Last_Name_nn NOT Null,
second_Last_Name Varchar(20) Constraint Person_second_Last_Name_nn NOT Null,
birthdate Date Constraint Person_birthday_nn NOT Null,
Photo BFILE
)

ALTER Table Person
      ADD Constraint pk_Person Primary Key (Identification)
      Using index
      Tablespace Proyecto_Index PCTFREE 20          --Nota: Cambiar "Proyecto_Index" por el nombre del tablaspace Index realizada anteriormente
      Storage (INITIAL 10k NEXT 10k PCTINCREASE 0);


--Comentario sobre la Tabla Person      
Comment on table Person
is 'Repositario para almacenar la información de los miembros de la plataforma';

--Comentario sobre cada Columna de Tabla Person
COMMENT on Column Person.Identification 
is 'Identificación del miembro';

COMMENT on Column Person.first_name 
is 'Nombre de pila del miembro';

COMMENT on Column Person.first_Last_Name 
is 'Primer apellido del miembro';

COMMENT on Column Person.second_Last_Name 
is 'Segundo apellido del miembro';

COMMENT on Column Person.birthdate 
is 'Cumpleaños del miembro';

COMMENT on Column Person.Photo 
is 'Foto de perfil del miembro';


---------------------------------------------Table User_Type--------------------------------------------------------------------
Create table User_Type
(
id_User_Type Number(10) Constraint User_Type_id_User_Type_nn NOT Null,
Name Varchar(20) Constraint User_Type_Name_nn NOT Null
)

ALTER Table User_Type
      ADD Constraint pk_User_Type Primary Key (id_User_Type)
      Using index
      Tablespace Proyecto_Index PCTFREE 20          --Nota: Cambiar "Proyecto_Index" por el nombre del tablaspace Index realizada anteriormente
      Storage (INITIAL 10k NEXT 10k PCTINCREASE 0);
      
      
--Comentario sobre la Tabla User_Type      
Comment on table User_Type
is 'Repositario para almacenar la información de los tipos de Usuarios de la plataforma';

--Comentario sobre cada Columna de Tabla User_Type
COMMENT on Column User_Type.id_User_Type 
is 'Identificación del tipo de usuario';

COMMENT on Column User_Type.Name 
is 'Nombre del tipo de usuario';


---------------------------------------------Table Favorite---------------------------------------------------------------------
Create table Favorite
(
id_Favorite Number(10) Constraint Favorite_id_Favorite_nn NOT Null
)

ALTER Table Favorite
      ADD Constraint pk_Favorite Primary Key (id_Favorite)
      Using index
      Tablespace Proyecto_Index PCTFREE 20          --Nota: Cambiar "Proyecto_Index" por el nombre del tablaspace Index realizada anteriormente
      Storage (INITIAL 10k NEXT 10k PCTINCREASE 0);
      

--Comentario sobre la Tabla Favorite      
Comment on table Favorite
is 'Repositario para almacenar la información de la lista de categorías Favoritas de los usuarios';

--Comentario sobre cada Columna de Tabla Favorite
COMMENT on Column Favorite.id_Favorite 
is 'Identificación de la lista de Categorías Favoritas';


---------------------------------------------Table Email------------------------------------------------------------------------
Create table Email
(
Email Varchar(50) Constraint Email_Email_nn NOT Null,
Identification Varchar(20) Constraint Email_Identification_nn NOT Null --Identification hace referencia a Identification de la tabla Person
)

ALTER Table Email
      ADD Constraint pk_Email Primary Key (Email)
      Using index
      Tablespace Proyecto_Index PCTFREE 20          --Nota: Cambiar "Proyecto_Index" por el nombre del tablaspace Index realizada anteriormente
      Storage (INITIAL 10k NEXT 10k PCTINCREASE 0);


--Comentario sobre la Tabla Email      
Comment on table Email
is 'Repositario para almacenar la información de los emails de los Usuarios de la plataforma';

--Comentario sobre cada Columna de Tabla Email
COMMENT on Column Email.Email 
is 'Email del usuario';

COMMENT on Column Email.Identification 
is 'Referencia a "Identification" de la tabla "Person"';


---------------------------------------------Table Proposal---------------------------------------------------------------------
Create table Proposal
(
id_Proposal Number(10) Constraint Proposal_id_Proposal_nn NOT Null,
id_Category Number(10) Constraint Proposal_id_Category_nn NOT Null,         --id_Category hace referencia a id_Category de la tabla Category
username Varchar(50) Constraint Proposal_username_nn NOT Null,              --username hace referencia a username de la tabla User
Identification Varchar(20) Constraint Proposal_Identification_nn NOT Null,  --Identification hace referencia a Identification de la tabla Person
id_Comunity Number(10)Constraint Proposal_id_Comunity_nn NOT Null,          --id_Comunity hace referencia a id_Comunity de la tabla Comunity
Title Varchar(50) Constraint Proposal_Title_nn NOT Null,
Description Varchar(3000) Constraint Proposal_Description_nn NOT Null,
post_Date Date Constraint Proposal_post_Date_nn NOT Null,
budget Number(15) Constraint Proposal_budget_nn NOT Null
)

ALTER Table Proposal
      ADD Constraint pk_Proposal Primary Key (id_Proposal)
      Using index
      Tablespace Proyecto_Index PCTFREE 20          --Nota: Cambiar "Proyecto_Index" por el nombre del tablaspace Index realizada anteriormente
      Storage (INITIAL 10k NEXT 10k PCTINCREASE 0);


--Comentario sobre la Tabla Proposal      
Comment on table Proposal
is 'Repositario para almacenar la información de los diferentes Propuestas de los usuarios';

--Comentario sobre cada Columna de Tabla Proposal
COMMENT on Column Proposal.id_Proposal 
is 'Identificación de la Propuesta';

COMMENT on Column Proposal.id_Category 
is 'Referencia a "id_Category" de la tabla "Category"';

COMMENT on Column Proposal.username 
is 'Referencia a "username" de la tabla "User"';

COMMENT on Column Proposal.Identification 
is 'Referencia a "Identification" de la tabla "Person"';

COMMENT on Column Proposal.id_Comunity 
is 'Referencia a "id_Comunity" de la tabla "Comunity"';

COMMENT on Column Proposal.Title 
is 'Título de la Propuesta';

COMMENT on Column Proposal.Description 
is 'Descripción de la Propuestas';

COMMENT on Column Proposal.post_Date 
is 'Día de publicación de la Propuesta';

COMMENT on Column Proposal.budget 
is 'Presupuesto aproximado para el Proyecto';


---------------------------------------------Table Parameterizable--------------------------------------------------------------
Create table Parameterizable
(
id_Parameterizable Number(10) Constraint Parameterizable_id_nn NOT Null,
Name Varchar(30) Constraint Parameterizable_Name_nn NOT Null, 
Value Number(10) Constraint Parameterizable_Value_nn NOT Null
)

ALTER Table Parameterizable
      ADD Constraint pk_Parameterizable Primary Key (id_Parameterizable)
      Using index
      Tablespace Proyecto_Index PCTFREE 20          --Nota: Cambiar "Proyecto_Index" por el nombre del tablaspace Index realizada anteriormente
      Storage (INITIAL 10k NEXT 10k PCTINCREASE 0);


--Comentario sobre la Tabla Parameterizable      
Comment on table Parameterizable
is 'Repositario para almacenar la información de los datos Parametrizables de la BD';

--Comentario sobre cada Columna de Tabla Parameterizable
COMMENT on Column Parameterizable.id_Parameterizable 
is 'Identificación de la variable Parameterizable';

COMMENT on Column Parameterizable.Name 
is 'Nombre de la variable Parameterizable';

COMMENT on Column Parameterizable.Value 
is 'Valor de la variable Parameterizable"';


---------------------------------------------Declaración de FK's----------------------------------------------------------------
-----Correr SOLAMENTE cuando todas las tablas estén implementadas y con los mismos nombres que las instrucciones siguientes-----


---------------------------------------------FK Email Identification------------------------------------------------------------
ALTER Table Email
      ADD Constraint fk_Email_Identification FOREIGN Key (Identification) REFERENCES
      Person(Identification);
      
      
---------------------------------------------FK Proposal Category---------------------------------------------------------------
ALTER Table Proposal
      ADD Constraint fk_Proposal_id_Category FOREIGN Key (id_Category) REFERENCES
      Category(id_Category);


---------------------------------------------FK Proposal username---------------------------------------------------------------
ALTER Table Proposal
      ADD Constraint fk_Proposal_username FOREIGN Key (username) REFERENCES
      User(username);


---------------------------------------------FK Proposal Identification---------------------------------------------------------
ALTER Table Proposal
      ADD Constraint fk_Proposal_Identification FOREIGN Key (Identification) REFERENCES
      Person(Identification);
      

---------------------------------------------FK Proposal id_Comunity---------------------------------------------------------------
ALTER Table Proposal
      ADD Constraint fk_Proposal_id_Comunity FOREIGN Key (id_Comunity) REFERENCES
      Comunity(id_Comunity);
      






