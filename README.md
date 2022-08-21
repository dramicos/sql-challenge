# Employee Database Study

### sql-challenge
Repository for HW9
by: Arnold Schultz

## Introduction

This is a task of transforming of a series of csv files into an SQL database and then investigating the contents.  The data consists of Employee and Department data for a company.

### Part One:  Creating a database structure to use

Here I make use of the online tool [http://www.quickdatabasediagrams.com](http://www.quickdatabasediagrams.com) to make an ERD of tables to use in the database.

### Part Two:  Filling in the data

The next thing is to import the data.  First the export from QuickDB is dropped into PostgreSQL query field.  Then the csv files getting imported into the newly created tables.

### Part Three:  Reviewing the data

Finally, a series of queries are made to check out the integrity of the database and to see what it contains.

----
----

## Bonus:

Import the database into a pandas dataframe and generate a bar plot of average salaries by job title as well as a histogram plot of the most common salary ranges for employees.  Also eliminates any null values.


## Conclusion:

The data looks suspicious especially when there is an employee named Foolsday.  All other names are shared with over a hundred other people and Foolsday is not shared.  Also what real people are named Hercules?