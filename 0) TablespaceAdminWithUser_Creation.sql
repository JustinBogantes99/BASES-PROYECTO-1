CREATE TABLESPACE ADMIN_Data
 DATAFILE 'C:\app\stevenpc\oradata\dbproyecto\admindata01.dbf'
 SIZE 10M
 REUSE
 AUTOEXTEND ON
 NEXT 512K
 MAXSIZE 200M;


CREATE TABLESPACE ADMIN_Ind
 DATAFILE 'C:\app\stevenpc\oradata\dbproyecto\adminind01.dbf'
 SIZE 10M
 REUSE
 AUTOEXTEND ON
 NEXT 512K
 MAXSIZE 200M;    
 
CREATE USER admin
 IDENTIFIED BY admin
 DEFAULT TABLESPACE admin_data
 QUOTA 10M ON admin_data
 TEMPORARY TABLESPACE temp
 QUOTA 5M ON system; 
 
 
grant create session to admin;
grant create table to admin;

GRANT CONNECT TO admin;
GRANT CREATE ANY INDEX TO admin;
GRANT UNLIMITED TABLESPACE TO admin; 
GRANT CREATE SEQUENCE TO admin;
GRANT CREATE TRIGGER TO admin;
 
