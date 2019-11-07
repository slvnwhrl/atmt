subword-nmt learn-joint-bpe-and-vocab --input baseline/preprocessed_data/train.de baseline/preprocessed_data/train.en -s 15000 -o BPE/bpe_codes --write-vocabulary BPE/preprocessed_data/dict.de BPE/preprocessed_data/dict.en

subword-nmt apply-bpe -c BPE/bpe_codes --vocabulary BPE/preprocessed_data/dict.de --vocabulary-threshold 3 < baseline/preprocessed_data/train.de > BPE/preprocessed_data/train.de

subword-nmt apply-bpe -c BPE/bpe_codes --vocabulary BPE/preprocessed_data/dict.en --vocabulary-threshold 3 < baseline/preprocessed_data/train.en > BPE/preprocessed_data/train.en

subword-nmt apply-bpe -c BPE/bpe_codes --vocabulary BPE/preprocessed_data/dict.de --vocabulary-threshold 3 < baseline/preprocessed_data/test.de > BPE/preprocessed_data/test.de

subword-nmt apply-bpe -c BPE/bpe_codes --vocabulary BPE/preprocessed_data/dict.en --vocabulary-threshold 3 < baseline/preprocessed_data/test.en > BPE/preprocessed_data/test.en

subword-nmt apply-bpe -c BPE/bpe_codes --vocabulary BPE/preprocessed_data/dict.de --vocabulary-threshold 3 < baseline/preprocessed_data/valid.de > BPE/preprocessed_data/valid.de

subword-nmt apply-bpe -c BPE/bpe_codes --vocabulary BPE/preprocessed_data/dict.en --vocabulary-threshold 3 < baseline/preprocessed_data/valid.en > BPE/preprocessed_data/valid.en

subword-nmt apply-bpe -c BPE/bpe_codes --vocabulary BPE/preprocessed_data/dict.de --vocabulary-threshold 3 < baseline/preprocessed_data/tiny_train.de > BPE/preprocessed_data/tiny_train.de

subword-nmt apply-bpe -c BPE/bpe_codes --vocabulary BPE/preprocessed_data/dict.en --vocabulary-threshold 3 < baseline/preprocessed_data/tiny_train.en > BPE/preprocessed_data/tiny_train.en

python preprocess.py --target-lang en --source-lang de --dest-dir BPE/prepared_data/ --train-prefix BPE/preprocessed_data/train --valid-prefix BPE/preprocessed_data/valid --test-prefix BPE/preprocessed_data/test --tiny-train-prefix BPE/preprocessed_data/tiny_train --threshold-src 1 --threshold-tgt 1 --num-words-src 4000 --num-words-tgt 4000

