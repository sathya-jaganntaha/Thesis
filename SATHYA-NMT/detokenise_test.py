DATA='data'
import sys 
import sentencepiece as spm
sp = spm.SentencePieceProcessor(model_file='/content/drive/MyDrive/SATHYA-NMT/data/models/spm_model.bpe.ta.kn.model')
src_lang = sys.argv[1]
trg_lang = sys.argv[2]
filenames = [DATA+f'/{src_lang}-{trg_lang}/testoutputspm.{trg_lang}']
writefilenames = [DATA+f'/{src_lang}-{trg_lang}/testoutput.{trg_lang}']

for (filename, writefile) in zip(filenames, writefilenames):
    with open(filename, 'r') as f, open(writefile, 'w') as g:
        count=0
        while(1):
            line = f.readline()
            count += 1
            if(line):
                out = sp.encode(line)
                out = sp.decode(out)
                g.writelines(out + '\n')
            else: break
    
