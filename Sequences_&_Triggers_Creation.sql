--------------------SEQUENCES-------------------------------
------------ CREACION DE SEQUENCIA PARA EL ID DE BINNACLE-----
CREATE SEQUENCE s_binnacle
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 10000000
NOCACHE
NOCYCLE;


------------ CREACION DE SEQUENCIA PARA EL ID DE CATEGORYXFAVORITE-----
CREATE SEQUENCE s_categoryxFavorite
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 10000000
NOCACHE
NOCYCLE;


------------ CREACION DE SEQUENCIA PARA EL ID DE COMENTARIO-----
CREATE SEQUENCE s_comentario
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 10000000
NOCACHE
NOCYCLE;


------------ CREACION DE SEQUENCIA PARA EL ID DE Favorite-----
CREATE SEQUENCE s_favorite
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 10000000
NOCACHE
NOCYCLE;


------------ CREACION DE SEQUENCIA PARA EL ID DE PERSON-----
CREATE SEQUENCE s_person
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 10000000
NOCACHE
NOCYCLE;


------------ CREACION DE SEQUENCIA PARA EL ID DE PERSONXNACIONALITY-----
CREATE SEQUENCE s_personXNacionality
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 10000000
NOCACHE
NOCYCLE;


------------ CREACION DE SEQUENCIA PARA EL ID DE Proposal-----
CREATE SEQUENCE s_proposal
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 10000000
NOCACHE
NOCYCLE;


------------ CREACION DE SEQUENCIA PARA EL ID DE TELEPHONE-----
CREATE SEQUENCE s_telephone
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 10000000
NOCACHE
NOCYCLE;


------------ CREACION DE SEQUENCIA PARA EL ID DE USER_NAME-----
CREATE SEQUENCE s_user_Name
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 10000000
NOCACHE
NOCYCLE;



-----------TRIGGERS INSERT-------------------------
------------ CREACION DE TRIGGER PARA BINACLE-----
ALTER TABLE binnacle ADD created_by VARCHAR(20);
ALTER TABLE binnacle ADD creation_date DATE;  

COMMENT ON COLUMN binnacle.created_by
  IS 'Nombre del usuario que ingresó el dato al sistema';
COMMENT ON COLUMN binnacle.creation_date
  IS 'Fecha en la que el dato fué ingresado al sistema';
  
create or replace TRIGGER admin.beforeInsertBinnacle
       BEFORE INSERT
       ON admin.binnacle
       FOR EACH ROW
       BEGIN 
           :new.created_by:=USER;
           :new.creation_date:=SYSDATE;
END beforeInsertBinnacle; 
       
       
------------ CREACION DE TRIGGER PARA CANTON-----
ALTER TABLE canton ADD created_by VARCHAR(20);
ALTER TABLE canton ADD creation_date DATE;  

COMMENT ON COLUMN canton.created_by
  IS 'Nombre del usuario que ingresó el dato al sistema';
COMMENT ON COLUMN canton.creation_date
  IS 'Fecha en la que el dato fué ingresado al sistema';
  
create or replace TRIGGER admin.beforeInsertCanton
       BEFORE INSERT
       ON admin.Canton
       FOR EACH ROW
       BEGIN 
           :new.created_by:=USER;
           :new.creation_date:=SYSDATE;
       END beforeInsertCanton; 


------------ CREACION DE TRIGGER PARA CATEGORYXFAVORITE-----
ALTER TABLE categoryxFavorite ADD created_by VARCHAR(20);
ALTER TABLE categoryxFavorite ADD creation_date DATE;  

COMMENT ON COLUMN categoryxFavorite.created_by
  IS 'Nombre del usuario que ingresó el dato al sistema';
COMMENT ON COLUMN categoryxFavorite.creation_date
  IS 'Fecha en la que el dato fué ingresado al sistema';
  
