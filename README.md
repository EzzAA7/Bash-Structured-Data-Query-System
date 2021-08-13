# Bash-Structured-Data-Query-System
Built shell scripts that do a filtration for structured data. The filtration process includes, selecting some column, remove some rows, count the data, limit the data...etc

1. Load.sh -d delimiter file_name : this command will load the content of the given file
(file_name), and will use the delimiter as the separator between the columns. If the delemetar
is not given in the command, the command will assume that the comma is the default
delimiter(like in CSV files).
Load.sh -d , students.csv will load the content of that file, and it will take the delimitar as a
comma. (Moreover, calling it like this Load.sh students.csv will have the same effect since
by default comma is the delimiter)
Note that you can open csv files using excel, it can give you a more clear view like the
following
After loading the file, you can use the following list of the piped commands to filter your
data.

2. Limit.sh n
This command will give you the first n lines from the loaded data. If n is not given, the
default value will be the first row.
Example: Load.sh -d, students.csv | limit 2. The first two rows of the file to the terminal.

3. Select.sh [list of columns].
The command will cut the selected columns from the file.
Example: load.sh students.csv | select.sh ‘name’ ‘school_name’ This will output the name
and school_name columna from the loaded file to the terminal.

4. Where.sh ‘columnName’ ‘operation’ ‘value’
This will apply a per row filtration to the loaded data.
Example: load.sh students.csv | where ‘age’ ‘>’ ‘19’ | where ‘school’ ‘=’ ‘school1’
This command will get all the students that their age is greater than 19, then it will get
students that are in school1, then to print them to the terminal.
Supported operations are: ‘<’, ‘>’, ‘=’.

5. Order_by.sh columnName [ASC or DESC]
This will order the data based on the given columnName. ASC is sorting by ascending order.
DESC is sorting by descending order. If ASC or DESC are not supplied, the default value as
ASC.
Example: load.sh students.csv | order_by.sh ‘age’

6. Count.sh
This command will print the number of rows to the terminal.
Example: load.sh students.csv | where.sh ‘age’ ‘>’ ‘19’ | count.sh

7. Store.sh -d delimitar fileName
This will store the filtered data to a file, with the given delimiter.
Example: load.sh students.csv | where.sh ‘age’ ‘>’ ‘19’ | order_by.sh ‘school_name’ | select 
‘name’ ‘school_name’ | store.sh -d , filteredData.csv

This will store the filtered data to a file called filteredData.csv with comma as a delimiter.

Notes:
● Can pipe the commands as much as you want.
● The students.csv file is just an example, the code should work with any structured data file.
● All the scripts must print their output to the terminal, except the store.sh script
