---------------TRIGGERS MODIFY-------------------------
----------CREACION DE TRIGGER PARA BINNACLE-------------
ALTER TABLE binnacle ADD modified_by VARCHAR(20);
--ALTER TABLE binnacle ADD modification_date DATE;  

COMMENT ON COLUMN binnacle.modified_by
  IS 'Nombre del último usuario que modificó el dato del sistema';
COMMENT ON COLUMN binnacle.modification_date
  IS 'Última Fecha en la que el dato fue modificado en el sistema';
  
create or replace TRIGGER admin.beforeUpdateBinnacle
       BEFORE Update
       ON admin.binnacle
       FOR EACH ROW
       BEGIN 
           :new.modified_by:=USER;
           :new.modification_date:=SYSDATE;
END beforeUpdateBinnacle; 



----------CREACION DE TRIGGER PARA CANTON-------------
ALTER TABLE canton ADD modified_by VARCHAR(20);
ALTER TABLE canton ADD modification_date DATE;  

COMMENT ON COLUMN canton.modified_by
  IS 'Nombre del último usuario que modificó el dato del sistema';
COMMENT ON COLUMN canton.modification_date
  IS 'Última Fecha en la que el dato fue modificado en el sistema';
  
create or replace TRIGGER admin.beforeUpdateCanton
       BEFORE Update
       ON admin.canton
       FOR EACH ROW
       BEGIN 
           :new.modified_by:=USER;
           :new.modification_date:=SYSDATE;
END beforeUpdateCanton;



----------CREACION DE TRIGGER PARA CATEGORY-------------
ALTER TABLE category ADD modified_by VARCHAR(20);
ALTER TABLE category ADD modification_date DATE;  

COMMENT ON COLUMN category.modified_by
  IS 'Nombre del último usuario que modificó el dato del sistema';
COMMENT ON COLUMN category.modification_date
  IS 'Última Fecha en la que el dato fue modificado en el sistema';
  
create or replace TRIGGER admin.beforeUpdateCategory
       BEFORE Update
       ON admin.category
       FOR EACH ROW
       BEGIN 
           :new.modified_by:=USER;
           :new.modification_date:=SYSDATE;
END beforeUpdateCategory;



----------CREACION DE TRIGGER PARA ATEGORYXFAVORITE-------------
ALTER TABLE CategoryXFavorite ADD modified_by VARCHAR(20);
ALTER TABLE CategoryXFavorite ADD modification_date DATE;  

COMMENT ON COLUMN CategoryXFavorite.modified_by
  IS 'Nombre del último usuario que modificó el dato del sistema';
COMMENT ON COLUMN CategoryXFavorite.modification_date
  IS 'Última Fecha en la que el dato fue modificado en el sistema';
  
create or replace TRIGGER admin.beforeUpdateCategoryXFavorite
       BEFORE Update
       ON admin.CategoryXFavorite
       FOR EACH ROW
       BEGIN 
           :new.modified_by:=USER;
           :new.modification_date:=SYSDATE;
END beforeUpdateCategoryXFavorite;



----------CREACION DE TRIGGER PARA COMENTARIO-------------
ALTER TABLE Comentario ADD modified_by VARCHAR(20);
ALTER TABLE Comentario ADD modification_date DATE;  

COMMENT ON COLUMN Comentario.modified_by
  IS 'Nombre del último usuario que modificó el dato del sistema';
COMMENT ON COLUMN Comentario.modification_date
  IS 'Última Fecha en la que el dato fue modificado en el sistema';
  
create or replace TRIGGER admin.beforeUpdateComentario
       BEFORE Update
       ON admin.Comentario
       FOR EACH ROW
       BEGIN 
           :new.modified_by:=USER;
           :new.modification_date:=SYSDATE;
END beforeUpdateComentario;



----------CREACION DE TRIGGER PARA COMUNITY-------------
ALTER TABLE Comunity ADD modified_by VARCHAR(20);
ALTER TABLE Comunity ADD modification_date DATE;  

COMMENT ON COLUMN Comunity.modified_by
  IS 'Nombre del último usuario que modificó el dato del sistema';
COMMENT ON COLUMN Comunity.modification_date
  IS 'Última Fecha en la que el dato fue modificado en el sistema';
  
create or replace TRIGGER admin.beforeUpdateComunity
       BEFORE Update
       ON admin.Comunity
       FOR EACH ROW
       BEGIN 
           :new.modified_by:=USER;
           :new.modification_date:=SYSDATE;
END beforeUpdateComunity;


----------CREACION DE TRIGGER PARA COUNTRY-------------
ALTER TABLE Country ADD modified_by VARCHAR(20);
ALTER TABLE Country ADD modification_date DATE;  

