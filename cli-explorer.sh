prevdir=""
Rec () {
	i=0
	echo $1
	cd "$1"
	# pwd
	for j in *
	do
		echo "[$i] $j"
		# echo `expr match "$j" '\(/[a-zA-Z0-9]]*\)'`
		i=`expr $i + 1`
	done
	i=0
	read -p "> " num

	if [[ $num == ".." ]]
	then
		clear
		cd ..
		prevdir=`pwd`
		# echo $prevdir p
		Rec $prevdir
	else

		for j in *
		do
			if [[ $i == $num ]]
			then
				clear
				# j=\'$j\'
				# echo $j p
				# echo $1/$j
				# sh hello.sh $1/$j\/
				# prevdir=$1
				if [[ -f $1/$j ]]; then
					read -p ">> " num
					`$num "$1/$j"`
					Rec "$1"
				else
					Rec "$1/$j"
				fi
				break
			fi
			i=`expr $i + 1`
		done	
	fi
}

Rec /d

read