alter table categoryxfavorite
    Drop Constraint PK_CATEXFAV_ID_FAVORITE;
    
    
alter table User_Name
    Drop Constraint FK_USUARIO_PERSON;
    
    
drop table Favorite;

alter table categoryxfavorite
    Add Constraint FK_USERNAME_CXF FOREIGN Key (Username) references User_Name(Username);
    
    
--PENDIENTE POR HACER: Ver que hacemos con el Id_favorite en User_Name--