COMMENT ON COLUMN Country.modified_by
  IS 'Nombre del último usuario que modificó el dato del sistema';
COMMENT ON COLUMN Country.modification_date
  IS 'Última Fecha en la que el dato fue modificado en el sistema';
  
create or replace TRIGGER admin.beforeUpdateCountry
       BEFORE Update
       ON admin.Country
       FOR EACH ROW
       BEGIN 
           :new.modified_by:=USER;
           :new.modification_date:=SYSDATE;
END beforeUpdateCountry;



----------CREACION DE TRIGGER PARA DISTRICT-------------
ALTER TABLE District ADD modified_by VARCHAR(20);
ALTER TABLE District ADD modification_date DATE;  

COMMENT ON COLUMN District.modified_by
  IS 'Nombre del último usuario que modificó el dato del sistema';
COMMENT ON COLUMN District.modification_date
  IS 'Última Fecha en la que el dato fue modificado en el sistema';
  
create or replace TRIGGER admin.beforeUpdateDistrict
       BEFORE Update
       ON admin.District
       FOR EACH ROW
       BEGIN 
           :new.modified_by:=USER;
           :new.modification_date:=SYSDATE;
END beforeUpdateDistrict;



----------CREACION DE TRIGGER PARA EMAIL-------------
ALTER TABLE Email ADD modified_by VARCHAR(20);
ALTER TABLE Email ADD modification_date DATE;  

COMMENT ON COLUMN Email.modified_by
  IS 'Nombre del último usuario que modificó el dato del sistema';
COMMENT ON COLUMN Email.modification_date
  IS 'Última Fecha en la que el dato fue modificado en el sistema';
  
create or replace TRIGGER admin.beforeUpdateEmail
       BEFORE Update
       ON admin.Email
       FOR EACH ROW
       BEGIN 
           :new.modified_by:=USER;
           :new.modification_date:=SYSDATE;
END beforeUpdateEmail;



----------CREACION DE TRIGGER PARA FAVORITE-------------
ALTER TABLE Favorite ADD modified_by VARCHAR(20);
ALTER TABLE Favorite ADD modification_date DATE;  

COMMENT ON COLUMN Favorite.modified_by
  IS 'Nombre del último usuario que modificó el dato del sistema';
COMMENT ON COLUMN Favorite.modification_date
  IS 'Última Fecha en la que el dato fue modificado en el sistema';
  
create or replace TRIGGER admin.beforeUpdateFavorite
       BEFORE Update
       ON admin.Favorite
       FOR EACH ROW
       BEGIN 
           :new.modified_by:=USER;
           :new.modification_date:=SYSDATE;
END beforeUpdateFavorite;



----------CREACION DE TRIGGER PARA NATIONALITY-------------
ALTER TABLE Nationality ADD modified_by VARCHAR(20);
ALTER TABLE Nationality ADD modification_date DATE;  

COMMENT ON COLUMN Nationality.modified_by
  IS 'Nombre del último usuario que modificó el dato del sistema';
COMMENT ON COLUMN Nationality.modification_date
  IS 'Última Fecha en la que el dato fue modificado en el sistema';
  
create or replace TRIGGER admin.beforeUpdateNationality
       BEFORE Update
       ON admin.Nationality
       FOR EACH ROW
       BEGIN 
           :new.modified_by:=USER;
           :new.modification_date:=SYSDATE;
END beforeUpdateNationality;



----------CREACION DE TRIGGER PARA PARAMETERIZABLE-------------
ALTER TABLE Parameterizable ADD modified_by VARCHAR(20);
ALTER TABLE Parameterizable ADD modification_date DATE;  

COMMENT ON COLUMN Parameterizable.modified_by
  IS 'Nombre del último usuario que modificó el dato del sistema';
COMMENT ON COLUMN Parameterizable.modification_date
  IS 'Última Fecha en la que el dato fue modificado en el sistema';
  
create or replace TRIGGER admin.beforeUpdateParametrizable
       BEFORE Update
       ON admin.Parameterizable
       FOR EACH ROW
       BEGIN 
           :new.modified_by:=USER;
           :new.modification_date:=SYSDATE;
END beforeUpdateParameterizable;



----------CREACION DE TRIGGER PARA PERSON-------------
ALTER TABLE Person ADD modified_by VARCHAR(20);
ALTER TABLE Person ADD modification_date DATE;  

COMMENT ON COLUMN Person.modified_by
  IS 'Nombre del último usuario que modificó el dato del sistema';
COMMENT ON COLUMN Person.modification_date
  IS 'Última Fecha en la que el dato fue modificado en el sistema';
  
