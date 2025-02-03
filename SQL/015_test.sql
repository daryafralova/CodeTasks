---You received an invitation to an amazing party. Now you need to write an insert statement to add yourself to the table of participants.
---participants table schema

---name (string)
---age (integer)
---attending (boolean)

INSERT INTO participants (name, age, attending)
VALUES ('Name', 23, true);

SELECT * FROM participants;