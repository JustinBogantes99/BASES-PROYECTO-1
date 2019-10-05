---Alterar user_type con los siguientes comandos antes de hacer el Package----
Alter table user_type
    Add CONSTRAINT name_uk unique(name);

------------------------------------------------------------------------------

----------------------------Package adminUser_Type----------------------------
------------------------------adminUser_Type Head-----------------------------


Create or replace PACKAGE adminUser_Type is
Procedure insertUser_Type(pvName Varchar2);
Procedure updateUser_Type(pvId_User_Type Number, pnNew_Name Varchar2);
Procedure removeUser_Type(pvId_User_Type Varchar2);
END adminUser_Type;




------------------------------adminUser_Type Body-----------------------------

create or replace PACKAGE BODY adminUser_Type  AS

Procedure insertUser_Type(pvName Varchar2) is
e_User_Type_already_Exist EXCEPTION;

--flag Number(2);


Begin
    /*Select count(*)
    into flag
    from User_type
    where Name = pvName
    and rownum = 1;*/
    
        INSERT INTO User_Type (id_user_type, Name) 
        VALUES (s_user_type.nextval, pvName);
    
    Exception
        When DUP_VAL_ON_INDEX then
            dbms_output.put_line('Ya existe un tipo de Usuario con el mismo Nombre o Id');
            DBMS_OUTPUT.put_line(SQLCODE);
        When OTHERS then
            dbms_output.put_line('Se ha producido un error, intentelo más tarde');
            DBMS_OUTPUT.put_line(SQLCODE);
    commit;
END insertUser_Type;





Procedure updateUser_Type(pvId_User_Type Number, pnNew_Name Varchar2)is
e_invalid_User_Type EXCEPTION;

BEGIN
    Update User_Type
    Set Name = pnNew_Name
    Where id_User_Type = pvId_User_Type;

    if SQL%NOTFOUND then
        raise e_invalid_User_Type;
    End if;
    Exception
    When e_invalid_User_Type then
        DBMS_OUTPUT.PUT_LINE ('No existe un tipo de Usuario con este Id ' || pvId_User_Type);
        DBMS_OUTPUT.PUT_LINE (SQLCODE);
    When DUP_VAL_ON_INDEX then
            dbms_output.put_line('Ya existe un tipo de Dato con el mismo Nombre');
            DBMS_OUTPUT.put_line(SQLCODE);
    When OTHERS then
            dbms_output.put_line('Se ha producido un error, intentelo más tarde');
            DBMS_OUTPUT.put_line(SQLCODE);
    commit;
END updateUser_Type;




Procedure removeUser_Type(pvId_User_Type Varchar2)is
e_invalid_User_Type EXCEPTION;

BEGIN
    Delete User_Type
    Where id_User_Type = pvId_User_Type;

    if SQL%NOTFOUND then
        raise e_invalid_User_Type;
    End if;
    Exception
    When e_invalid_User_Type then
        DBMS_OUTPUT.PUT_LINE ('No existe un tipo de usuario con este Id ' || pvId_User_Type);
        DBMS_OUTPUT.PUT_LINE (SQLCODE);
    When OTHERS then
            dbms_output.put_line('Se ha producido un error, intentelo más tarde');
            DBMS_OUTPUT.put_line(SQLCODE);
    commit;
END removeUser_Type;


END adminUser_Type;