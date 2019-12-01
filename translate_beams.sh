#!/bin/bash
for i in {1..25}; do
	 python translate_beam.py --data "data_asg4/prepared_data" --checkpoint-path "checkpoints_asg4/checkpoint_best.pt" --beam-size $i --output "results_beam_search/model_translations_k$i.txt";
	bash postprocess_asg4.sh results_beam_search/model_translations_k$i.txt results_beam_search/model_translations_k$i.out en;
	echo "k = $i" >> results_beam_search/BLEU_beams.txt;
	cat results_beam_search/model_translations_k$i.txt | sacrebleu data_asg4/raw_data/test.en >> results_beam_search/BLEU_beams.txt;
	echo -e "\n" >> results_beam_search/BLEU_beams.txt;
done