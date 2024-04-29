# Build a Student Database: Part 1

## 0001  

The first thing you need to do is start the terminal. Do that by clicking the `"hamburger"` menu at the top left of the screen, going to the `"terminal"` section, and clicking `"new terminal"`. Once you open a new one, type `echo hello SQL` into the terminal and press enter.

```sh
echo hello SQL
```

## 0002  

You are started with two `.csv` files with info about your computer science students. You should take a look at them. The top row in each file has titles, and the rest are values for those titles. You will be adding all that info to a `PostgreSQL database`. Log into the psql interactive terminal with `psql --username=freecodecamp --dbname=postgres` to get started.

```sh
psql --username=freecodecamp --dbname=postgres
```

## 0003  

View the existing databases with the \l shortcut command to see what's here.  

```sh
\l
```

## 0004  

All the info from the CSV files will go into a single database. Create a new database named `students`.

```sh
CREATE DATABASE students;
```

## 0005  

View the databases again to make sure it got created.  

```sh
\l
```

## 0006  

There it is. Connect to your new database so you can start adding tables.

```sh
\c students
```

## 0007  

The CSV files have a bunch of students with info about them, and some courses and majors. You will have four tables. One for the students and their info, one for each major, another for each course, and a final one for showing what courses are included in each major. First, create the `students` table.

```sh
CREATE TABLE students();
```

## 0008  

The second table will be for each unique major that appears in the data. Create a table named `majors`.

```sh
CREATE TABLE majors();
```

## 0009  

The third table is for each unique course in the data. Create another table named `courses`.

```sh
CREATE TABLE courses();
```

## 0010  

The final table will be a junction table for the majors and courses. Create it with the name majors_courses.

```sh
CREATE TABLE majors_courses();
```

## 0011  

Use the display shortcut command to view your tables to make sure your satisfied with them.

```sh
\d
```

## 0012  

Onto the columns. The `students.csv` file has four fields, you will make a column for each of those as well as an ID column. Add a column to your `students` table named `student_id`. Give it a type of `SERIAL` so it automatically increments and make it a `PRIMARY KEY`

```sh
ALTER TABLE students ADD COLUMN student_id SERIAL PRIMARY KEY;
```

## 0013  

The first column in `students.csv` is `first_name`. Add a column to the students table with that name. Make it a type of `VARCHAR(50)` and give it the `NOT NULL` constraint.

```sh
ALTER TABLE students ADD COLUMN first_name VARCHAR(50) NOT NULL;

```

## 0014  

The next column in the data is `last_name`. Add it to the `students` table. Give it the same data type and max-length as first_name and make sure it has the `NOT NULL` constraint.

```sh
ALTER TABLE students ADD COLUMN last_name VARCHAR(50) NOT NULL;
```

## 0015  

The next column is for the major. Since you will have each major in another table this column will be a foreign key that references it. Create a column in the students table named `major_id`, give it a data type of `INT` for now. You will come back and set the foreign key later.

```sh
ALTER TABLE students ADD COLUMN major_id INT;
```

## 0016  

Create the last column, gpa. The data in the CSV shows that they are decimals with a length of 2 and 1 number is to the right of the decimal. So give it a data type of NUMERIC(2,1).

```sh
ALTER TABLE students ADD COLUMN gpa NUMERIC(2,1);
```

## 0017  

Use the shortcut command to display the details of the students table to make sure you like it.

```sh
\d students;
```

## 0018  

The foreign key is still missing. Let's fill in the majors table next. Add a `major_id` column to it. Make it a type of `SERIAL` and the `PRIMARY KEY` for this table.

```sh
ALTER TABLE majors ADD COLUMN major_id SERIAL PRIMARY KEY;
```

## 0019  

This table will only have one other column for the name of the major. Add a column to it named major. Make it a VARCHAR with a max-length of 50 and give it the NOT NULL constraint.  

```sh
ALTER TABLE majors ADD COLUMN major VARCHAR(50) NOT NULL;
```

## 0020  

View the details of the majors table to make sure you like it.

```sh
\d majors
```

## 0021  

This table looks good. Now, set the `major_id` column from the `students` table as a foreign key that references the `major_id` column from the `majors` table. Here's an example of how to do that: ALTER TABLE <table_name> ADD FOREIGN KEY(<column_name>) REFERENCES <referenced_table_name>(<referenced_column_name>);

```sh
ALTER TABLE students ADD FOREIGN KEY(major_id) REFERENCES majors(major_id);
```

## 0022  

View the details of the students table again to make sure the key is there.

```sh
\d students
```

## 0023  

Next, is the courses table. Add a course_id column to it. Give it a type of SERIAL and make it the primary key.

