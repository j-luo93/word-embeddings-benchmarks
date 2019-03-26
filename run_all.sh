total=0
for f in $(ls ../veceval/saved_embeddings/raw/ | grep -E '(hrre)|(baseline)'); do
	echo $f
	if [[ ! -f $f.result ]]; then
		if [[ $total -eq 0 ]]; then 
			python scripts/evaluate_on_all.py -f ../veceval/saved_embeddings/raw/$f -o $f.result -p word2vec --method mul 
			total=-1
		else
			python scripts/evaluate_on_all.py -f ../veceval/saved_embeddings/raw/$f -o $f.result -p word2vec --method mul &
		fi	
		total=$((total+1))
	fi
done

	