create or replace TRIGGER admin.beforeInsertCategoryXFavorite
       BEFORE INSERT
       ON admin.categoryxFavorite
       FOR EACH ROW
       BEGIN 
           :new.created_by:=USER;
           :new.creation_date:=SYSDATE;
       END beforeInsertCategoryXFavorite; 
       
       
       
------------ CREACION DE TRIGGER PARA CATEGORYXFAVORITE-----
ALTER TABLE categoryxFavorite ADD created_by VARCHAR(20);
ALTER TABLE categoryxFavorite ADD creation_date DATE;  

COMMENT ON COLUMN categoryxFavorite.created_by
  IS 'Nombre del usuario que ingresó el dato al sistema';
COMMENT ON COLUMN categoryxFavorite.creation_date
  IS 'Fecha en la que el dato fué ingresado al sistema';
  
create or replace TRIGGER admin.beforeInsertCategoryXFavorite
       BEFORE INSERT
       ON admin.categoryxFavorite
       FOR EACH ROW
       BEGIN 
           :new.created_by:=USER;
           :new.creation_date:=SYSDATE;
       END beforeInsertCategoryXFavorite; 



------------ CREACION DE TRIGGER PARA COMENTARIO-----
ALTER TABLE comentario ADD created_by VARCHAR(20);
ALTER TABLE comentario ADD creation_date DATE;  

COMMENT ON COLUMN comentario.created_by
  IS 'Nombre del usuario que ingresó el dato al sistema';
COMMENT ON COLUMN comentario.creation_date
  IS 'Fecha en la que el dato fué ingresado al sistema';
  
create or replace TRIGGER admin.beforeInsertComentario
       BEFORE INSERT
       ON admin.comentario
       FOR EACH ROW
       BEGIN 
           :new.created_by:=USER;
           :new.creation_date:=SYSDATE;
       END beforeInsertComentario; 
       
       
       
------------ CREACION DE TRIGGER PARA PERSONXNATIONALITY-----
ALTER TABLE personXNationality ADD created_by VARCHAR(20);
ALTER TABLE personXNationality ADD creation_date DATE;  

COMMENT ON COLUMN personXNationality.created_by
  IS 'Nombre del usuario que ingresó el dato al sistema';
COMMENT ON COLUMN personXNationality.creation_date
  IS 'Fecha en la que el dato fué ingresado al sistema';
  
create or replace TRIGGER admin.beforeInsertpersonXNationality
       BEFORE INSERT
       ON admin.personXNationality
       FOR EACH ROW
       BEGIN 
           :new.created_by:=USER;
           :new.creation_date:=SYSDATE;
       END beforeInsertpersonXNationality;
       
       
------------ CREACION DE TRIGGER PARA PROPOSAL-----
ALTER TABLE proposal ADD created_by VARCHAR(20);
ALTER TABLE proposal ADD creation_date DATE;  

COMMENT ON COLUMN proposal.created_by
  IS 'Nombre del usuario que ingresó el dato al sistema';
COMMENT ON COLUMN proposal.creation_date
  IS 'Fecha en la que el dato fué ingresado al sistema';
  
create or replace TRIGGER admin.beforeInsertProposal
       BEFORE INSERT
       ON admin.proposal
       FOR EACH ROW
       BEGIN 
           :new.created_by:=USER;
           :new.creation_date:=SYSDATE;
       END beforeInsertProposal;
       
       
       
------------ CREACION DE TRIGGER PARA TELEPHONE-----
ALTER TABLE telephone ADD created_by VARCHAR(20);
ALTER TABLE telephone ADD creation_date DATE;  

COMMENT ON COLUMN telephone.created_by
  IS 'Nombre del usuario que ingresó el dato al sistema';
COMMENT ON COLUMN telephone.creation_date
  IS 'Fecha en la que el dato fué ingresado al sistema';
  
create or replace TRIGGER admin.beforeInsertTelephone
       BEFORE INSERT
       ON admin.telephone
       FOR EACH ROW
       BEGIN 
           :new.created_by:=USER;
           :new.creation_date:=SYSDATE;
       END beforeInsertTelephone;