```sh
ALTER TABLE courses ADD COLUMN course_id SERIAL PRIMARY KEY;
```

## 0024  

Add a course column to the courses table that's a type of VARCHAR. The course names are a little longer, so give them a max-length of 100. Also, make sure it can't accept null values.

```sh
ALTER TABLE courses ADD COLUMN course VARCHAR(100) NOT NULL;
```

## 0025  

View the details of the courses table to make sure it looks good.

```sh
\d courses
```

## 0026  

One more table to go. The `majors_courses` junction table will have two columns, each referencing the primary key from two related table. First, add a `major_id` column to it. Just give it a type of `INT` for now.

```sh
ALTER TABLE majors_courses ADD COLUMN major_id INT;
```

## 0027  

Set the major_id column you just created as a foreign key that references the major_id column from the majors table.

```sh
ALTER TABLE majors_courses ADD FOREIGN KEY(major_id) REFERENCES majors(major_id);
```

## 0028  

Next, add a course_id column to the same table. Just give it a type of INT again for now.

```sh
ALTER TABLE majors_courses ADD COLUMN course_id INT;
```

## 0029  

Set your new course_id column as a foreign key that references the other course_id column.

```sh
ALTER TABLE majors_courses ADD FOREIGN KEY(course_id) REFERENCES courses(course_id);
```

## 0030  

View the details of the table you just worked on to make sure the structure is finished.

```sh
\d majors_courses
```

## 0031  

There's one thing missing. This table doesn't have a primary key. The data from courses.csv will go in this table. A single major will be in it multiple times, and same with a course. So neither of them can be a primary key. But there will never be a row with the same two values as another row. So the two columns together, are unique. You can create a composite primary key that uses more than one column as a unique pair like this: ALTER TABLE <table_name> ADD PRIMARY KEY(<column_name>, <column_name>); Add a composite primary key to the table using the two columns.

```sh
ALTER TABLE majors_courses ADD PRIMARY KEY(major_id, course_id);
```

## 0032  

View the details of the table again.

```sh
\d courses
```

## 0033  

Okay, now it's finished. View all the tables you ended up with.

```sh
\d
```

## 0034  

Next, you can start adding some info. Since the students table needs a major_id, you can add a major first. View the details of the majors table to see what info it expects.

```sh
\d majors
```

## 0035  

It only needs the name of a major. The ID will be added automatically. Add the first major from the courses.csv file into the majors table. It's a VARCHAR, so make sure to put the value in single quotes.

```sh
INSERT INTO majors(major) VALUES('Database Administration');
```

## 0036  

Use SELECT to view all the data in the majors table to make sure it got inserted correctly.

```sh
SELECT * FROM majors;
```

## 0037  

Next, insert the first course from courses.csv into the courses table.  

```sh
INSERT INTO courses(course) VALUES('Data Structures and Algoriths');
```

## 0038  

View all the data in the courses table to make sure it got added.  

```sh
SELECT * FROM courses;
```

## 0039  

Next, you can add a row into the junction table. View the details of it to see what it expects.

```sh
\d majors_courses
```

## 0040  

It wants a major_id and course_id. Add a row to majors_courses for the first entry in courses.csv.  

```sh
INSERT INTO majors_courses(major_id, course_id) VALUES(1, 1);
```

## 0041  

View all the data in the table you just added to.  

```sh
SELECT * FROM majors_courses;
```

## 0042  

Looks like the row got added. View the details of the students table to remind yourself what it expects so you can add the first student to the database.

```sh
\d students
```

## 0043  

The output shows what the table needs. Insert the first person from students.csv into the students table.

```sh
INSERT INTO students(first_name, last_name, major_id, gpa) VALUES('Rhea', 'Kellems', 1, 2.5);
```

## 0044  

Looks like it worked. View all the data in the students table to make sure.  

```sh
SELECT * FROM students;
```

## 0045  

Okay, you added a row into each table. It might be wise to review the data and the database structure. Adding the rest of the info one at a time would be tedious. You are going to make a script to do it for you. I recommend "splitting" the terminal for this part. You can do that by clicking the "hamburger" menu at the top left of the window, going to the "Terminal" menu, and clicking "Split Terminal". Once you've done that, use the touch command to create a file named insert_data.sh in your project folder.

```sh
touch insert_data.sh
```

## 0046  

You should have two terminals open. One connected to PostgreSQL, and one for entering terminal commands. In the one for terminal commands, use the chmod command with the +x flag to give you new script executable permissions.

```sh
chmod +x insert_data.sh
```

## 0047  

Open your new file and add a "shebang" that uses bash at the top. It looks like this: #!/bin/bash.

```sh
#!/bin/bash
```

