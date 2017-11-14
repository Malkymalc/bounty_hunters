DROP TABLE bounties;

CREATE TABLE bounties(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  bounty_value INT8,
  cashed_in BOOLEAN,
  collected_by VARCHAR(255)
);

INSERT INTO bounties(name,bounty_value,cashed_in)
  VALUES('Alan',90009,false);

INSERT INTO bounties(name,bounty_value,cashed_in)
  VALUES('Bob',7856700,false);

INSERT INTO bounties(name,bounty_value,cashed_in)
  VALUES('Chris',3452907,false);

INSERT INTO bounties(name,bounty_value,cashed_in)
  VALUES('Dave',6848372700,false);

INSERT INTO bounties(name,bounty_value,cashed_in,collected_by)
  VALUES('Eddy',90009,true,'BobFet');
