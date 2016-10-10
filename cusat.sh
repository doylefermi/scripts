#!/bin/bash
sem='6' #1%262 , 3 , 4
month='April' #May , November
year='2015'
yr=$((year+1))
type='Regular' #Regular,Supplementary,Improvement
for((i=12140800; i<12140930; i++)); do
	echo "Fetching marks ... "$i
    #content=$(curl --silent --data "result_type=$type&deg_name=B.Tech&regno=$i&statuscheck=failed&ipadress=&semester=$sem&date_time=$yr%252F11%252F16%2B20%253A59%253A47.663%2BGMT%252B0530&month=$month&year=$year" http://exam.cusat.ac.in/erp5/cusat/CUSAT-RESULT/Result_Declaration/display_sup_result)
    content=$(curl --silent --data "statuscheck=failed&regno=$i&deg_name=B.Tech&semester=$sem&month=$month&year=$yr&result_type=Regular&date_time=2016%2F10%2F07+19%3A12%3A18.162+GMT%2B0530&ipadress=" http://exam.cusat.ac.in/erp5/cusat/CUSAT-RESULT/Result_Declaration/display_sup_result)
    echo "$content" >> S6_CS.html
    #w3m -dump -T text/html $i.html
done
