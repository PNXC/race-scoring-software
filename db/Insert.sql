insert into event (name, event_date, location, entry_user, entry_datetime, change_user, change_datetime)
values ('2025 Family Night', '8/1/2025', 'Settlers Park', 'jimgaull', getdate(), 'jimgaull', getdate())

insert into tag_type(name, entry_user, entry_datetime, change_user, change_datetime)
values	('Gender', 'jimgaull', getdate(), 'jimgaull', getdate()),
		('Division', 'jimgaull', getdate(), 'jimgaull', getdate()),
		('Country', 'jimgaull', getdate(), 'jimgaull', getdate())

insert into tag(name, tag_type_id, entry_user, entry_datetime, change_user, change_datetime)
values	('Male', 1, 'jimgaull', getdate(), 'jimgaull', getdate()),
		('Female', 1, 'jimgaull', getdate(), 'jimgaull', getdate()),
		('5th Grade & Under', 2, 'jimgaull', getdate(), 'jimgaull', getdate()),
		('6th/7th Grade', 2, 'jimgaull', getdate(), 'jimgaull', getdate()),
		('8th Grade', 2, 'jimgaull', getdate(), 'jimgaull', getdate()),
		('F/S', 2, 'jimgaull', getdate(), 'jimgaull', getdate()),
		('Jr/Sr', 2, 'jimgaull', getdate(), 'jimgaull', getdate()),
		('Alumni', 2, 'jimgaull', getdate(), 'jimgaull', getdate()),
		('Mom', 2, 'jimgaull', getdate(), 'jimgaull', getdate()),
		('Dad', 2, 'jimgaull', getdate(), 'jimgaull', getdate()),
		('Bahamas', 3, 'jimgaull', getdate(), 'jimgaull', getdate()),
		('Barbados', 3, 'jimgaull', getdate(), 'jimgaull', getdate()),
		('Iraq', 3, 'jimgaull', getdate(), 'jimgaull', getdate()),
		('New Zealand', 3, 'jimgaull', getdate(), 'jimgaull', getdate()),
		('Yemen', 3, 'jimgaull', getdate(), 'jimgaull', getdate())

insert into event_medal_tag(event_id, tag_type_id, number_medals, score_type, entry_user, entry_datetime, change_user, change_datetime)
values	(1, 1, 3, 'I', 'jimgaull', getdate(), 'jimgaull', getdate()),
		(1, 2, 3, 'I', 'jimgaull', getdate(), 'jimgaull', getdate()),
		(1, 3, 3, 'T', 'jimgaull', getdate(), 'jimgaull', getdate())

DROP TABLE IF EXISTS #StagingPerson;
GO
CREATE TABLE #StagingPerson (Name VARCHAR(100), Time VARCHAR(100), Division VARCHAR(100), Gender VARCHAR(100), Parent1 VARCHAR(100), Parent2 VARCHAR(100),
	FirstName VARCHAR(100), LastName VARCHAR(100), GenderTagId INT, DivisionTagId INT, Parent1FirstName VARCHAR(100), Parent1LastName VARCHAR(100),
	Parent2FirstName VARCHAR(100), Parent2LastName VARCHAR(100),mom_person_id INT, dad_person_id INT, person_id int)
GO

DROP TABLE IF EXISTS #StagingCountry;
GO
CREATE TABLE #StagingCountry(Name VARCHAR(100), Country VARCHAR(100), person_id int, tag_id int)
GO

INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Cal Anderson','10:20','Jr/Sr','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Ivy Anderson','0:00','6th/7th Grade','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Dylan Araiza','11:11','Jr/Sr','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Ian Bailey','16:04','Jr/Sr','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Liam Beavers','10:22','Jr/Sr','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Kate Beavers','12:24','F/S','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Emily Beavers','17:06','6th/7th Grade','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Alynn Bledsoe','0:00','Jr/Sr','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Eliza Boyk','14:36','F/S','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Zach Bucsanyi','11:24','Jr/Sr','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Pratyush Cabral','0:00','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Maddy Cairo','15:55','Jr/Sr','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Ava Cole','0:00','F/S','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Aidan Connors','10:07','Jr/Sr','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Evelynn Culver','0:00','8th Grade','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Ayla Czarniewski','12:11','Jr/Sr','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Marlie Czarniewski','11:59','Jr/Sr','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Thomas Czerwinski','9:51','Jr/Sr','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Ryan Czerwinski','12:28','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Ben Damiani','11:47','Jr/Sr','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Matt Damiani','0:00','Jr/Sr','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Emery Davis','0:00','F/S','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Maddie Derks','15:57','Jr/Sr','Female','Andy Derks','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Katie Deutscher','0:00','6th/7th Grade','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Jonathan Devore','0:00','8th Grade','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Logan Dodson','11:31','Jr/Sr','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Aidan Dogan','0:00','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Charlie Donaghey','0:00','8th Grade','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Savannah Donaghey','0:00','6th/7th Grade','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Alex Drescher','12:48','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Laurel Eager','12:38','F/S','Female','Chris Eager','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Olivia Eager','12:44','F/S','Female','Chris Eager','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Alice Eager','17:05','6th/7th Grade','Female','Chris Eager','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Serena Eggert','14:26','8th Grade','Female','Jeff Eggert','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Liam Faulkner','0:00','6th/7th Grade','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Dominic Frigo','10:12','Jr/Sr','Male','Kendra Frigo','Gino Frigo')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Ben Gatlin','14:46','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Madeline Gatlin','12:35','6th/7th Grade','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Gavin Hall','10:02','Jr/Sr','Male','Roxanne Hall','Shawn Edwards')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Maverick Hall','14:30','6th/7th Grade','Male','Roxanne Hall','Shawn Edwards')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('AJ Hartmann','11:14','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Luke Hartmann','15:31','8th Grade','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Wyatt Hartzold','0:00','8th Grade','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Presley Hartzold','15:32','F/S','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Sameera Harwood','0:00','6th/7th Grade','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Jocelyn Hatcher','17:43','F/S','Female','Tim Hatcher','Kim Hatcher')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Ian Hatzl','16:02','6th/7th Grade','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Chase Hemmer','11:35','F/S','Male','Matt Hemmer','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Keagan Herbert','0:00','6th/7th Grade','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('McKenna Hipp','0:00','Jr/Sr','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Ireland Hockman','0:00','Jr/Sr','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Jack Honiotes','12:43','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Emaan Hussain','13:37','Jr/Sr','Female','Shireen Hussain','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Layan Jabbar','0:00','Jr/Sr','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Mason Jacobson','0:00','8th Grade','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Sean Jansen','10:49','Jr/Sr','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Emma Jeszka','0:00','8th Grade','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Leah Jones','0:00','F/S','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Samantha Jurgovan','0:00','6th/7th Grade','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Stone Kaczmarek','0:00','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Halle Kalvig','0:00','8th Grade','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Amaan Khan','0:00','Jr/Sr','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Wyatt Knowles','13:08','F/S','Male','Christina Knowles','Bryan Knowles')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Griffin Kreml','14:18','6th/7th Grade','Male','Brian Kreml','Laurie Kreml')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Austin Krumin','11:50','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Aidan Kyrychenko','10:36','Jr/Sr','Male','Pete Kyrychenko','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Dominic LaMontagna','0:00','Jr/Sr','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Aaron Malgireddy','0:00','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Adam Maresca','0:00','6th/7th Grade','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Audrey Maresca','0:00','F/S','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Luke Marks','0:00','Jr/Sr','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('James Maso','10:06','Jr/Sr','Male','Joe Maso','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Biruk Melak','11:11','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Karl Miller','11:29','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Megan Morris','0:00','Jr/Sr','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Parker Muck','0:00','8th Grade','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Madelyn Olivares','0:00','F/S','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Andrew Paciero','0:00','6th/7th Grade','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Kaden Palmerin','0:00','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Joseph Pastrick','0:00','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Evan Patchett','0:00','Jr/Sr','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Mason Patchett','0:00','8th Grade','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Sienna Prendergast','0:00','6th/7th Grade','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Paige Pyatt','0:00','F/S','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Caleb Raj','0:00','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Emmett Raymond','0:00','8th Grade','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Alex Richards','0:00','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Amaris Rinconeno','0:00','F/S','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Israel Rinconeno','0:00','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Cameron Ring','0:00','Jr/Sr','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Matthew Rodriguez','17:57','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Frank Roppolo','0:00','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Aidan Rosas','14:08','Jr/Sr','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Nicole Rousonelos','0:00','Jr/Sr','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Courtney Rudakas','0:00','6th/7th Grade','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Mitchell Rudland','10:58','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Anthony Russo','13:15','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Tino Russo','13:34','6th/7th Grade','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Tessa Russo','12:27','Jr/Sr','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Giu Giu Russo','16:52','6th/7th Grade','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Jasleen Sanghera','16:46','8th Grade','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Adianna Santini','15:35','F/S','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Jake Schmauderer','11:35','Jr/Sr','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Alex Silva','12:17','F/S','Male','Froylan Silva','Diana Silva')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Madeline Singh','13:45','Jr/Sr','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Oliver Smith','13:15','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Peyton Street','0:00','8th Grade','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Violet Ternig','0:00','F/S','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Blake Thill','14:31','F/S','Male','Kevin Thill','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Aven Thomas','14:37','F/S','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Payton Ulaszek','17:47','6th/7th Grade','Female','Dan Ulaszek','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Esmi Vega','0:00','F/S','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Rahul Vijay','0:00','8th Grade','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Laye Vishwakarma','0:00','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Mallory Weitzmann','15:05','F/S','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Troy Wilson','13:10','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Diviya Wishart','0:00','6th/7th Grade','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Skylyn Worden','14:39','F/S','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Sedona Worden','15:47','8th Grade','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Zeta Zbroszczyk','13:00','Jr/Sr','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Sam Barranco','11:04','Alumni','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Sean Bruyere','12:22','Alumni','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Olan Bruyere','12:35','Alumni','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Matt Hemmer','12:04','Dad','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Mia Hemmer','16:03','5th Grade & Under','Female','Matt Hemmer','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Theo Honiotes','0:00','5th Grade & Under','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Drew Derks','17:06','5th Grade & Under','Female','Andy Derks','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Andy Derks','10:55','Dad','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Adam Haar','15:43','Alumni','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Kendra Frigo','15:36','Mom','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Gino Frigo','14:52','Dad','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Pete Kyrychenko','14:34','Dad','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Andree Hernandez','15:21','Alumni','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Joe Maso','16:36','Dad','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Ben Hatzl','0:00','5th Grade & Under','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Breanna Wilson','0:00','5th Grade & Under','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Hank Kreml','17:05','5th Grade & Under','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('James Beavers','17:02','5th Grade & Under','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Joey Conklin','0:00','5th Grade & Under','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Keshav Shah','17:05','5th Grade & Under','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Logan DeRose','15:30','5th Grade & Under','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Lucas Murphy','13:43','5th Grade & Under','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Sierra Worden','16:51','5th Grade & Under','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Tim Hatcher','14:48','Dad','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Brian Kreml','17:37','Dad','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Laurie Kreml','22:50','Mom','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Dan Ulaszek','17:47','Dad','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Roxanne Hall','13:46','Mom','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Shawn Edwards','17:39','Dad','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Chris Eager','14:09','Dad','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Ethan Fuentes','12:25','Alumni','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Quinn Davis','10:52','Alumni','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Evan Reneau','14:53','Alumni','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Jeff Eggert','14:59','Dad','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Pete Honiotes','15:22','8th Grade','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Kevin Thill','17:18','Dad','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Kim Hatcher','18:02','Mom','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Lucy Eager','16:15','5th Grade & Under','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Shireen Hussain','0:00','Mom','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Christina Knowles','0:00','Mom','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Bryan Knowles','0:00','Dad','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Froylan Silva','21:47','Dad','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Diana Silva','21:26','Mom','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Nathan Alli','13:22','Alumni','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Jacob Czerwinski','16:02','F/S','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Jon Richardson','19:22','Alumni','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Sean Bruyere','12:22','Alumni','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Nathan Alli','13:22','Alumni','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Andre Hernandez','0:00','Alumni','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Owen Bruyere','0:00','Alumni','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Kyle Bender','14:11','Dad','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Kahlan Derose','0:00','Jr/Sr','Female','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Karston Zero','15:26','Jr/Sr','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Easton MIller','11:33','Alumni','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Nathaniel Lenning','12:41','Alumni','Male','','')
INSERT INTO #StagingPerson(Name, Time, Division, Gender, Parent1, Parent2) VALUES ('Avery Thomas','21:14','5th Grade & Under','Female','','')			
GO
insert into #StagingCountry (Name, Country) values ('Cal Anderson','New Zealand')
insert into #StagingCountry (Name, Country) values ('Ivy Anderson','Yemen')
insert into #StagingCountry (Name, Country) values ('Dylan Araiza','Barbados')
insert into #StagingCountry (Name, Country) values ('Ian Bailey','Iraq')
insert into #StagingCountry (Name, Country) values ('Liam Beavers','Barbados')
insert into #StagingCountry (Name, Country) values ('Kate Beavers','Iraq')
insert into #StagingCountry (Name, Country) values ('Emily Beavers','Barbados')
insert into #StagingCountry (Name, Country) values ('Alynn Bledsoe','New Zealand')
insert into #StagingCountry (Name, Country) values ('Eliza Boyk','Bahamas')
insert into #StagingCountry (Name, Country) values ('Zach Bucsanyi','Iraq')
insert into #StagingCountry (Name, Country) values ('Pratyush Cabral','New Zealand')
insert into #StagingCountry (Name, Country) values ('Maddy Cairo','New Zealand')
insert into #StagingCountry (Name, Country) values ('Ava Cole','Barbados')
insert into #StagingCountry (Name, Country) values ('Aidan Connors','Yemen')
insert into #StagingCountry (Name, Country) values ('Evelynn Culver','Iraq')
insert into #StagingCountry (Name, Country) values ('Ayla Czarniewski','Yemen')
insert into #StagingCountry (Name, Country) values ('Marlie Czarniewski','Barbados')
insert into #StagingCountry (Name, Country) values ('Thomas Czerwinski','New Zealand')
insert into #StagingCountry (Name, Country) values ('Ryan Czerwinski','Iraq')
insert into #StagingCountry (Name, Country) values ('Ben Damiani','New Zealand')
insert into #StagingCountry (Name, Country) values ('Matt Damiani','Yemen')
insert into #StagingCountry (Name, Country) values ('Emery Davis','Bahamas')
insert into #StagingCountry (Name, Country) values ('Maddie Derks','Bahamas')
insert into #StagingCountry (Name, Country) values ('Katie Deutscher','Barbados')
insert into #StagingCountry (Name, Country) values ('Jonathan Devore','Barbados')
insert into #StagingCountry (Name, Country) values ('Logan Dodson','Iraq')
insert into #StagingCountry (Name, Country) values ('Aidan Dogan','Yemen')
insert into #StagingCountry (Name, Country) values ('Charlie Donaghey','Barbados')
insert into #StagingCountry (Name, Country) values ('Alex Drescher','New Zealand')
insert into #StagingCountry (Name, Country) values ('Laurel Eager','New Zealand')
insert into #StagingCountry (Name, Country) values ('Olivia Eager','Yemen')
insert into #StagingCountry (Name, Country) values ('Alice Eager','Barbados')
insert into #StagingCountry (Name, Country) values ('Serena Eggert','Yemen')
insert into #StagingCountry (Name, Country) values ('Liam Faulkner','Bahamas')
insert into #StagingCountry (Name, Country) values ('Dominic Frigo','Bahamas')
insert into #StagingCountry (Name, Country) values ('Ben Gatlin','Bahamas')
insert into #StagingCountry (Name, Country) values ('Madeline Gatlin','New Zealand')
insert into #StagingCountry (Name, Country) values ('Gavin Hall','Yemen')
insert into #StagingCountry (Name, Country) values ('Maverick Hall','Bahamas')
insert into #StagingCountry (Name, Country) values ('AJ Hartmann','Yemen')
insert into #StagingCountry (Name, Country) values ('Luke Hartmann','Bahamas')
insert into #StagingCountry (Name, Country) values ('Wyatt Hartzold','New Zealand')
insert into #StagingCountry (Name, Country) values ('Presley Hartzold','Bahamas')
insert into #StagingCountry (Name, Country) values ('Sameera Harwood','Yemen')
insert into #StagingCountry (Name, Country) values ('Jocelyn Hatcher','Yemen')
insert into #StagingCountry (Name, Country) values ('Ian Hatzl','Bahamas')
insert into #StagingCountry (Name, Country) values ('Chase Hemmer','New Zealand')
insert into #StagingCountry (Name, Country) values ('McKenna Hipp','Iraq')
insert into #StagingCountry (Name, Country) values ('Ireland Hockman','Iraq')
insert into #StagingCountry (Name, Country) values ('Jack Honiotes','New Zealand')
insert into #StagingCountry (Name, Country) values ('Emaan Hussain','Iraq')
insert into #StagingCountry (Name, Country) values ('Layan Jabbar','New Zealand')
insert into #StagingCountry (Name, Country) values ('Mason Jacobson','Iraq')
insert into #StagingCountry (Name, Country) values ('Sean Jansen','Bahamas')
insert into #StagingCountry (Name, Country) values ('Emma Jeszka','Barbados')
insert into #StagingCountry (Name, Country) values ('Leah Jones','Iraq')
insert into #StagingCountry (Name, Country) values ('Samantha Jurgovan','Yemen')
insert into #StagingCountry (Name, Country) values ('Stone Kaczmarek','Iraq')
insert into #StagingCountry (Name, Country) values ('Halle Kalvig','New Zealand')
insert into #StagingCountry (Name, Country) values ('Amaan Khan','Barbados')
insert into #StagingCountry (Name, Country) values ('Wyatt Knowles','Yemen')
insert into #StagingCountry (Name, Country) values ('Griffin Kreml','Yemen')
insert into #StagingCountry (Name, Country) values ('Austin Krumin','New Zealand')
insert into #StagingCountry (Name, Country) values ('Aidan Kyrychenko','Barbados')
insert into #StagingCountry (Name, Country) values ('Aaron Malgireddy','Barbados')
insert into #StagingCountry (Name, Country) values ('Adam Maresca','New Zealand')
insert into #StagingCountry (Name, Country) values ('Audrey Maresca','Barbados')
insert into #StagingCountry (Name, Country) values ('James Maso','Iraq')
insert into #StagingCountry (Name, Country) values ('Biruk Melak','Iraq')
insert into #StagingCountry (Name, Country) values ('Karl Miller','Bahamas')
insert into #StagingCountry (Name, Country) values ('Parker Muck','Iraq')
insert into #StagingCountry (Name, Country) values ('Madelyn Olivares','Iraq')
insert into #StagingCountry (Name, Country) values ('Andrew Paciero','Iraq')
insert into #StagingCountry (Name, Country) values ('Kaden Palmerin','Barbados')
insert into #StagingCountry (Name, Country) values ('Evan Patchett','Iraq')
insert into #StagingCountry (Name, Country) values ('Mason Patchett','New Zealand')
insert into #StagingCountry (Name, Country) values ('Sienna Prendergast','Bahamas')
insert into #StagingCountry (Name, Country) values ('Paige Pyatt','Barbados')
insert into #StagingCountry (Name, Country) values ('Caleb Raj','Yemen')
insert into #StagingCountry (Name, Country) values ('Emmett Raymond','Barbados')
insert into #StagingCountry (Name, Country) values ('Alex Richards','Bahamas')
insert into #StagingCountry (Name, Country) values ('Amaris Rinconeno','Bahamas')
insert into #StagingCountry (Name, Country) values ('Israel Rinconeno','New Zealand')
insert into #StagingCountry (Name, Country) values ('Matthew Rodriguez','Yemen')
insert into #StagingCountry (Name, Country) values ('Frank Roppolo','New Zealand')
insert into #StagingCountry (Name, Country) values ('Aidan Rosas','Barbados')
insert into #StagingCountry (Name, Country) values ('Courtney Rudakas','New Zealand')
insert into #StagingCountry (Name, Country) values ('Mitchell Rudland','Barbados')
insert into #StagingCountry (Name, Country) values ('Anthony Russo','Bahamas')
insert into #StagingCountry (Name, Country) values ('Tino Russo','Bahamas')
insert into #StagingCountry (Name, Country) values ('Tessa Russo','Bahamas')
insert into #StagingCountry (Name, Country) values ('Giu Giu Russo','Iraq')
insert into #StagingCountry (Name, Country) values ('Jasleen Sanghera','Bahamas')
insert into #StagingCountry (Name, Country) values ('Adianna Santini','Bahamas')
insert into #StagingCountry (Name, Country) values ('Jake Schmauderer','Barbados')
insert into #StagingCountry (Name, Country) values ('Alex Silva','Barbados')
insert into #StagingCountry (Name, Country) values ('Madeline Singh','Barbados')
insert into #StagingCountry (Name, Country) values ('Oliver Smith','Bahamas')
insert into #StagingCountry (Name, Country) values ('Peyton Street','Bahamas')
insert into #StagingCountry (Name, Country) values ('Violet Ternig','Iraq')
insert into #StagingCountry (Name, Country) values ('Blake Thill','Yemen')
insert into #StagingCountry (Name, Country) values ('Aven Thomas','Barbados')
insert into #StagingCountry (Name, Country) values ('Payton Ulaszek','Yemen')
insert into #StagingCountry (Name, Country) values ('Esmi Vega','Yemen')
insert into #StagingCountry (Name, Country) values ('Rahul Vijay','Yemen')
insert into #StagingCountry (Name, Country) values ('Laye Vishwakarma','Iraq')
insert into #StagingCountry (Name, Country) values ('Mallory Weitzmann','Iraq')
insert into #StagingCountry (Name, Country) values ('Troy Wilson','Yemen')
insert into #StagingCountry (Name, Country) values ('Diviya Wishart','Barbados')
insert into #StagingCountry (Name, Country) values ('Skylyn Worden','New Zealand')
insert into #StagingCountry (Name, Country) values ('Sedona Worden','New Zealand')
insert into #StagingCountry (Name, Country) values ('Zeta Zbroszczyk','Yemen')

