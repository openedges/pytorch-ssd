#!/bin/bash

. ./venv/bin/activate

network=mb2-ssd-lite
f_pth=models/mb2-ssd-lite-mp-0_686.pth
f_label=models/voc-model-labels.txt
f_onnx=models/${network}.onnx

cmd="python export_onnx_default_box.py ${network} ${f_pth} ${f_label}"

echo ${cmd}
eval ${cmd}

if [[ -f "${f_onnx}" ]]; then
    echo "${f_onnx} export success!"
else
    echo "${f_onnx} export failed!"
fi