## 0048  

Below that, add a single line comment with the text, Script to insert data from courses.csv and students.csv into students database.

```sh
# Script to insert data from courses.csv and students.csv into students database
```

## 0049  

First, you should add all the info from the courses.csv file since you need the major_id for inserting the student info. cat is a terminal command for printing the contents of a file. Here's an example: cat <filename>. Below the comment you added, use it to print courses.csv.

```sh
#!/bin/bash
# Script to insert data from courses.csv and students.csv into students database
cat courses.csv
```

## 0050  

Run your script to see if the file contents get printed.

```sh
./insert_data.sh
```

## 0051  

It worked. Instead of printing the content, you can pipe that output into a while loop so you can go through the rows one at a time. It looks like this:

```bash
cat courses.csv | while read MAJOR COURSE
do
  <STATEMENTS>
done

```  

Each new line will be read into the variables, MAJOR and COURSE. Add the above to your cat command. In the STATEMENTS area, use echo to print the MAJOR variable.

```sh
cat courses.csv | while read MAJOR COURSE
do
  echo $MAJOR
done
```

## 0052  

Run the script to see if it worked.

```sh
./insert_data.sh
```

## 0053  

It's looping, but the MAJOR variable is only being set to the first word. There's a default IFS variable in bash. IFS stands for `"Internal Field Separator"`. View it with declare -p IFS.

```sh
declare -p IFS
```

## 0054  

This variable is used to determine word boundaries. It defaults to spaces, tabs, and new lines. This is why the `MAJOR` variable was set to only the first word on each line from the data. Between the `while` and `read` commands, set the IFS to a comma like this: `IFS=","`

```sh
#!/bin/bash
# Script to insert data from courses.csv and students.csv into students database
cat courses.csv | while IFS="," read MAJOR COURSE
do
  echo $MAJOR
done
```

## 0055  

Now, it should use the comma in the data to separate words instead of spaces. Run the script again to see if it's working.

```sh
./insert_data.sh
```

## 0056  

Looks like that worked. It prints the whole major, including the space. Print the COURSE variable on the same line as where you print MAJOR to make sure it's all working.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

cat courses.csv | while IFS="," read MAJOR COURSE
do
  echo $MAJOR $COURSE
done

```

## 0057  

Run the script again to check.

```sh
./insert_data.sh
```

## 0058  

Okay, your loop is working. You can use the MAJOR and COURSE variables to access the major or course when you need to insert data or query the database. Delete the echo line so you can figure out what to do next.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

cat courses.csv | while IFS="," read MAJOR COURSE
do
  
done

```

## 0059  

It helps to plan out what you want to happen. For each loop, you will want to add the major to the database if it isn't in there yet. Same for the course. Then add a row to the majors_courses table. Add these single line comments in your loop in this order: `get major_id`, `if not found`, `insert major`, `get new major_id`, `get course_id`, `if not found`, `insert course`, `get new course_id`, `insert into majors_courses`.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

cat courses.csv | while IFS="," read MAJOR COURSE
do
  # get major_id

  # if not found
  
  # insert major

  # get new major_id
  
  # get course_id

  # if not found
  
  #  insert course

  # get new course_id

  # insert into majors_courses

done
```

## 0060  

You used the psql command to log in and interact with the database. You can use it to just run a single command and exit. Above your loop, add a PSQL variable that looks like this: PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c". This will allow you to query your database from your script. The important parts are the username, dbname, and the -c flag that is for running a single command and exiting. The rest of the flags are for formatting.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database
PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
cat courses.csv | while IFS="," read MAJOR COURSE
do
  # get major_id

  # if not found
  
  # insert major

  # get new major_id
  
  # get course_id

  # if not found
  
  #  insert course

  # get new course_id

  # insert into majors_courses

done
```

## 0061  

Now, you can query your database using the PSQL variable like this: $($PSQL "<query_here>"). The code in the parenthesis will run in a subshell, which is a separate bash process. Below the get major_id comment in your loop, create a MAJOR_ID variable. Set it equal to the result of a query that gets the major_id of the current MAJOR in the loop. Make sure to put your MAJOR variable in single quotes.

```sh
MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
```

## 0062  

Below the variable you just created, use echo to print it so you can see it's value when you run the script.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database
PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
cat courses.csv | while IFS="," read MAJOR COURSE
do
  # get major_id
  MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
  echo $MAJOR_ID
  # if not found
  
  # insert major

  # get new major_id
  
  # get course_id

  # if not found
  
  #  insert course

  # get new course_id

  # insert into majors_courses

