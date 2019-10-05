CREATE TABLE comentario(
 id_Comentario NUMBER(9), 
 identification VARCHAR2(9),
 id_Proposal NUMBER(9), 
 date_And_Hour  TIMESTAMP,
 description VARCHAR2(50)CONSTRAINT comentario_description_nn NOT NULL
);

ALTER TABLE comentario
  ADD CONSTRAINT pk_comentario PRIMARY KEY (id_Comentario)
  USING INDEX
  TABLESPACE admin_ind PCTFREE 20
  STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0
);

ALTER TABLE comentario
  ADD CONSTRAINT fk_comentario_person FOREIGN KEY
  (identification) REFERENCES
  person(identification);
  
ALTER TABLE comentario
  ADD CONSTRAINT fk_comentario_proposal FOREIGN KEY
  (id_Proposal) REFERENCES
  proposal(id_Proposal);

COMMENT ON TABLE comentario
  IS 'Repositorio para almacenar los comentarios que el usuario hace';
  
COMMENT ON COLUMN comentario.id_Comment
  IS 'Identificador del comentario';  
  
COMMENT ON COLUMN comentario.identification
  IS 'Identificador del usuario al que le pertenece el comentario';
  
COMMENT ON COLUMN comentario.id_Proposal
  IS 'Identificador de la propuesta a la que le pertenece el comentario';

COMMENT ON COLUMN comentario.date_and_Hour
  IS 'Contiene la hora y fecha en la que se hizo el comentario';

COMMENT ON COLUMN comentario.description
  IS 'Descripcion del comentario';