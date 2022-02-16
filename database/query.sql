 
CREATE TABLE musicalbum(
  id int GENERATED ALWAYS AS IDENTITY,
  on_spotify boolean,
  PRIMARY KEY(id),
  item_id int NOT NULL,
  CONSTRAINT kf_items FOREIGN KEY(item_id) REFERENCES items(id) ON DELETE CASCADE
);

CREATE TABLE genres (
  id int,
  PRIMARY KEY(id),
  name varchar(45)
);

CREATE TABLE items (
  id int GENERATED ALWAYS AS IDENTITY NOT NULL,
  PRIMARY KEY (id),
  genre varchar(30),
  author varchar(30),
  label varchar(30),
  publish_date int,
  archived boolean,
  album_id int, 
  genre_id int,
  CONSTRAINT kf_albums FOREIGN KEY(album_id) REFERENCES albums(id) ON DELETE CASCADE,
  CONSTRAINT kf_genres FOREIGN KEY(genre_id) REFERENCES genres(id) ON DELETE CASCADE
);


CREATE TABLE books(
    book_id int GENERATED ALWAYS AS IDENTITY,
    publisher VARCHAR(200),
    publish_date int,
    cover_state VARCHAR(5)
    PRIMARY KEY(book_id),
    item_id int NOT NULL,
    CONSTRAINT kf_items_books FOREIGN KEY(book_id) REFERENCES items(id) ON DELETE CASCADE
);

CREATE TABLE labels (
  label_id int,
  author VARCHAR(45),
  color VARCHAR(45),
  PRIMARY KEY(label_id)
);
