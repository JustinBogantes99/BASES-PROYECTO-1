CREATE TABLE telephone(
 telephone_Number NUMBER(9) CONSTRAINT telephone_telephone_Number_nn NOT NULL, 
 identification NUMBER(9)
);

ALTER TABLE telephone
  ADD CONSTRAINT pk_telephone PRIMARY KEY (telephone_Number)
  USING INDEX
  TABLESPACE admin_ind PCTFREE 20
  STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0
);

ALTER TABLE telephone
  ADD CONSTRAINT fk_telephone_person FOREIGN KEY
  (identification) REFERENCES
  person(identification);

COMMENT ON TABLE telephone
  IS 'Repositorio para almacenar los numeros de telefonos de las personas';
  
COMMENT ON COLUMN telephone.telephone_Number
  IS 'Numero telefonico de las personas, este debe ser unico';  
  
COMMENT ON COLUMN telephone.identification
  IS 'Numero de identificacion de la persona a la que pertenece el numero telefonico';