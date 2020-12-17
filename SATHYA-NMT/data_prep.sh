#!/bin/bash
DIR='/content/drive/MyDrive/SATHYA-NMT/data'
EN='kn'
INDIC='ta' # change this for other languages
TRAINSIZE=43598 

MODEL_DIR=$DIR/models
DATA_DIR=$DIR/$EN-$INDIC
paste $DATA_DIR/rawdata.$EN $DATA_DIR/rawdata.$INDIC | shuf > $DATA_DIR/rawdata.$EN.$INDIC
cut -f '1' $DATA_DIR/rawdata.$EN.$INDIC > $DATA_DIR/shufdata.$EN
cut -f '2' $DATA_DIR/rawdata.$EN.$INDIC > $DATA_DIR/shufdata.$INDIC
rm $DATA_DIR/rawdata.$EN.$INDIC

head -n $TRAINSIZE $DATA_DIR/shufdata.$EN > $DATA_DIR/train.$EN
head -n $TRAINSIZE $DATA_DIR/shufdata.$INDIC > $DATA_DIR/train.$INDIC
tail -n 3000  $DATA_DIR/shufdata.$EN > $DATA_DIR/dev.$EN # The number should be corpus_size - trainsize
tail -n 3000  $DATA_DIR/shufdata.$INDIC > $DATA_DIR/dev.$INDIC
head -n 1500 $DATA_DIR/dev.$EN > $DATA_DIR/val.$EN
head -n 1500 $DATA_DIR/dev.$INDIC > $DATA_DIR/val.$INDIC
tail -n 1500 $DATA_DIR/dev.$EN > $DATA_DIR/test.$EN
tail -n 1500 $DATA_DIR/dev.$INDIC > $DATA_DIR/test.$INDIC

cat $DATA_DIR/train.$EN $DATA_DIR/train.$INDIC > $DATA_DIR/trainconcat.$EN.$INDIC # for sentence piece model

#rm $DATA_DIR/val.$EN $DATA_DIR/val.$INDIC $DATA_DIR/train.$EN $DATA_DIR/train.$INDIC $DATA_DIR/dev.$EN $DATA_DIR/dev.$INDIC