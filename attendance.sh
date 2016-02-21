#!/bin/bash

#Modify according to ur needs
#Append ur name at end to obtain attendance of many students {grep -i "Name\|DOYLE FERMI"}
#Remove grep to obain html
#Requires w3m installed (from apt or aur)
curl --silent --data "class=C6A&submit=View+" http://www-mec.mec.ac.in/attn/view4stud.php | w3m -dump -T text/html | grep -i "Name\|DOYLE FERMI"