update #StagingPerson
set Parent1 = null
where Parent1 = ''

update #StagingPerson
set Parent2 = null
where Parent2 = ''

update #StagingPerson
SET FirstName = LEFT(Name, LEN(Name) - CHARINDEX(' ', REVERSE(Name))),
    LastName = RIGHT(Name, CHARINDEX(' ', REVERSE(Name)) - 1),
	GenderTagId = CASE Gender
					When 'Male' then 1
					else 2
				   END,
	DivisionTagId = CASE Division
					WHEN '5th Grade & Under' THEN 3
					WHEN '6th/7th Grade' THEN 4
					WHEN '8th Grade' THEN 5
					WHEN 'Alumni' THEN 8
					WHEN 'Dad' THEN 10
					WHEN 'F/S' THEN 6
					WHEN 'Jr/Sr' THEN 7
					WHEN 'Mom' THEN 9
				END,
	Parent1FirstName = LEFT(Parent1, LEN(Parent1) - CHARINDEX(' ', REVERSE(Parent1))),
	Parent1LastName = RIGHT(Parent1, CHARINDEX(' ', REVERSE(Parent1)) - 1),
	Parent2FirstName = LEFT(Parent2, LEN(Parent2) - CHARINDEX(' ', REVERSE(Parent2))),
	Parent2LastName = RIGHT(Parent2, CHARINDEX(' ', REVERSE(Parent2)) - 1);

