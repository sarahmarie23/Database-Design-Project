-- Sarah Jimenez
-- CS 325 - Fall 2021
-- Last modified 11/19/21



-- BSA_Member is the base table for every person involved at the camp

  DROP TABLE BSA_Member;
CREATE TABLE BSA_Member(
    BSA_ID       INTEGER
	member_type  CHAR(10) CHECK(member_type IN('adult', 'scout'))
	first_name   VARCHAR2(15)
	last_name    VARCHAR2(25)
	PRIMARY KEY  (BSA_ID)
);



-- Scout is a type of BSA_Member, any participant under 18 years old 
-- CIT = counselor in training

  DROP TABLE Scout;
CREATE TABLE Scout(
    BSA_ID          INTEGER
	is_CIT          CHAR(1) CHECK(is_CIT IN('T', 'F'))
	birthdate       DATE
	parent_fname    VARCHAR2(15)
	parent_lname    VARCHAR2(25)
	parent_phone    VARCHAR2(10) -- Just the 10 numbers
	swim_test_pass  CHAR(1) CHECK(swim_test_pass IN('T', 'F'))        
	shirt_size      VARCHAR2(2) CHECK(shirt_size IN('XL','S', 'M', 'L', 'XL'))
	PRIMARY KEY     (BSA_ID)
	FOREIGN KEY     (BSA_ID) REFERENCES BSA_Member
);



-- CIT keeps track of all the Scouts who are CITs and have thus
-- earned volunteer hours

  DROP TABLE CIT;
CREATE TABLE CIT(
    BSA_ID             INTEGER
	volunteer_hours    SMALLINT
	PRIMARY KEY        (BSA_ID)
	FOREIGN KEY        (BSA_ID) REFERENCES BSA_Member
);



-- Adult keeps track of all the adult employees at the camp

  DROP TABLE Adult;
CREATE TABLE Adult(
    BSA_ID          INTEGER
	phone           VARCHAR2(10) -- Just the 10 numbers
	email           VARCHAR2(50)
	PRIMARY KEY     (BSA_ID)
	FOREIGN KEY     (BSA_ID) REFERENCES BSA_Member
);



-- Adult_Jobs_List states which adults have which jobs
-- since some adults might have more than one

  DROP TABLE Adult_Jobs_List;
CREATE TABLE Adult_Jobs_List(
    BSA_ID       INTEGER
	job_title    VARCHAR2(20)
	PRIMARY KEY  (BSA_ID, Job_title)
	FOREIGN KEY  (BSA_ID) REFERENCES BSA_Member
);



-- Sessions are denoted by a particular week in a season
-- The camp has winter and spring break camps, but for the 
-- purposes of this project, I am using the summer season

  DROP TABLE Sessions;
CREATE TABLE Sessions(
    session_id    varchar(7)
	start_date    DATE
	end_date      DATE
	PRIMARY KEY (session_id)
);



-- Session_Registration has registrations that are for a single week by a single scout

  DROP TABLE Session_Registration;
CREATE TABLE Session_Registrations(
    session_id       VARCHAR2(7) 
	BSA_ID           INTEGER
	session_format   VARCHAR2(4) CHECK(session_format IN ('AM', 'PM', 'FULL'))
	PRIMARY KEY (session_id, BSA_ID)
	FOREIGN KEY (session_id) REFERENCES Sessions 
	FOREIGN KEY (BSA_ID) REFERENCES BSA_Member
);



-- AM_Registration, allows Scouts to add-on early-drop-off 

  DROP TABLE AM_Registration;
CREATE TABLE AM_Registration(
    session_reg_id       INTEGER
	early_drop_off       CHAR(1) CHECK(early_drop_off IN('T', 'F')) 
	PRIMARY KEY (session_reg_id)
	FOREIGN KEY (session_reg_id) REFERENCES Session_Registration
);



-- PM_Registration, allows Scouts to add-on late-pick-up 

  DROP TABLE PM_Registration;
