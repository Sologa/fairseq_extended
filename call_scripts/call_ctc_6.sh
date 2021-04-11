
python train.py \
    ../data-bin/iwslt14.tokenized.de-en-distilled-cutoff \
    --arch transformer_enc_only --share-decoder-input-output-embed \
    --optimizer adam --adam-betas '(0.9, 0.98)' --clip-norm 0.0 \
    --lr 1e-3 --lr-scheduler inverse_sqrt --warmup-updates 4000 \
    --dropout 0.3 --weight-decay 0.0001 \
    --adam-eps 1e-9 \
    --attention-dropout 0.1 \
    --activation-dropout 0.1 \
    --criterion ctc_nat \
    --upsample-coefficient 3 \
    --share-all-embeddings \
    --encoder-layers 6 \
    --decoder-layers 1 \
    --encoder-attention-heads 8 \
    --encoder-embed-dim 512 \
    --encoder-ffn-embed-dim 2048 \
    --decoder-embed-dim 512 \
    --max-tokens 6500 \
    --max-epoch 100 \
    --eval-bleu \
    --eval-bleu-args '{"beam": 5, "max_len_a": 1.2, "max_len_b": 10}' \
    --eval-bleu-detok moses \
    --eval-bleu-remove-bpe \
    --eval-tokenized-bleu \
    --best-checkpoint-metric bleu --maximize-best-checkpoint-metric \
    --keep-best-checkpoints 5 \
    --save-dir checkpoints_dir/ctc-baseline-layer_sharing \
    --task translation \
    --encoder-cross-layer-weight-sharing \