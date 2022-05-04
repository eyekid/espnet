#!/usr/bin/env bash
# Set bash to 'debug' mode, it will exit on :
# -e 'error', -u 'undefined variable', -o ... 'error in pipeline', -x 'print commands',
set -e
set -u
set -o pipefail

sample_rate=16k


train_set=tr_synthetic
valid_set=cv_synthetic
test_sets="tt_synthetic_track_1"

./enh.sh \
    --lang en \
    --train_set "${train_set}" \
    --valid_set "${valid_set}" \
    --test_sets "${test_sets}" \
    --fs ${sample_rate} \
    --ngpu 1 \
    --spk_num 1 \
    --local_data_opts "" \
    --enh_config ./conf/train.yaml \
    --use_dereverb_ref false \
    --use_noise_ref false \
    --max_wav_duration 31 \
    --inference_model "valid.loss.best.pth" \
    "$@"
