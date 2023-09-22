# *
# * @file makefile
# * @author Jesse Warren
# * @date 2023-09-21
# * @brief The makefile.
# * 
# * Links all files together to be run under one executable, and lists all errors via the command 'make'.
# *

CC = g++ #Complies the files.
CFLAGS = -g -Wall #Complies withh all errors and warnings.
TARGET = employee #The command to execute the code '/employee'

all: $(TARGET)

#Includes every '.o' definition onto the executable.
$(TARGET): Employee.o Officer.o Supervisor.o main.o 
	$(CC) $(CFlags) -o $(TARGET) Employee.o Officer.o Supervisor.o main.o

#Links both Employee.cpp and .h into Employee.o
Employee.o: Employee.cpp Employee.h
	$(CC) $(CFLAGS) -c Employee.cpp

#Links both Officer.cpp and .h into Officer.o.
Officer.o: Officer.cpp Officer.h 
	$(CC) $(CFLAGS) -c Officer.cpp

#Links both Supervisor.cpp and .h into Supervisor.o.
Supervisor.o: Supervisor.cpp Supervisor.h
	$(CC) $(CLFAGS) -c Supervisor.cpp

#Links the main file with every class files.
main.o:	main.cpp Employee.h Officer.h Supervisor.h
	$(CC) $(CFLAGS) -c main.cpp

#Cleans out the unneeded ~ and .o files.
clean:
	$(RM) $(TARGET) *.o *~ 
