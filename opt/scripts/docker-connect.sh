#!/bin/bash
#Purpose: manage docker variables for connecting to docker machines
#need to be able to parse docker command output to determine which host ports are currently in use
#need to be able to parse existing similarly named docker images and return a new one
#need to be able to determine machine names from docker images


#port numbers can be formed with
#prefix + machine_num + base
#10 + 2 + 22
#10222
#docker machine numbers should be global -- not unique for each image



#doc dev
#findpaths wintermute dev
#ssh aurora exec docker-connect.sh dev
#determine in dev is running, if so ssh to it, else
#  call docker-run

#python code, so I don't have to keep track of a seperate python file, write string manip in bash (or perl), or call ssh from python
img=$(docker images)
ps=$(docker ps -a)

echo images: $img
echo ps: $ps


#get all docker image names
imageNames=$(python -c "print 'hello'")
#get active machines
actMach=
$(python -c "print '$(docker ps)'")
#get all used machine numbers
machNums=
#get base ports needed by machine
ports=

#if the machine exists connect to it, otherwise start it
echo $actMach
