DATA='data'
import sys
import sentencepiece as spm
src_lang = sys.argv[1]
trg_lang = sys.argv[2]
s = spm.SentencePieceProcessor(model_file=DATA+f'/models/spm_model.bpe.{src_lang}.{trg_lang}.model')
filenames = [DATA+f'/{src_lang}-{trg_lang}/test.{src_lang}', DATA+f'/{src_lang}-{trg_lang}/test.{trg_lang}',DATA+f'/{src_lang}-{trg_lang}/train.{src_lang}', DATA+f'/{src_lang}-{trg_lang}/train.{trg_lang}',DATA+f'/{src_lang}-{trg_lang}/val.{src_lang}', DATA+f'/{src_lang}-{trg_lang}/val.{trg_lang}']
writefilenames = [DATA+f'/{src_lang}-{trg_lang}/testspm.{src_lang}', DATA+f'/{src_lang}-{trg_lang}/testspm.{trg_lang}',DATA+f'/{src_lang}-{trg_lang}/trainspm.{src_lang}', DATA+f'/{src_lang}-{trg_lang}/trainspm.{trg_lang}',DATA+f'/{src_lang}-{trg_lang}/valspm.{src_lang}', DATA+f'/{src_lang}-{trg_lang}/valspm.{trg_lang}']
for (filename, writefile) in zip(filenames, writefilenames):
    with open(filename, 'r') as f, open(writefile, 'w') as g:
        while(1):
            line = f.readline()
            if(line):
                out = s.encode(line, out_type=str)
                output = " ".join(out)
                g.writelines(output)
                g.writelines('\n')
            else: break
    
