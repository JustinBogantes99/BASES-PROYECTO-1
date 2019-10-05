--Alterar Parameterizable con los siguientes comandos antes de hacer el Package--

    
Alter table Parameterizable
    Add Constraint Param_Name_uk Unique(name);


----------------------------Package Parameterizable----------------------------
------------------------------Parameterizable Head-----------------------------


Create or replace PACKAGE adminParameterizable is
Procedure insertParameterizable(pvName Varchar2, pvValue Varchar2);
Procedure updateParameterizable(pvId_Parameterizable Number, pnNew_Name Varchar2, pnNew_Value Varchar2);
Procedure removeParameterizable(pvId_Parameterizable Varchar2);
END adminParameterizable;


------------------------------Parameterizable Body-----------------------------
create or replace PACKAGE BODY adminParameterizable  AS

Procedure insertParameterizable(pvName Varchar2, pvValue Varchar2) is

Begin
    
        INSERT INTO parameterizable (id_parameterizable, Name, value) 
        VALUES (s_parameterizable.nextval, pvName, pvValue);
    
    Exception
        When DUP_VAL_ON_INDEX then
            dbms_output.put_line('Ya existe un tipo de Dato con el mismo Id');
            DBMS_OUTPUT.put_line(SQLCODE);
        When OTHERS then
            dbms_output.put_line('Se ha producido un error, intentelo más tarde');
            DBMS_OUTPUT.put_line(SQLCODE);
    commit;
END insertParameterizable;





Procedure updateParameterizable(pvId_Parameterizable Number, pnNew_Name Varchar2, pnNew_Value Varchar2)is
e_invalid_Parameterizable EXCEPTION;

BEGIN
    Update Parameterizable
    Set Name = pnNew_Name,
        value = pnNew_Value
    Where id_parameterizable = pvId_Parameterizable;

    if SQL%NOTFOUND then
        raise e_invalid_Parameterizable;
    End if;
    Exception
    When e_invalid_Parameterizable then
        DBMS_OUTPUT.PUT_LINE ('No existe un tipo de Usuario con este Id ' || pvId_Parameterizable);
        DBMS_OUTPUT.PUT_LINE (SQLCODE);
    When DUP_VAL_ON_INDEX then
            dbms_output.put_line('Ya existe un tipo de Dato con el mismo Nombre');
            DBMS_OUTPUT.put_line(SQLCODE);
    When OTHERS then
            dbms_output.put_line('Se ha producido un error, intentelo más tarde');
            DBMS_OUTPUT.put_line(SQLCODE);
    commit;
END updateParameterizable;




Procedure removeParameterizable(pvId_Parameterizable Varchar2)is
e_invalid_Parameterizable EXCEPTION;

BEGIN
    Delete Parameterizable
    Where Id_Parameterizable = pvId_Parameterizable;

    if SQL%NOTFOUND then
        raise e_invalid_Parameterizable;
    End if;
    Exception
    When e_invalid_Parameterizable then
        DBMS_OUTPUT.PUT_LINE ('No existe un tipo de usuario con este Id ' || pvId_Parameterizable);
        DBMS_OUTPUT.PUT_LINE (SQLCODE);
    When OTHERS then
            dbms_output.put_line('Se ha producido un error, intentelo más tarde');
            DBMS_OUTPUT.put_line(SQLCODE);
    commit;            
END removeParameterizable;


END adminParameterizable;


select * from parameterizable;