CREATE TABLE PM_Registration(
    session_reg_id       INTEGER
	late_pick_up         CHAR(1) CHECK(late_pick_up IN('T', 'F')) 
	PRIMARY KEY (session_reg_id)
	FOREIGN KEY (session_reg_id) REFERENCES Session_Registration
);



-- Full_Day_Registration, allows Scouts to add-on early-drop-off 
-- and late-pick-up

  DROP TABLE Full_Day_Registration;
CREATE TABLE Full_Day_Registration_Registration(
    session_reg_id       INTEGER
	early_drop_off       CHAR(1) CHECK(early_drop_off IN('T', 'F')) 
	late_pick_up         CHAR(1) CHECK(late_pick_up IN('T', 'F'))
	PRIMARY KEY (session_reg_id)
	FOREIGN KEY (session_reg_id) REFERENCES Session_Registration
);



-- Schedule_of_Classes lists all the classes and weeks they are offered

  DROP TABLE Schedule_of_Classes;
CREATE TABLE Schedule_of_Classes(
    session_id         VARCHAR2(7)
	course_id          INTEGER
	PRIMARY KEY (session_id, course_id)
	FOREIGN KEY (session_id) REFERENCES Sessions 
	FOREIGN KEY (course_id) REFERENCES Course_Offering
);



-- Course_Registration lists all the classes that Scouts have registered for 
-- in a particular SESSIONS_PER_USER

  DROP TABLE Course_Registration;
CREATE TABLE Course_Registration(
    BSA_ID             INTEGER
	course_id          INTEGER
	date_registered    DATE
	date_completed     DATE
	PRIMARY KEY (BSA_ID, course_id)
	FOREIGN KEY (BSA_ID) REFERENCES CIT
	FOREIGN KEY (course_id) REFERENCES Course_Offering
);



-- Course_Offering is information about a particular course 

  DROP TABLE Course_Offering;
CREATE TABLE Course_Offering(
    course_id       INTEGER
	course_name     VARCHAR2(25) 
	bsa_id          INTEGER
	location        VARCHAR2(15)
	max_capacity    SMALLINT
	badge_name      VARCHAR2(25)
	PRIMARY KEY (course_id)
);



-- Course_Offering_Instructors is a list of all the courses 
-- and the counselors that teach them

  DROP TABLE Course_Offering_Instructors;
CREATE TABLE Course_Offering_Instructors(
    course_id     INTEGER
	BSA_ID        INTEGER
	PRIMARY KEY (course_id, BSA_ID)
	FOREIGN KEY (course_id) REFERENCES Course_Offering
	FOREIGN KEY (BSA_ID) REFERENCES Adult
);



-- Course_Offering_Period is a list of all the courses and 
-- the periods they cover. Some courses need extra time 
-- and cover multiple periods 

  DROP TABLE Course_Offering_Period;
CREATE TABLE Course_Offering_Period(
    course_id     INTEGER
	period        SMALLINT
	PRIMARY KEY (course_id, bsa_id)
	FOREIGN KEY (course_id) REFERENCES Course_Offering
);



-- Merit_Badge lists information about a particular badge
-- Eagle required badges are denoted as badges required to 
-- earn the rank of Eagle Scout  

  DROP TABLE Merit_Badge;
CREATE TABLE Merit_Badge(
    badge_name         VARCHAR2(25)
	swim_test_required CHAR(1) CHECK(swim_test_required IN('T', 'F')) 
	eagle_required     CHAR(1) CHECK(eagle_required IN('T', 'F'))
	PRIMARY KEY (badge_name)
);



-- Merit_Badges_Earned keeps track of all the badges earned
-- by all scouts

  DROP TABLE Merit_Badges_Earned;
CREATE TABLE Merit_Badges_Earned(
    bsa_id         INTEGER
	badge_name     VARCHAR2(25)
	PRIMARY KEY (bsa_id, badge_name)
	FOREIGN KEY (bsa_id) REFERENCES Scout
	FOREIGN KEY (badge_name) REFERENCES Merit_Badge
);


-- 