insert into Person (first_name, last_name, entry_user, entry_datetime, change_user, change_datetime)
select FirstName, LastName, 'jimgaull', getdate(), 'jimgaull', getdate()
from #StagingPerson;

update sp 
set person_id = p.person_id
from #StagingPerson sp
join Person p
	on sp.FirstName = p.first_name
	and sp.LastName = p.last_name


insert into event_registration (event_id, person_id, entry_user, entry_datetime, change_user, change_datetime)
select 1, person_id, 'jimgaull', getdate(), 'jimgaull', getdate()
from Person;

insert into event_registration_tag (event_registration_id, tag_id, entry_user, entry_datetime, change_user, change_datetime)
select er.event_registration_id, sp.GenderTagId, 'jimgaull', getdate(), 'jimgaull', getdate()
from #StagingPerson sp
join event_registration er
	on sp.person_id = er.person_id;

insert into event_registration_tag (event_registration_id, tag_id, entry_user, entry_datetime, change_user, change_datetime)
select er.event_registration_id, sp.DivisionTagId, 'jimgaull', getdate(), 'jimgaull', getdate()
from #StagingPerson sp
join event_registration er
	on sp.person_id = er.person_id

update sc
set person_id = sp.person_id
from #StagingCountry sc
join #StagingPerson sp
	on sc.Name = sp.Name

