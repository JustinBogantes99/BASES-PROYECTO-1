CREATE TABLE PersonXNationality(
  identification varchar2(9),
  id_Nationality NUMBER(5)
);

ALTER TABLE PersonXNationality
  ADD CONSTRAINT pk_PersonXNationality PRIMARY KEY (identification, id_Nationality)
  USING INDEX
  TABLESPACE admin_ind PCTFREE 20
  STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);
  
ALTER TABLE PersonXNationality
  ADD CONSTRAINT fk_person_nationality FOREIGN KEY
  (id_Nationality) REFERENCES
  Nationality(id_Nationality);
  
ALTER TABLE PersonXNationality
  ADD CONSTRAINT fk_nationality_person FOREIGN KEY
  (identification) REFERENCES
  person(identification);