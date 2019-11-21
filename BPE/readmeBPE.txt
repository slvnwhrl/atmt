### Step 1 ###
Learn and apply BPE to data in baseline/preprocessed_data.
Apply preprocessing-script to this newly created data (stored in BPE/preprocessed_data).
—> Command: bash BPE_add_preprocessing.sh

### Step 2 ###
Run training on data in BPE/prepared_data.
—> Command: python train.py --data BPE/prepared_data --save-dir BPE/checkpoints

### Step 3 ###
Translate.
—> Command: python translate.py --data BPE/prepared_data --checkpoint-path BPE/checkpoints/checkpoint_best.pt --output BPE/model_BPE_translations_seg.txt

### Step 3 ###
Restore segmentation.
—> Command on translation-textfile: sed -E 's/(@@ )|(@@ ?$)//g' BPE/model_BPE_translations_seg.txt > BPE/model_BPE_translations.txt

### Step 4 ###
Postprocess translations.
—> Command: bash postprocess.sh BPE/model_BPE_translations.txt BPE/model_BPE_translations.out en

### Step 5 ###
Calculate BLEU score.
—> Command: cat BPE/model_BPE_translations.out | sacrebleu baseline/raw_data/test.en

Note: Results for different setups are stored in seperate folders after this procedure.

Link word segmentation: https://github.com/rsennrich/subword-nmt
