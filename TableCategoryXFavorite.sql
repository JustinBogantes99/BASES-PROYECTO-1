--------------------------------TABLE CategoryXFavorite-----------------------------
create table CategoryXFavorite
(
       id_Category number(6) CONSTRAINT CateXFav_id_Category_nn NOT null,
       id_Favorite number(6) CONSTRAINT CateXFav_id_Favorite_nn NOT null
);

ALTER TABLE CategoryXFavorite
  ADD CONSTRAINT pk_CateXFav PRIMARY KEY (id_Category, id_Favorite)
  USING INDEX
  TABLESPACE admin_ind PCTFREE 20
  STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

ALTER TABLE CategoryXFavorite
  ADD CONSTRAINT pk_CateXFav_id_Category FOREIGN KEY
  (id_Category) REFERENCES
  category(id_Category);

ALTER TABLE CategoryXFavorite
  ADD CONSTRAINT pk_CateXFav_id_Favorite FOREIGN KEY
  (id_Favorite) REFERENCES
  favorite(id_Favorite);
