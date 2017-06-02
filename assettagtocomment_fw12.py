#!/usr/bin/python

# Author: Mauricio Puente Cadena.
# Works on FileWave v12 Python 3
#Reads Filewave client Serial Numbers from a CSV file, and writes the Asset tag to Clients view comments.
#
#CSV Format is:
#SerialNumber,Asset Tag
#Comma delimited and Case sensitive
#CSV Location and name is /usr/local/etc/assettags.csv
#
#Make sure the CSV file doesn't have empty lines or extra lines at the end of the file.

# ====================================================================================


import csv
import psycopg2


#Connecting to the DB
try:
    connection = psycopg2.connect("dbname=mdm user=django")
except:
    print ("I am unable to connect to the database")
    print ("This script must be run on the server where the filewave server is installed")
    print ("Please verify that 'postmaster' processes are running and try again")

mark = connection.cursor()


with open('/usr/local/etc/assettags.csv', 'rt') as f:
    reader = csv.reader(f)
    my_list = list(reader)

print ("\nThis is the list :\n",my_list)


print ("\n\n*************************************************************************************************\n")
print ("This script will add Asset Tag info in the Comment's field on Filewave Admin's Clients view \n")
print ("Remember to have the assettags.csv file saved in /usr/local/etc/assettags.csv \n")
print ("*************************************************************************************************\n\n")


statement = '''update admin.user_clone_group set comment = '%s' where id = (select a.id from admin.user_clone_group a, generic_genericclient b where b.filewave_id = a.id and b.serial_number = '%s')'''


for i,j in my_list:
    print ("Adding comment to device with Serial Number : ",i,"\t Comment will be -->\t",j)
    mark.execute(statement %(j,i))

# Commit the change
connection.commit()

# Close the db connection
connection.close()

