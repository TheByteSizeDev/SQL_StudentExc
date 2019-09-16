-- Cohorts

CREATE TABLE Cohorts (
    Id	   INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Name   TEXT NOT NULL UNIQUE
);

-- Students

CREATE TABLE Students (
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	First_Name TEXT NOT NULL,
	Last_Name TEXT NOT NULL,
	Slack_Handle TEXT NOT NULL UNIQUE,
	CohortId INTEGER NOT NULL, 
	FOREIGN KEY(CohortId)
	REFERENCES Cohorts (Id)
		ON DELETE CASCADE
		ON UPDATE NO ACTION
);

-- Instructors 

CREATE TABLE Instructors (
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	First_Name TEXT NOT NULL,
	Last_Name TEXT NOT NULL,
	Slack_Handle TEXT NOT NULL UNIQUE,
	CohortId INTEGER NOT NULL, 
	FOREIGN KEY(CohortId)
	REFERENCES Cohorts (Id)
		ON DELETE CASCADE
		ON UPDATE NO ACTION
);

-- Exercises

CREATE TABLE Exercises (
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	Name TEXT NOT NULL,
	Language TEXT NOT NULL
);

-- Assignment

CREATE TABLE Assignment (
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	ExerciseId INTEGER NOT NULL,
	StudentId INTEGER NOT NULL,
	FOREIGN KEY (ExerciseId)
		REFERENCES Exercises (Id)
			ON DELETE CASCADE
			ON UPDATE NO ACTION
	FOREIGN KEY (StudentId)
		REFERENCES Students (Id)
			ON DELETE CASCADE
			ON UPDATE NO ACTION
);

-- Add 3 cohorts

INSERT INTO Cohorts (Name)
VALUES 
('Cohort 33'),
('Cohort 34'),
('Cohort 35');

-- Add 5 exercises

INSERT INTO Exercises (name, language)
VALUES
('Urban Planning', 'Python'),
('Companies And Employees', 'Python'),
('Jakes Flower Shop', 'Python'),
('Journal 4', 'Javascript'),
('Kennel 5', 'Javascript');

-- Add 3 instructors

INSERT INTO Instructors (First_Name, Last_Name, Slack_Handle, CohortId)
VALUES
('Joe', 'Shepherd', '@joes', '1'),
('Jisie', 'David', '@jisie', '2'),
('Mo', 'Silvera', '@momo', '3');

-- Add 7 students (don't put all students in the same cohort)

INSERT INTO Students (First_Name, Last_Name, Slack_Handle, CohortId)
VALUES
('Sydney', 'Noh', '@sidvicious', '1'),
('Sam', 'Birky', '@bikyboi', '1'),
('Amber', 'Gooch', '@goochy', '3'),
('Channing', 'Tatum', '@tater', '3'),
('Misty', 'Brinkley', '@onthebrink', '2'),
('Cheech', 'Marin', '@cheechy', '3'),
('John', 'Jacob', '@jinglehymmer', '3');

-- Assign 2 exercises to each student

INSERT INTO Assignment (ExerciseId, StudentId)
VALUES
(3, 4),
(3, 6);	
		