done
```

## 0063  

Run the script to see what happens.

```sh
./insert_data.sh
```

## 0064

So it went through each major from the CSV file and tried to find major_id for each one from the database. Looks like it only found the one you manually inserted earlier. The rest were empty. Below your first if not found comment, add an if condition that checks if the MAJOR_ID variable is empty. You can do that with this test: [[ -z $MAJOR_ID ]]. Place the next two comments in the statements area of the if.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database
PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
cat courses.csv | while IFS="," read MAJOR COURSE
do
  # get major_id
  MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
  echo $MAJOR_ID
  # if not found
  if [[ -z $MAJOR_ID ]]
  then
    # insert major

    # get new major_id
  
  fi
  # get course_id

  # if not found
  
  #  insert course

  # get new course_id

  # insert into majors_courses

done
```

## 0065  

The loop will go into this if whenever a major isn't found. Here, you will want to insert the major and then get the new id. You will need the ID for inserting data into the majors_courses table later. Below your insert major comment, create an INSERT_MAJOR_RESULT variable. Set it's value to a query that inserts the current major into the database. Don't forget to use single quotes around the value.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

cat courses.csv | while IFS="," read MAJOR COURSE
do
  # get major_id
  MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
  echo $MAJOR_ID

  # if not found
  if [[ -z $MAJOR_ID ]]
  then
    # insert major
    INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) values('$MAJOR')");
    # get new major_id

  fi

  # get course_id

  # if not found

  # insert course

  # get new course_id

  # insert into majors_courses

done

```

## 0066  

Below the variable you just created, use echo to print it.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

cat courses.csv | while IFS="," read MAJOR COURSE
do
  # get major_id
  MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
  echo $MAJOR_ID

  # if not found
  if [[ -z $MAJOR_ID ]]
  then
    # insert major
    INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) values('$MAJOR')");
    echo $INSERT_MAJOR_RESULT
    # get new major_id

  fi

  # get course_id

  # if not found

  # insert course

  # get new course_id

  # insert into majors_courses

done

```

## 0067  

Instead of running through all the data in the CSV file, you should make some test data. In the terminal, use the copy (cp) command to copy the courses.csv into a new file named courses_test.csv.

```sh
cp courses.csv courses_test.csv
```

## 0068  

In your new file, remove all the data except for the first five lines. Make sure there's a single empty line at the bottom.

```csv
major,course
Database Administration,Data Structures and Algorithms
Web Development,Web Programming
Database Administration,Database Systems
Data Science,Data Structures and Algorithms

```

## 0069  

Back in the insert_data.sh script, change your cat command to loop through the test file instead of the full one.

```bash
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  # get major_id
  MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
  echo $MAJOR_ID

  # if not found
  if [[ -z $MAJOR_ID ]]
  then
    # insert major
    INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) values('$MAJOR')");
    echo $INSERT_MAJOR_RESULT
    # get new major_id

  fi

  # get course_id

  # if not found

  # insert course

  # get new course_id

  # insert into majors_courses

done

```

## 0070  

Run the script. It will go through the test data and insert a major into the database each time it doesn't find one already there and print the MAJOR_ID and INSERT_MAJOR_RESULT variables.

```sh
./insert_data.sh
```

## 0071  

Looks like it found an ID that was already in the database twice and inserted three new items into the database. You don't need to print the ID anymore so delete the echo $MAJOR_ID line.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  # get major_id
  MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

  # if not found
  if [[ -z $MAJOR_ID ]]
  then
    # insert major
    INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) values('$MAJOR')");
    echo $INSERT_MAJOR_RESULT
    # get new major_id

  fi

  # get course_id

  # if not found

  # insert course

  # get new course_id

  # insert into majors_courses

done

