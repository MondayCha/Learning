#! /bin/bash
# reference: https://github.com/ysj1173886760/Learning/blob/master/db/homework1/autograde.sh
files=$(ls *.sql)
declare -A scores
scores=(
	["q1_sample.sql"]=0
	["q2_not_the_same_title.sql"]=5
	["q3_longest_running_tv.sql"]=5
	["q4_directors_in_each_decade.sql"]=10
	["q5_german_type_ratings.sql"]=10
	["q6_who_played_a_batman.sql"]=10
	["q7_born_with_prestige.sql"]=15
	["q8_directing_rose.sql"]=15
	["q9_ode_to_death.sql"]=15
	["q10_all_played_by_leo.sql"]=15
)
res=0
for i in $files; do
	if ! [ -s $i ]; then
		echo "skip undo $i"
		continue
	fi

	if [ -f "$i" ]; then
		first_line=$(head -n 1 "$i")
		# check if the first line starts with '--passed--'
		if [[ "$first_line" == "--passed--"* ]]; then
			# print the file name
			echo "skip passed $i"
			((res = $res + ${scores[$i]}))
			continue
		fi
	fi

	echo "************************"
	echo "testing $i"
	SECONDS=0
	diff <(echo ".read solution/$i" | sqlite3 imdb-cmudb2022.db) <(echo ".read $i" | sqlite3 imdb-cmudb2022.db)
	return_val=$?

	echo "elapsed time $SECONDS"
	if [ $return_val -eq 0 ]; then
		echo "$i passed!"
		sed -i '1i --passed--' $i
		((res = $res + ${scores[$i]}))
	else
		echo "$i failed"
	fi
done

echo "************************"
echo "final score $res"
