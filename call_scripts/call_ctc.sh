
python train.py \
    ../data-bin/iwslt14.tokenized.de-en-distilled \
    --arch transformer_enc_only --share-decoder-input-output-embed \
    --optimizer adam --adam-betas '(0.9, 0.997)' --clip-norm 0.0 \
    --lr 1e-3 --lr-scheduler inverse_sqrt --warmup-updates 10000 \
    --dropout 0.1 --weight-decay 0.0001 \
    --adam-eps 1e-9 \
    --criterion ctc_nat \
    --upsample-coefficient 3 \
    --share-all-embeddings \
    --encoder-layers 12 \
    --encoder-attention-heads 8 \
    --encoder-embed-dim 512 \
    --decoder-embed-dim 512 \
    --max-tokens 7000 \
    --max-update 2000000 \
    --eval-bleu \
    --eval-bleu-args '{"beam": 5, "max_len_a": 1.2, "max_len_b": 10}' \
    --eval-bleu-detok moses \
    --eval-bleu-remove-bpe \
    --eval-bleu-print-samples \
    --eval-tokenized-bleu \
    --best-checkpoint-metric bleu --maximize-best-checkpoint-metric \
    --keep-best-checkpoints 5 \
    --save-dir checkpoints_dir/ctc-baseline \
    --task translation \
