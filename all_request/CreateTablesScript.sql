CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL 
      CHECK (email ~* '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]+$'),
  date_registration DATE NOT NULL
);

CREATE TABLE steps (
  game_id INTEGER NOT NULL,
  number_step INTEGER NOT NULL,
  from_step VARCHAR(255) NOT NULL,
  to_step VARCHAR(255) NOT NULL,
  PRIMARY KEY (game_id, number_step),
  FOREIGN KEY (game_id) REFERENCES games(game_id) ON DELETE CASCADE
);

CREATE TABLE games (
  game_id SERIAL PRIMARY KEY,
  user_white_id INTEGER NOT NULL,
  user_black_id INTEGER NOT NULL,
  result_game VARCHAR(10) CHECK (result_game IN ('white', 'black', 'draw', 'pending')),
  ended_at TIMESTAMP NOT NULL,
  FOREIGN KEY (user_white_id) REFERENCES users(user_id),
  FOREIGN KEY (user_black_id) REFERENCES users(user_id)
);

CREATE TABLE friends (
  user_id INTEGER NOT NULL,
  friend_id INTEGER NOT NULL,
  PRIMARY KEY (user_id, friend_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (friend_id) REFERENCES users(user_id)
);
CREATE TABLE messages (
  message_id SERIAL PRIMARY KEY,
  user_from_id INTEGER NOT NULL,
  user_to_id INTEGER NOT NULL,
  text TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  FOREIGN KEY (user_from_id) REFERENCES users(user_id),
  FOREIGN KEY (user_to_id) REFERENCES users(user_id)
);
