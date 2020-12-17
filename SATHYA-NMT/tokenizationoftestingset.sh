#!/bin/bash
DATA_DIR='/content/drive/MyDrive/SATHYA-NMT/data'

EN='kn'
INDIC='ta'

spm_encode --model=$DATA_DIR/models/spm_model.bpe.$EN.$INDIC.model < $DATA_DIR/$EN-$INDIC/test.$EN > $DATA_DIR/$EN-$INDIC/testspm.$EN
spm_encode --model=$DATA_DIR/models/spm_model.bpe.$EN.$INDIC.model < $DATA_DIR/$EN-$INDIC/test.$INDIC > $DATA_DIR/$EN-$INDIC/testspm.$INDIC