```

## 0072  

In the psql prompt, use SELECT to view all the data from the majors table to see what the script added.

```sh
SELECT * FROM majors;
```

## 0073  

I forgot you inserted Database Administration earlier. The script ran and inserted major from the top line of the file. Then it added the other two that weren't already in there. You can use TRUNCATE to delete all data from a table. In the psql prompt, try to delete all the data in the majors table by entering TRUNCATE majors;

```sh
TRUNCATE majors;
```

## 0074

```sh
TRUNCATE majors, studnets, majors_courses;
```

## 0075  

View all the data in the majors table to make sure it's empty.

```sh
SELECT * FROM majors;
```

## 0076  


Looks like it worked. View all the data in the majors_courses table to see if that one is empty.

```sh
SELECT * FROM majors_courses;
```

## 0077  

It is, check the students table.

```sh
SELECT * FROM studnets;
```

## 0078  

Last, check the courses table.

```sh
SELECT * FROM courses;
```

## 0079  

There should still be one entry in there. Use TRUNCATE to delete all the data from the courses table. You will need to truncate any tables that use a column from it as a foreign key at the same time.

```sh
TRUNCATE courses, majors_courses;
```

## 0080  

View all the data in the courses table again.

```sh
SELECT * FROM courses;
```

## 0081  

Now the database is completely empty. Run the script again to see what gets inserted when the database is empty.

```sh
./insert_data.sh
```

## 0082  

It inserted four that time. In the psql prompt, view all the data in the majors table.

```sh
SELECT * FROM majors;
```

## 0083  

You won't want to add the first line from the CSV file to the database since those are just titles. In your script, add an if condition at the top of your loop that checks if $MAJOR != major. Put all the existing code and comments in your loop in it's statements area so it only does any of it if it's not the first line.

```sh
do
  if [[ $MAJOR != major ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      echo $INSERT_MAJOR_RESULT

      # get new major_id

    fi

    # get course_id

    # if not found

    # insert course

    # get new course_id

    # insert into majors_courses

  fi
done
```

## 0084  

In the psql prompt, use TRUNCATE to delete all the data in the majors table.

```sh
TRUNCATE majors, studnets, majors_courses;
```

## 0085  

View all the data in majors table to make sure it's empty.

```sh
SELECT * FROM majors;
```

## 0086  

Run the script to make sure it's not adding the first line anymore.

```sh
./insert_data.sh
```

## 0087  

It only showed three inserts, that's a good sign. View all the data in majors table to make sure it's three you want.

```sh
SELECT * FROM majors;
```

## 0088

There's three unique majors in your test data. Those were the three added to the database, so it looks like it's working. Delete the line where you print INSERT_MAJOR_RESULT.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != major ]]
  then
  # get major_id
  MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

  # if not found
  if [[ -z $MAJOR_ID ]]
  then
    # insert major
    INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")

    # get new major_id

  fi

  # get course_id

  # if not found

  # insert course

  # get new course_id

  # insert into majors_courses

  fi
done

```

## 0089

You want a nicer message when something get's inserted so it's more informative. Below your INSERT_MAJOR_RESULT variable, add an if statement that checks if the variable is equal to INSERT 0 1, which was what it was printing. Use echo to print Inserted into majors, $MAJOR in the statements area of the if.

```bash
if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
then
  echo "Inserted into majors, $MAJOR"
fi
```

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != major ]]
  then
  # get major_id
  MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

  # if not found
  if [[ -z $MAJOR_ID ]]
  then
    # insert major
    INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
      echo "Inserted into majors, $MAJOR"
      fi
    # get new major_id

  fi

  # get course_id

  # if not found

  # insert course

  # get new course_id

  # insert into majors_courses

  fi
done

```

## 0090  

In the psql prompt, truncate the majors table again so you can run the script and see the output.

```sh
TRUNCATE majors, students, majors_courses;
```

## 0091  

Check to make sure the table is empty. Then, run the script.

```sh
SELECT * FROM majors;
```

```sh
./insert_data.sh
```

## 0092  

It's starting to come together. Below your get new major_id comment, set the MAJOR_ID variable to a query that gets the new major_id from the database.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != major ]]
  then
  # get major_id
  MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

  # if not found
  if [[ -z $MAJOR_ID ]]
  then
    # insert major
    INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
      echo "Inserted into majors, $MAJOR"
      fi
    # get new major_id
    MAJOR_ID=$($PSQL "SELECT major_id from majors WHERE '$MAJOR';")

  fi

  # get course_id

  # if not found

  # insert course

  # get new course_id

  # insert into majors_courses

  fi
done

```

## 0093  

So the script will insert the majors correctly. Next are the courses. It will be the same steps as for the majors. Below your get course_id comment, add a COURSE_ID variable that gets the course_id from the database. Remember that your COURSE variable will have the current course in the loop.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != major ]]
  then
  # get major_id
  MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

  # if not found
  if [[ -z $MAJOR_ID ]]
  then
    # insert major
    INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
      echo "Inserted into majors, $MAJOR"
      fi
    # get new major_id
    MAJOR_ID=$($PSQL "SELECT major_id from majors WHERE '$MAJOR';")

  fi

  # get course_id
  COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

  # if not found

  # insert course

  # get new course_id

  # insert into majors_courses

  fi
done

```

## 0094

It's the same as the majors, so below the second if not found comment, add an if statement that checks if the query was empty so you can insert the course if needed. Place the existing insert course and get new course_id comments in the statements area of the if.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID  ]]
      then
    
      # insert course

      # get new course_id
    fi
    # insert into majors_courses

  fi
done

```

## 0095  

