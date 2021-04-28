# Databases Project

# Name of the project

I suppose I will call this NEU Co-op Drug Testing Database.

# Name of the team(s). At most two teams per project. One from each section, if applicable

My team/group is Database Deisgn 51 on Canvas. It is just me.

# Team members and the section they belong to. At most 4 team members per project

Just me: Kyle Smith Section 04

# Brief description of the project

My project is designed to help Northeastern Students share information on whether or not different co-op employers drug test as part of an employment screening. Students can share or view entries of this information that are assigned to a specific company, which can also be created. 

You can see an alternative version of this idea I completed for my WebDev class: http://blazeneu.com/ (although I wrote all independent code for this project.)

To implement this, I used a Postgres database, and elixir through the Phoenix framework to handle all the interaction. All the front end is written in an HTML/elixir integration.

I have deployed to http://dbproject.devcalibur.com.

# Link to the latest data model as a single UML class diagram. The UML class diagram should be a single PDF document called db_design_final_project_UML.pdf and linked from the README

https://drive.google.com/file/d/1BPtcaAqZNc93JiVsUrSCFkMngvMMDneV/view?usp=sharing

# Description of user data model

My user table has the following columns:

firstName: String
lastName: String
username: String
password: String
email: String
dateOfBirth: Date


# Description of the two domain object data models

I have Companies:

name: String
location: String

As well as Entries:

drugTesting: boolean
continuousDrugTesting: boolean, default: false, null: false
additionalNotes: text
foreign key user_id
foreign key company_id
foreign key coopterm_id

# Description of the user to domain object relationship

Users and Entries have a One to Many relationship.

# Description of the domain object to domain object relationship

Companies and Entries have a One to Many relationship.

# Description of the portable enumeration(s)

For the portable enumberation, I have created a table 'coopterms' which defines the Co-op term for an entry. There are two options: "spring" and "fall"

# Description of the user interface requirements

All the UI requirements are implemented. 

I have deployed to http://dbproject.devcalibur.com.

The index page directs to pages of the three tables, whereby you can view, edit, or delete from the tables. Selection of a specific element is done by inputting the ID into the URL. (i.e. /users/1 to view the user with ID 1).