update sc
set tag_id = t.tag_id
from #StagingCountry sc
join tag t
	on sc.Country = t.name
	and t.tag_type_id = 3

insert into event_registration_tag (event_registration_id, tag_id, entry_user, entry_datetime, change_user, change_datetime)
select er.event_registration_id, sc.tag_id, 'jimgaull', getdate(), 'jimgaull', getdate()
from #StagingCountry sc
join event_registration er
	on sc.person_id = er.person_id

update sp
set mom_person_id = mom.person_id
from #StagingPerson sp
Join (	select p.person_id, p.first_name, p.last_name
		from event_registration er
		join person p 
			on er.person_id = p.person_id
		join event_registration_tag ert
			on ert.event_registration_id = er.event_registration_id
		join tag t
			on ert.tag_id = t.tag_id
		join tag_type tt
			on t.tag_type_id = tt.tag_type_id
		where t.name = 'Mom') mom
	on sp.Parent1FirstName = mom.first_name
	and sp.Parent1LastName = mom.last_name

update sp
set mom_person_id = mom.person_id
from #StagingPerson sp
Join (	select p.person_id, p.first_name, p.last_name
		from event_registration er
		join person p 
			on er.person_id = p.person_id
		join event_registration_tag ert
			on ert.event_registration_id = er.event_registration_id
		join tag t
			on ert.tag_id = t.tag_id
		join tag_type tt
			on t.tag_type_id = tt.tag_type_id
		where t.name = 'Mom') mom
	on sp.Parent2FirstName = mom.first_name
	and sp.Parent2LastName = mom.last_name

