---Alterar Proposal con los siguientes comandos antes de hacer el Package---

Alter TABLE Proposal
    Add Constraint Title_uk Unique (Title);

----------------------------------------------------------------------------

----------------------------Package adminProposal----------------------------
------------------------------adminProposal Head-----------------------------

create or replace PACKAGE adminProposal is
Procedure insertProposal(pvId_category Number, pvUsername Varchar2, pvIdentification Varchar2, 
                         pvTitle Varchar2, pvDescription Varchar2, pvBudget Number);
Procedure updateProposal(pvNEW_Title Varchar2, pvId_category Number, pvUsername Varchar2, pvIdentification Varchar2, 
                         pvId_Comunity Number, pvTitle Varchar2, pvDescription Varchar2, pvPost_Date Date, pvBudget Number);
Procedure removeProposal(pvTitle Varchar2);
END adminProposal;



------------------------------adminProposal Body-----------------------------

create or replace PACKAGE BODY adminProposal  AS

Procedure insertProposal(pvId_category Number, pvUsername Varchar2, pvIdentification Varchar2, 
                         pvTitle Varchar2, pvDescription Varchar2, pvBudget Number) is

vcId_District Number(20);
vcId_Canton Number(20);
vcId_Comunity Number(20);
Begin
        Select id_District
        into vcId_District
        from Person
        Where Identification = pvIdentification;

        Select id_Canton
        into vcId_Canton
        from District
        Where id_District = vcId_District;
        
        Select id_comunity
        into vcId_Comunity
        from Canton
        Where id_Canton = vcId_Canton;

        INSERT INTO proposal (Id_proposal, Id_category, Username, Identification, Id_Comunity, Title, Description, Post_Date, Budget)
        VALUES (s_Proposal.nextval, pvId_category, pvUsername, pvIdentification, vcId_Comunity, pvTitle, pvDescription, sysdate, pvBudget);

    Exception
        When DUP_VAL_ON_INDEX then
            dbms_output.put_line('La Propuesta '||pvTitle || ' no se ha podido ingresar.');
            DBMS_OUTPUT.put_line(SQLCODE);
        When OTHERS then
            dbms_output.put_line('Se ha producido un error, intentelo más tarde');
            DBMS_OUTPUT.put_line(SQLCODE);
    commit;
END insertProposal;





Procedure updateProposal(pvNEW_Title Varchar2, pvId_category Number, pvUsername Varchar2, pvIdentification Varchar2, 
                         pvId_Comunity Number, pvTitle Varchar2, pvDescription Varchar2, pvPost_Date Date, pvBudget Number) is
e_invalid_Proposal EXCEPTION;

BEGIN
    Update Proposal
    Set id_Category = pvId_category, Username = pvUsername, Identification = pvIdentification, id_Comunity = pvId_Comunity,
        Title = pvNEW_Title, Description = pvDescription, Post_Date = pvPost_Date, Budget = pvBudget
    Where Title = pvTitle;

    if SQL%NOTFOUND then
        raise e_invalid_Proposal;
    End if;
    Exception
        When DUP_VAL_ON_INDEX then
            dbms_output.put_line('Ya existe una propuesta con el mismo Título');
            DBMS_OUTPUT.put_line(SQLCODE);
        When e_invalid_Proposal then
            DBMS_OUTPUT.PUT_LINE ('No existe una Propuesta llamada ' || pvTitle);
            DBMS_OUTPUT.PUT_LINE (SQLCODE);
        When OTHERS then
            dbms_output.put_line('Se ha producido un error, intentelo más tarde');
            DBMS_OUTPUT.put_line(SQLCODE);
    commit;
END updateProposal;




Procedure removeProposal(pvTitle Varchar2)is
e_invalid_Proposal EXCEPTION;

BEGIN
    Delete Proposal
    Where Title = pvTitle;

    if SQL%NOTFOUND then
        raise e_invalid_Proposal;
    End if;
    Exception
        When e_invalid_Proposal then
            DBMS_OUTPUT.PUT_LINE ('No existe una Propuesta llamada ' || pvTitle);
            DBMS_OUTPUT.PUT_LINE (SQLCODE);
        When OTHERS then
            dbms_output.put_line('Se ha producido un error, intentelo más tarde');
            DBMS_OUTPUT.put_line(SQLCODE);
    commit;
END removeProposal;


END adminProposal;