Below the insert course comment, create an INSERT_COURSE_RESULT variable that inserts the course into the database.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID  ]]
      then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE');")
      # get new course_id
    fi
    # insert into majors_courses

  fi
done

```

## 0096  

The variable should be INSERT 0 1 again if something gets inserted. Below the variable you just created, add an if condition that checks if it is and print Inserted into courses, $COURSE using echo in it's statements area.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID  ]]
      then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE');")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
        then
        echo Inserted into courses, $COURSE
      fi
      # get new course_id
    fi
    # insert into majors_courses

  fi
done

```

## 0097  

In the psql prompt, truncate the data from the majors table so you can run the script again.

```sh
TRUNCATE majors, students, majors_courses;
```

## 0098

Run the script to see if the courses get inserted into the database.  

```sh
./insert_data.sh
```

## 0099  

It looks like it worked. The test data has three unique courses, and three got added to the database. View the data in the courses table to make sure they are correct.

```sh
SELECT * FROM courses;
```

## 0100

Excellent. Instead of manually deleting the data each time you want to run the script, add the command to do it for you. Near the top of the file below your PSQL variable, use echo to query the database. In the query, truncate your four tables in this order: students, majors, courses, majors_courses.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")
cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID  ]]
      then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE');")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
        then
        echo Inserted into courses, $COURSE
      fi
      # get new course_id
    fi
    # insert into majors_courses

  fi
done

```

## 0101

Run the script to see if it works.

```sh
./insert_data.sh
```

## 0102

Awesome. That makes it easier. Below your get new course_id comment, set the COURSE_ID to the newly inserted course_id.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")
cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID  ]]
      then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE');")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
        then
        echo Inserted into courses, $COURSE
      fi
      # get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi
    # insert into majors_courses

  fi
done
```

## 0103

One more thing to add for this file. Below the insert into majors_courses courses comment, create a INSERT_MAJORS_COURSES_RESULT variable. Use it and the MAJOR_ID and COURSE_ID variables you created to insert a row into the majors_courses table. Make sure the query has the major_id column first. Also, you won't need any quotes around the values for the ID's.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")
cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID  ]]
      then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE');")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
        then
        echo Inserted into courses, $COURSE
      fi
      # get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi
    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
  fi
done

```

## 0104

Below the variable you just created, add an if condition that checks if it's equal to INSERT 0 1 like the others. In it's statements area, use echo to print Inserted into majors_courses, $MAJOR : $COURSE.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")
cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID  ]]
      then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE');")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
        then
        echo Inserted into courses, $COURSE
      fi
      # get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi
    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
      then
      echo "Inserted into majors_courses, $MAJOR : $COURSE"
    fi
  fi
  
done
```

## 0105  

Run the script. Your tables should get truncated and then it should go through the loop and add all the data from the courses_test.csv into the three tables of the database.

```sh
./insert_data.sh
```

## 0106

Looks like it works. You better look around to make sure. View the data in the majors table.

```sh
SELECT * FROM majors;
```

## 0107

Cool, check the courses table.

```sh
SELECT * FROM courses;
```

## 0108

Lastly, view the data in the majors_courses table. There should be four rows.

```sh
SELECT * FROM majors_courses;
```

## 0109

Alright, that part of the script is done. Next, you need to add everything from the students.csv file. Make some test data again. In the terminal, use the copy command to copy students.csv into a file named students_test.csv.

```sh
cp students.csv students_test.csv
```

## 0110  

In the students_test.csv file, remove everything but the first five lines like you did for the other test file. Make sure there's an empty line at the bottom again.

```csv
first_name,last_name,major,gpa
Rhea,Kellems,Database Administration,2.5
Emma,Gilbert,null,null
Kimberly,Whitley,Web Development,3.8
Jimmy,Felipe,Database Administration,3.7

```

## 0111  

You want to loop through all this info like you did for the other CSV file. The process is the same. Below your existing loop, use cat to print your new test file. Pipe the results into a while loop, setting the IFS to a comma again, and then use read to create FIRST, LAST, MAJOR and GPA variables from the data. In the loop, use echo to print the FIRST variable.

```sh
cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  echo $FIRST
done
```

## 0112  

Run the script to see if it prints the FIRST (first_name) variable correctly. It will take a second since it has to go through the first loop.

```sh
./insert_data.sh
```

## 0113

It works 😅 It printed the first item in each row of the CSV file. It's printing the first line again, you will have to take care of that. First, delete the echo line.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")
cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID  ]]
      then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE');")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
        then
        echo Inserted into courses, $COURSE
      fi
      # get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi
    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
      then
      echo "Inserted into majors_courses, $MAJOR : $COURSE"
    fi
  fi
done

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do

done

