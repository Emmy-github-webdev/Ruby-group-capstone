 
CREATE TABLE MusicAlbum(
  id int GENERATED ALWAYS AS IDENTITY,
  on_spotify boolean,
  PRIMARY KEY(id),
  item_id int NOT NULL,
  CONSTRAINT kf_items FOREIGN KEY(item_id) REFERENCES items(id) ON DELETE CASCADE
);
