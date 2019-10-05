---Alterar Email con los siguientes comandos antes de hacer el Package----

Alter table Email
    Add Constraint Identification_fk Foreign Key (Identification)
    References Person(Identification);
    
Alter table Email
    Add Constraint Identification_uk Unique(Identification);
    
--------------------------------------------------------------------------

----------------------------Package adminEmail----------------------------
------------------------------adminEmail Head-----------------------------

Create or replace PACKAGE adminEmail is
Procedure insertEmail(pvEmail Varchar2, pvIdentification Varchar2);
Procedure updateEmail(pvNEW_Email Varchar2, pvIdentification Varchar2);
Procedure removeEmail(pvIdentification Varchar2);
END adminEmail;



------------------------------adminEmail Body-----------------------------

create or replace PACKAGE BODY adminEmail  AS

Procedure insertEmail(pvEmail Varchar2, pvIdentification Varchar2) is
Begin
    
        INSERT INTO Email (Identification, Email) 
        VALUES (pvIdentification, pvEmail);
    
    Exception
        When DUP_VAL_ON_INDEX then
            dbms_output.put_line('El Email '||pvEmail || ' ya se encuentra registrado o el usuario con Identificación '
            ||pvIdentification|| ' ya posee un email.');
            DBMS_OUTPUT.put_line(SQLCODE);
        When OTHERS then
            dbms_output.put_line('Se ha producido un error, intentelo más tarde');
            DBMS_OUTPUT.put_line(SQLCODE);
    commit;
END insertEmail;





Procedure updateEmail(pvNEW_Email Varchar2, pvIdentification Varchar2)is
e_invalid_Identification EXCEPTION;

BEGIN
    Update Email
    Set Email = pvNEW_Email
    Where Identification = pvIdentification;

    if SQL%NOTFOUND then
        raise e_invalid_Identification;
    End if;
    Exception
        When e_invalid_Identification then
            DBMS_OUTPUT.PUT_LINE ('No existe un Email relacionado a esta Identificación ' || pvIdentification);
            DBMS_OUTPUT.PUT_LINE (SQLCODE);
        When DUP_VAL_ON_INDEX then
            dbms_output.put_line('Ya existe un Usuario con este mismo email '|| pvNEW_Email);
            DBMS_OUTPUT.put_line(SQLCODE);
        When OTHERS then
            dbms_output.put_line('Se ha producido un error, intentelo más tarde');
            DBMS_OUTPUT.put_line(SQLCODE);
    commit;
END updateEmail;




Procedure removeEmail(pvIdentification Varchar2)is
e_invalid_Identification EXCEPTION;

BEGIN
    Delete Email
    Where Identification = pvIdentification;

    if SQL%NOTFOUND then
        raise e_invalid_Identification;
    End if;
    Exception
        When e_invalid_Identification then
            DBMS_OUTPUT.PUT_LINE ('No existe un Email relacionado a esta Identificación ' || pvIdentification);
            DBMS_OUTPUT.PUT_LINE (SQLCODE);
        When OTHERS then
                dbms_output.put_line('Se ha producido un error, intentelo más tarde');
                DBMS_OUTPUT.put_line(SQLCODE);
    commit;            
END removeEmail;


END adminEmail;