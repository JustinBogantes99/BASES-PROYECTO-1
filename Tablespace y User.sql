Create TABLESPACE Proyecto_Data
    Datafile 'C:\app\admin\oradata\dbprueba\proyecto_data.dbf'
    Size 10M
    REUSE
    Autoextend ON
    NEXT 512k
    MAXSIZE 200M;
       
Create TABLESPACE Proyecto_Index
    Datafile 'C:\app\admin\oradata\dbprueba\proyecto_index.dbf'
    Size 10M
    REUSE
    Autoextend ON
    NEXT 512k
    MAXSIZE 200M;
    
Create User admin
    Identified BY admin
    Default Tablespace Proyecto_data
    Quota 10M ON Proyecto_data
    Temporary Tablespace temp
    Quota 5M ON system;
    
GRANT create session to admin;
GRANT create table to admin;
GRANT Unlimited tablespace to admin;