```

## 0114

Add an if condition to the loop that checks if the FIRST variable is not equal to first_name so it doesn't do anything for the first line of the file. Don't put anything in the statements area for now.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into courses, $COURSE
      fi

      # get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi

    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into majors_courses, $MAJOR : $COURSE
    fi
  fi
done

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  if [[ $FIRST != "first_name" ]]
    then

  fi
done

```

## 0115

All the columns in the CSV file can be inserted directly into the database except for the major. You will need to get the major_id again for that. There's some null values in there as well, so you will need to use null if the major_id isn't found. Add four single line comments in your loop; get major_id, if not found, set to null, and insert student in that order.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into courses, $COURSE
      fi

      # get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi

    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into majors_courses, $MAJOR : $COURSE
    fi
  fi
done

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  if [[ $FIRST != "first_name" ]]
    then
      # get major_id
  
      # if not found
  
      # set to null
  
      # insert student    
  fi
done

```

## 0116

Below the new get major_id comment, set the MAJOR_ID variable to a query that gets the major_id for the current students major.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into courses, $COURSE
      fi

      # get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi

    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into majors_courses, $MAJOR : $COURSE
    fi
  fi
done

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  if [[ $FIRST != "first_name" ]]
    then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'") 

      # if not found

      # set to null

      # insert student


  fi
done

```

## 0117 

Add an echo to check wheather it is working or not.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into courses, $COURSE
      fi

      # get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi

    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into majors_courses, $MAJOR : $COURSE
    fi
  fi
done

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  if [[ $FIRST != "first_name" ]]
    then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'") 
    echo $MAJOR_ID
      # if not found

      # set to null

      # insert student


  fi
done

```

## 0118

Run the script to see what happens.

```sh
./insert_data.sh
```

## 0119

Looking at the test data, it found the ID for all of it except the null value. Below the newest if not found comment, add an if that checks if the variable is empty. Put the set to null comment in its statements area.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into courses, $COURSE
      fi

      # get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi

    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into majors_courses, $MAJOR : $COURSE
    fi
  fi
done

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  if [[ $FIRST != "first_name" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    echo $MAJOR_ID
    
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
    # set to null
    fi
    # insert student

  fi
done

```

## 0120

When you go to insert the student data, you want to use the MAJOR_ID if it's found, or null if not. Below the set to null comment, set the MAJOR_ID variable to null so you can use it to insert the data.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into courses, $COURSE
      fi

      # get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi

    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into majors_courses, $MAJOR : $COURSE
    fi
  fi