create or replace TRIGGER admin.beforeUpdatePerson
       BEFORE Update
       ON admin.Person
       FOR EACH ROW
       BEGIN 
           :new.modified_by:=USER;
           :new.modification_date:=SYSDATE;
END beforeUpdatePerson;



----------CREACION DE TRIGGER PARA PersonXNationality-------------
ALTER TABLE PersonXNationality ADD modified_by VARCHAR(20);
ALTER TABLE PersonXNationality ADD modification_date DATE;  

COMMENT ON COLUMN PersonXNationality.modified_by
  IS 'Nombre del último usuario que modificó el dato del sistema';
COMMENT ON COLUMN PersonXNationality.modification_date
  IS 'Última Fecha en la que el dato fue modificado en el sistema';
  
create or replace TRIGGER admin.beforeUpdatePersonXNationality
       BEFORE Update
       ON admin.PersonXNationality
       FOR EACH ROW
       BEGIN 
           :new.modified_by:=USER;
           :new.modification_date:=SYSDATE;
END beforeUpdatePersonXNationality;



----------CREACION DE TRIGGER PARA PROPOSAL-------------
ALTER TABLE Proposal ADD modified_by VARCHAR(20);
ALTER TABLE Proposal ADD modification_date DATE;  

COMMENT ON COLUMN Proposal.modified_by
  IS 'Nombre del último usuario que modificó el dato del sistema';
COMMENT ON COLUMN Proposal.modification_date
  IS 'Última Fecha en la que el dato fue modificado en el sistema';
  
create or replace TRIGGER admin.beforeUpdateProposal
       BEFORE Update
       ON admin.Proposal
       FOR EACH ROW
       BEGIN 
           :new.modified_by:=USER;
           :new.modification_date:=SYSDATE;
END beforeUpdateProposal;



----------CREACION DE TRIGGER PARA PROVINCE-------------
ALTER TABLE Province ADD modified_by VARCHAR(20);
ALTER TABLE Province ADD modification_date DATE;  

COMMENT ON COLUMN Province.modified_by
  IS 'Nombre del último usuario que modificó el dato del sistema';
COMMENT ON COLUMN Province.modification_date
  IS 'Última Fecha en la que el dato fue modificado en el sistema';
  
create or replace TRIGGER admin.beforeUpdateProvince
       BEFORE Update
       ON admin.Province
       FOR EACH ROW
       BEGIN 
           :new.modified_by:=USER;
           :new.modification_date:=SYSDATE;
END beforeUpdateProvince;



----------CREACION DE TRIGGER PARA TELEPHONE-------------
ALTER TABLE Telephone ADD modified_by VARCHAR(20);
ALTER TABLE Telephone ADD modification_date DATE;  

COMMENT ON COLUMN Telephone.modified_by
  IS 'Nombre del último usuario que modificó el dato del sistema';
COMMENT ON COLUMN Telephone.modification_date
  IS 'Última Fecha en la que el dato fue modificado en el sistema';
  
create or replace TRIGGER admin.beforeUpdateTelephone
       BEFORE Update
       ON admin.Telephone
       FOR EACH ROW
       BEGIN 
           :new.modified_by:=USER;
           :new.modification_date:=SYSDATE;
END beforeUpdateTelephone;



----------CREACION DE TRIGGER PARA USER_NAME-------------
ALTER TABLE USER_NAME ADD modified_by VARCHAR(20);
ALTER TABLE USER_NAME ADD modification_date DATE;  

COMMENT ON COLUMN USER_NAME.modified_by
  IS 'Nombre del último usuario que modificó el dato del sistema';
COMMENT ON COLUMN USER_NAME.modification_date
  IS 'Última Fecha en la que el dato fue modificado en el sistema';
  
create or replace TRIGGER admin.beforeUpdateUSER_NAME
       BEFORE Update
       ON admin.USER_NAME
       FOR EACH ROW
       BEGIN 
           :new.modified_by:=USER;
           :new.modification_date:=SYSDATE;
END beforeUpdateUSER_NAME;



----------CREACION DE TRIGGER PARA USER_TYPE-------------
ALTER TABLE USER_TYPE ADD modified_by VARCHAR(20);
ALTER TABLE USER_TYPE ADD modification_date DATE;  

COMMENT ON COLUMN USER_TYPE.modified_by
  IS 'Nombre del último usuario que modificó el dato del sistema';
COMMENT ON COLUMN USER_TYPE.modification_date
  IS 'Última Fecha en la que el dato fue modificado en el sistema';
  
create or replace TRIGGER admin.beforeUpdateUSER_TYPE
       BEFORE Update
       ON admin.USER_TYPE
       FOR EACH ROW
       BEGIN 
           :new.modified_by:=USER;
           :new.modification_date:=SYSDATE;
END beforeUpdateUSER_TYPE;