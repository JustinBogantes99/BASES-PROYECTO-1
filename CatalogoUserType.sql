INSERT INTO user_type (id_user_type, name, created_by, creation_date) 
VALUES (s_user_type.nextval, 'Administrador', USER, SYSDATE);

INSERT INTO user_type (id_user_type, name, created_by, creation_date) 
VALUES (s_user_type.nextval, 'Usuario', USER, SYSDATE);


select * from user_type;