create or replace PACKAGE adminPerson is
Procedure insertPerson(pvIdentification Varchar2,pvFirst_Name Varchar2,pvFirst_Last_Name Varchar2,pvSecond_Last_Name Varchar2,
                       pvBirthdate Date, pvId_district Number);
Procedure updatePerson(pvIdentification Varchar2,pvFirst_Name Varchar2,pvFirst_Last_Name Varchar2,pvSecond_Last_Name Varchar2,
                       pvBirthdate Date, pvPhoto BFILE, pvId_district Number);
Procedure removePerson(pvIdentification Varchar2);
END adminPerson;






create or replace PACKAGE BODY adminPerson  AS

Procedure insertPerson(pvIdentification Varchar2,pvFirst_Name Varchar2,pvFirst_Last_Name Varchar2,pvSecond_Last_Name Varchar2,
                       pvBirthdate Date, pvId_district Number) is              
Begin

    INSERT INTO person (identification,first_name,first_last_name,second_last_name,birthdate,id_district) 
    VALUES (pvIdentification, pvFirst_Name, pvFirst_Last_Name, pvSecond_Last_Name, pvBirthdate, pvId_district);

    Exception
        When DUP_VAL_ON_INDEX then
            dbms_output.put_line('Ya existe una Persona con la misma Identificación '||pvidentification);
            DBMS_OUTPUT.put_line(SQLCODE);
        When OTHERS then
            dbms_output.put_line('Se ha producido un error, intentelo más tarde');
            DBMS_OUTPUT.put_line(SQLCODE);
    commit;
END insertPerson;



Procedure updatePerson(pvIdentification Varchar2,pvFirst_Name Varchar2,pvFirst_Last_Name Varchar2,pvSecond_Last_Name Varchar2,
                       pvBirthdate Date, pvPhoto BFILE, pvId_district Number)is
e_invalid_Person EXCEPTION;

BEGIN
    Update Person
    Set Identification = pvIdentification, First_name = pvFirst_name, First_Last_Name = pvFirst_Last_Name,
    Second_Last_Name = pvSecond_Last_Name, Birthdate = pvBirthdate, Photo = pvPhoto, Id_district = pvId_district
    Where Identification = pvIdentification;

    if SQL%NOTFOUND then
        raise e_invalid_Person;
    End if;
    Exception
    When e_invalid_Person then
        DBMS_OUTPUT.PUT_LINE ('No existe una persona con la identificación ' || pvidentification);
        DBMS_OUTPUT.PUT_LINE (SQLCODE);
    When DUP_VAL_ON_INDEX then
            dbms_output.put_line('Ya existe una Persona con la misma Identificación');
            DBMS_OUTPUT.put_line(SQLCODE);
    When OTHERS then
            dbms_output.put_line('Se ha producido un error, intentelo más tarde');
            DBMS_OUTPUT.put_line(SQLCODE);
    commit;
END updatePerson;



Procedure removePerson(pvIdentification Varchar2)is
e_invalid_Person EXCEPTION;

BEGIN
    Delete Person
    Where Identification = pvIdentification;

    if SQL%NOTFOUND then
        raise e_invalid_Person;
    End if;
    Exception
    When e_invalid_Person then
        DBMS_OUTPUT.PUT_LINE ('No existe una persona con la identificación ' || pvidentification);
        DBMS_OUTPUT.PUT_LINE (SQLCODE);
        
    When OTHERS then
            dbms_output.put_line('Se ha producido un error, intentelo más tarde');
            DBMS_OUTPUT.put_line(SQLCODE);
    commit;
END removePerson;


END adminPerson;