update sp
set dad_person_id = dad.person_id
from #StagingPerson sp
Join (	select p.person_id, p.first_name, p.last_name
		from event_registration er
		join person p 
			on er.person_id = p.person_id
		join event_registration_tag ert
			on ert.event_registration_id = er.event_registration_id
		join tag t
			on ert.tag_id = t.tag_id
		join tag_type tt
			on t.tag_type_id = tt.tag_type_id
		where t.name = 'dad') dad
	on sp.Parent1FirstName = dad.first_name
	and sp.Parent1LastName = dad.last_name

update sp
set dad_person_id = dad.person_id
from #StagingPerson sp
Join (	select p.person_id, p.first_name, p.last_name
		from event_registration er
		join person p 
			on er.person_id = p.person_id
		join event_registration_tag ert
			on ert.event_registration_id = er.event_registration_id
		join tag t
			on ert.tag_id = t.tag_id
		join tag_type tt
			on t.tag_type_id = tt.tag_type_id
		where t.name = 'dad') dad
	on sp.Parent2FirstName = dad.first_name
	and sp.Parent2LastName = dad.last_name

update p
set dad_person_id = sp.dad_person_id,
	mom_person_id = sp.mom_person_id
from person p
join #StagingPerson sp
	on p.person_id = sp.person_id
