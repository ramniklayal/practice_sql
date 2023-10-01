CREATE TABLE csgo (
    alias VARCHAR(12) PRIMARY KEY UNIQUE,
    hours INT,
    role VARCHAR(10),
    mmrank VARCHAR(10),
    hspercent INT,
    city VARCHAR(18)
);

SELECT * FROM csgo;

INSERT INTO csgo VALUES('Viper', 1000, 'igl', 'master', 75, 'brampton');

INSERT INTO csgo VALUES('Ninja', 1300, 'postplant', 'global', 85, 'kitchener');

INSERT INTO csgo VALUES('hks', 4000, 'awp', 'gold', 35, 'etobicoke');

INSERT INTO csgo VALUES('coconut', 800, 'entry', 'gold', 60, 'hamilton');

INSERT INTO csgo VALUES('peepa', 900, 'entry', 'gold', 70, 'brampton');

INSERT INTO csgo VALUES('bobby', 3000, 'entry', 'silver', 50, 'brampton');

INSERT INTO csgo VALUES('yosimity', 900, 'awp', 'master', 70, 'new york');

INSERT INTO csgo VALUES('pd', 1300, 'postplant', 'master', 85, 'brampton');

UPDATE csgo
SET mmrank = 'global'
WHERE hspercent > 70;