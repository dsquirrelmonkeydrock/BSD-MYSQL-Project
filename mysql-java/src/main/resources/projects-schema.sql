DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
project_id INT AUTO_INCREMENT NOT NULL,
PRIMARY KEY (project_id),
project_name VARCHAR(128) NOT NULL,
estimated_hours DECIMAL(7, 2),
actual_hours DECIMAL (7, 2),
difficulty INT,
notes TEXT
);

CREATE TABLE category (
category_id INT AUTO_INCREMENT NOT NULL,
PRIMARY KEY (category_id),
category_name VARCHAR(128) NOT NULL
);

CREATE TABLE project_category (
project_id INT NOT NULL,
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
category_id INT NOT NULL,
FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
UNIQUE KEY(project_id, category_id)
);

CREATE TABLE step (
step_id INT AUTO_INCREMENT NOT NULL,
PRIMARY KEY (step_id),
project_id INT NOT NULL,
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
step_text TEXT NOT NULL,
step_order INT NOT NULL
);

CREATE TABLE material (
    material_id INT AUTO_INCREMENT NOT NULL,
    PRIMARY KEY (material_id),
    project_id INT NOT NULL,
    FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
    material_name VARCHAR(128) NOT NULL,
    num_required INT,
    cost DECIMAL(7,2)

);

INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes)
VALUES ('Coaster', 3, 4, 1, 'make a coaster with laser engraving');

INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes)
VALUES ('Cutting Board', 6, 8, 3, 'make an end grain cutting board');

INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes)
VALUES ('Wine Caddy', 1, 2, 2, 'make a caddy for wine glasses that sits on top of wine bottle');