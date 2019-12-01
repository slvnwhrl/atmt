#!/bin/bash
for i in 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1; do
	 python translate_beam.py --data "data_asg4/prepared_data" --checkpoint-path "checkpoints_asg4/checkpoint_best.pt" --beam-size 7 --alpha_ln $i --output "results_length_normalization/model_translations_ln$i.txt";
	bash postprocess_asg4.sh results_length_normalization/model_translations_ln$i.txt results_length_normalization/model_translations_ln$i.out en;
	echo "ln = $i" >> results_length_normalization/BLEU_length_normalizations.txt;
	cat results_length_normalization/model_translations_ln$i.txt | sacrebleu data_asg4/raw_data/test.en >> results_length_normalization/BLEU_length_normalizations.txt;
	echo -e "\n" >> results_length_normalization/BLEU_length_normalizations.txt;
done