done

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  if [[ $FIRST != "first_name" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    echo $MAJOR_ID
    
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
    # set to null
    MAJOR_ID=null
    fi
    # insert student

  fi
done

```

## 0121

Move the echo $MAJOR_ID line to below the if statement so you can run the script and see the value of the variable if the major_id is or isn't found.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into courses, $COURSE
      fi

      # get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi

    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into majors_courses, $MAJOR : $COURSE
    fi
  fi
done

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  if [[ $FIRST != "first_name" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
    # set to null
    MAJOR_ID=null
    fi
    echo $MAJOR_ID
    # insert student

  fi
done

```

## 0122

Run the script.

```sh
./insert_data.sh
```

## 0123

Okay, that should work for inserting the student. Delete the echo $MAJOR_ID line.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into courses, $COURSE
      fi

      # get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi

    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into majors_courses, $MAJOR : $COURSE
    fi
  fi
done

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  if [[ $FIRST != "first_name" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
    # set to null
    MAJOR_ID=null
    fi
    # insert student

  fi
done

```

## 0124

One last thing to add. In the psql prompt, view the details of the students table so you can see what columns to add.

```sql
\d studnets
```

## 0125

You will need to set the four columns when adding the student info. All of them except student_id. Below the insert student comment, create an INSERT_STUDENT_RESULT variable that adds the student to the database. Add the columns in the order they appear in the data, and make sure to only put the two VARCHAR columns in single quotes.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into courses, $COURSE
      fi

      # get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi

    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into majors_courses, $MAJOR : $COURSE
    fi
  fi
done

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  if [[ $FIRST != "first_name" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
    # set to null
    MAJOR_ID=null
    fi
    # insert student
    INSERT_STUDENT_RESULT=$($PSQL "INSERT INTO students(first_name, last_name, major_id, gpa) VALUES('$FIRST', '$LAST', $MAJOR_ID, $GPA)")
    
  fi
done

```

## 0126

Below the variable you just created, add an if statement that checks if it's equal to INSERT 0 1 like the others. If it is, use echo to print Inserted into students, <first_name> <last_name>.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")

cat courses_test.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into courses, $COURSE
      fi

      # get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi

    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into majors_courses, $MAJOR : $COURSE
    fi
  fi
done

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  if [[ $FIRST != "first_name" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
    # set to null
    MAJOR_ID=null
    fi
    # insert student
    INSERT_STUDENT_RESULT=$($PSQL "INSERT INTO students(first_name, last_name, major_id, gpa) VALUES('$FIRST', '$LAST', $MAJOR_ID, $GPA)")
    if [[ $INSERT_STUDENT_RESULT == "INSERT 0 1" ]]
    then
    echo Inserted into students, $FIRST $LAST
    fi
  fi
done

```

## 0127

Run the script to see if the students are getting added.

```sh
./insert_data.sh
```

## 0128

I think it's working. View all the data in the students table to make sure it matches the CSV file.

```sh
SELECT * FROM students;
```

## 0129

Excellent. It added all the students from the test data. Time to try it with the original files. Change the cat courses_test.csv line to use the original file again.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")

cat courses.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into courses, $COURSE
      fi

      # get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi

    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into majors_courses, $MAJOR : $COURSE
    fi
  fi
done

cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  if [[ $FIRST != "first_name" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
    # set to null
    MAJOR_ID=null
    fi
    # insert student
    INSERT_STUDENT_RESULT=$($PSQL "INSERT INTO students(first_name, last_name, major_id, gpa) VALUES('$FIRST', '$LAST', $MAJOR_ID, $GPA)")
    if [[ $INSERT_STUDENT_RESULT == "INSERT 0 1" ]]
    then
    echo Inserted into students, $FIRST $LAST
    fi
  fi
done

```

## 0130

Next, change the cat students_test.csv line to use the original file as well.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")

cat courses.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into courses, $COURSE
      fi

      # get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi

    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into majors_courses, $MAJOR : $COURSE
    fi
  fi
done

cat students.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  if [[ $FIRST != "first_name" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
    # set to null
    MAJOR_ID=null
    fi
    # insert student
    INSERT_STUDENT_RESULT=$($PSQL "INSERT INTO students(first_name, last_name, major_id, gpa) VALUES('$FIRST', '$LAST', $MAJOR_ID, $GPA)")
    if [[ $INSERT_STUDENT_RESULT == "INSERT 0 1" ]]
    then
    echo Inserted into students, $FIRST $LAST
    fi
  fi
done

```

## 0131

Time for the moment of truth. Run the script and see if it works.

```sh
#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")

cat courses.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into courses, $COURSE
      fi

      # get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi

    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into majors_courses, $MAJOR : $COURSE
    fi
  fi
done

cat students.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  if [[ $FIRST != "first_name" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
    # set to null
    MAJOR_ID=null
    fi
    # insert student
    INSERT_STUDENT_RESULT=$($PSQL "INSERT INTO students(first_name, last_name, major_id, gpa) VALUES('$FIRST', '$LAST', $MAJOR_ID, $GPA)")
    if [[ $INSERT_STUDENT_RESULT == "INSERT 0 1" ]]
    then
    echo Inserted into students, $FIRST $LAST
    fi
  fi
done

```

## 0132

That was cool. View all the data in the students table to see what you ended up with.

```sh
SELECT * FROM students;
```

## 0133

31 rows. That's how many are in the CSV file. Perfect. Next, check the majors table.

```sh
SELECT * FROM majors;
```

## 0134

7 rows. There must be 7 unique majors in the CSV file. View what's in the courses table.

```sh
SELECT * FROM courses;
```

## 0135

Looks like there's 17 unique courses in the CSV file. Last, view the data in majors_courses. This should have the same number of rows at the CSV file.

```sh
SELECT * FROM majors_courses;
```

## 0136

28 rows, same as the CSV file. I think all the data got added correctly. You don't need your test files anymore. In the terminal, use the list command to check what files are in your project folder.

```sh
ls
```

## 0137

Use the remove command (rm) to delete the students_test.csv file.

```sh
rm students_test.csv
```

## 0138

Use the same command to delete the courses_test.csv file.

```sh
rm courses_test.csv
```

## 0139

List the contents of the folder again to make sure they're gone.

```sh
ls
```

## 0140

The database is finished for now. The last thing you are going to do is make a "dump" of it. The pg_dump command can do that for you. Use the --help flag with the command to see what it can do.

```sh
pg_dump --help
```

## 0141

This is the last step. There's quite a few options there. Enter pg_dump --clean --create --inserts --username=freecodecamp students > students.sql in the terminal to dump the database into a students.sql file. It will save all the commands needed to rebuild it. Take a quick look at the file when you are done.

```sh
pg_dump --clean --create --inserts --username=freecodecamp students > students.sql
```  
