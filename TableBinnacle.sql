CREATE TABLE binnacle(
 id_Binnacle NUMBER(9), 
 username VARCHAR2(9),
 modification_Date DATE CONSTRAINT binnacle_modification_Date_nn NOT NULL,
 old_Password VARCHAR2(25) CONSTRAINT binnacle_old_Password_nn NOT NULL,
 actual_Password VARCHAR2(25)CONSTRAINT binnacle_actual_Password_nn NOT NULL
);

ALTER TABLE binnacle
  ADD CONSTRAINT pk_binnacle PRIMARY KEY (id_Binnacle)
  USING INDEX
  TABLESPACE admin_ind PCTFREE 20
  STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0
);

ALTER TABLE binnacle
  ADD CONSTRAINT fk_binnacle_username FOREIGN KEY
  (username) REFERENCES
  Usuario(id_username);

COMMENT ON TABLE binnacle
  IS 'Repositorio para almacenar la bitacora de contrasena del usuario';
  
COMMENT ON COLUMN binnacle.id_Binnacle
  IS 'Identificador de  la bitacora';  
  
COMMENT ON COLUMN binnacle.username
  IS 'Identificador del usuario al que le pertenece la bitacora';
  
COMMENT ON COLUMN binnacle.modification_Date
  IS 'Fecha en la cual fue actualizada la contrasena';

COMMENT ON COLUMN binnacle.old_Password
  IS 'Contrasena antigua del usuario';

COMMENT ON COLUMN binnacle.actual_Password
  IS 'Contrasena actual del usuario';