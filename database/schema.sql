
/* Create Database */


/* Create Table for Book and label & Join table */


/* Create Table for Game and Author & Join table */
CREATE TABLE Author(
  id INTEGER PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL
)

CREATE TABLE Game(
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  publish_date DATE NOT NULL,
  last_played_at DATE NOT NULL,
  multiplayer NULL,
  archived BOOLEAN,
  author_id INTEGER REFERENCES author(id),
  label_id INTEGER REFERENCES label(id),
  genre_id INTEGER REFERENCES genre(id)
)

-- CREATE TABLE Author_Label_Genre(
--   author_id INTEGER REFERENCES author(id),
--   label_id INTEGER REFERENCES label(id),
--   genre_id INTEGER REFERENCES genre(id)
-- )

/* Create Table for Music and Genre & Join table */