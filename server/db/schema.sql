DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS allergens;
DROP TABLE IF EXISTS user_allergens;
DROP TABLE IF EXISTS food;
DROP TABLE IF EXISTS food_allergens;
DROP TABLE IF EXISTS user_body_records;

CREATE TABLE "allergens" (
	"id"	INTEGER,
	"allergen_name"	TEXT,
	PRIMARY KEY("id")
);


CREATE TABLE "food" (
	"food_id"	INTEGER,
	"food_name"	TEXT,
	"food_image_path"	TEXT,
	"calories"	INTEGER,
	"type"	TEXT,
	PRIMARY KEY("food_id")
);

CREATE TABLE "food_allergens" (
	"id"	INTEGER,
	"food_id"	INTEGER,
	"allergen_id"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("allergen_id") REFERENCES "allergens"("id"),
	FOREIGN KEY("food_id") REFERENCES "food"("food_id")
);

CREATE TABLE "user" (
	"user_id"	INTEGER,
	"email"	TEXT NOT NULL UNIQUE,
	"username"	TEXT,
	"password"	TEXT NOT NULL,
	"avatar_path"	TEXT,
	"gender"	TEXT,
	"vegi"	INTEGER,
	PRIMARY KEY("user_id" AUTOINCREMENT)
);

CREATE TABLE "user_allergens" (
	"id"	INTEGER,
	"user_id"	INTEGER,
	"allergen_id"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("user_id") REFERENCES "user"("user_id"),
	FOREIGN KEY("allergen_id") REFERENCES "allergens"("id")
);

CREATE TABLE "user_body_records" (
	"id"	INTEGER,
	"user_id"	INTEGER,
	"height"	NUMERIC,
	"weight"	NUMERIC,
	"updatetime"	NUMERIC,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "user"("user_id")
);

INSERT INTO food (food_id,food_name,food_image_path,calories,type) VALUES ('1', 'Pancake with Honey', 'images/foods/Pancake-with-Honey.png', '350', 'breakfast');
INSERT INTO food (food_id,food_name,food_image_path,calories,type) VALUES ('2', 'Bagel with Butter', 'images/foods/Bagel-with-Butter.png', '320', 'breakfast');
INSERT INTO food (food_id,food_name,food_image_path,calories,type) VALUES ('3', 'Cornbread', 'images/foods/Cornbread.png', '275', 'breakfast');
INSERT INTO food (food_id,food_name,food_image_path,calories,type) VALUES ('4', 'Boiled Noodles', 'images/foods/Boiled-Noodles.png', '150', 'breakfast');
INSERT INTO food (food_id,food_name,food_image_path,calories,type) VALUES ('5', 'Sausage', 'images/foods/Sausage.png', '175', 'breakfast');

INSERT INTO food (food_id,food_name,food_image_path,calories,type) VALUES ('6', 'Egg Sandwich', 'images/foods/Egg-Sandwich.png', '360', 'breakfast');
INSERT INTO food (food_id,food_name,food_image_path,calories,type) VALUES ('7', 'Pumpkin Porridge', 'images/foods/Pumpkin-Porridge.png', '105', 'breakfast');
INSERT INTO food (food_id,food_name,food_image_path,calories,type) VALUES ('8', 'Seafood Soup', 'images/foods/Seafood-Soup.png', '340', 'breakfast');
INSERT INTO food (food_id,food_name,food_image_path,calories,type) VALUES ('9', 'Dumplings', 'images/foods/Dumplings.png', '410', 'breakfast');
INSERT INTO food (food_id,food_name,food_image_path,calories,type) VALUES ('10', 'Steamed Bun', 'images/foods/Steamed-Bun.png', '230', 'breakfast');

INSERT INTO food (food_id,food_name,food_image_path,calories,type) VALUES ('11', 'Bread Baked Chicken', 'images/foods/Bread-Baked-Chicken.png', '920', 'dinner');
INSERT INTO food (food_id,food_name,food_image_path,calories,type) VALUES ('12', 'Pork Salad', 'images/foods/Pork-Salad.png', '600', 'dinner');
INSERT INTO food (food_id,food_name,food_image_path,calories,type) VALUES ('13', 'Stir-fried Vegetables', 'images/foods/Stir-fried-Vegetables.png', '505', 'dinner');
INSERT INTO food (food_id,food_name,food_image_path,calories,type) VALUES ('14', 'Honey Garlic Ribs', 'images/foods/Honey-Garlic-Ribs.png', '950', 'dinner');
INSERT INTO food (food_id,food_name,food_image_path,calories,type) VALUES ('15', 'Beef Taco', 'images/foods/Beef-Taco.png', '800', 'dinner');

INSERT INTO food (food_id,food_name,food_image_path,calories,type) VALUES ('16', 'Greek Shrimp', 'images/foods/Greek-Shrimp.png', '610', 'dinner');
INSERT INTO food (food_id,food_name,food_image_path,calories,type) VALUES ('17', 'Steak with Sauce', 'images/foods/Steak-with-Sauce.png', '910', 'dinner');
INSERT INTO food (food_id,food_name,food_image_path,calories,type) VALUES ('18', 'Mashed Potatoes', 'images/foods/Mashed-Potatoes.png', '520', 'dinner');
INSERT INTO food (food_id,food_name,food_image_path,calories,type) VALUES ('19', 'Cauliflower', 'images/foods/Cauliflower.png', '660', 'dinner');
INSERT INTO food (food_id,food_name,food_image_path,calories,type) VALUES ('20', 'French fries', 'images/foods/French-fries.png', '550', 'dinner');


INSERT INTO allergens (id, allergen_name) VALUES ('1', 'milk');
INSERT INTO allergens (id, allergen_name) VALUES ('2', 'wheat');
INSERT INTO allergens (id, allergen_name) VALUES ('3', 'seafood');


INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('1', '1', '1');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('2', '2', '2');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('3', '3', '');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('4', '4', '');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('5', '5', '');

INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('6', '6', '2');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('7', '7', '');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('8', '8', '3');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('9', '9', '');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('10', '10', '2');

INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('11', '11', '1');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('12', '12', '1');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('13', '13', '');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('14', '14', '');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('15', '15', '');

INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('16', '16', '1');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('17', '17', '');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('18', '18', '');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('19', '19', '');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('20', '20', '');

INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('21', '21', '2');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('22', '22', '');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('23', '23', '2');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('24', '24', '1');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('25', '25', '2');

INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('26', '26', '2');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('27', '27', '2');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('28', '28', '2');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('29', '29', '1');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('30', '30', '3');

INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('31', '31', '');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('32', '32', '2');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('33', '33', '');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('34', '34', '3');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('35', '35', '');

INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('36', '36', '');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('37', '37', '3');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('38', '38', '3');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('39', '39', '2');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('40', '40', '');

INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('41', '41', '2');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('42', '42', '2');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('43', '43', '2');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('44', '44', '1');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('45', '1', '2');

INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('46', '11', '2');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('47', '16', '3');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('48', '24', '2');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('49', '25', '3');
INSERT INTO food_allergens (id, food_id, allergen_id) VALUES ('50', '29', '2');

