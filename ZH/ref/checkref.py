# 检查bib文件信息的完整性

import bibtexparser
import numpy as np

# ----------------------------------
filename_bib='refs.bib'
keys_check_article=['title','journal','author','year','volume','number','pages','doi']
# ----------------------------------
def loadrefs(filename_bib):
    with open(filename_bib) as bibtex_file:
        bib_database = bibtexparser.load(bibtex_file)
    entries = bib_database.entries
    return entries
def infoRefs(refs,fpout):
    fpout.write('总共%d个参考 文献\n' % (len(refs)))
    reftypes = []
    for ref in refs:
        reftypes.append(ref['ENTRYTYPE'])
    reftypes = np.array(reftypes)
    reftypes_unique=np.unique(reftypes)
    fpout.write('总共%d个文献类型，分别为: ' % (len(reftypes_unique)))
    for reftype in reftypes_unique:
        fpout.write('%s; ' % (reftype))
    fpout.write('\n')
    for reftype in reftypes_unique:
        if (reftype != 'article'):
            fpout.write('%s(%d)\n'%(reftype,len(reftypes[reftypes==reftype])))
            for ref in refs:
                if (ref['ENTRYTYPE'] == reftype):
                    fpout.write('\t'+ref['ID']+'\n')
    fpout.write('\n\n')
def check_article(refs, keys_check, reftype, fpout):
    fpout.write('检查article的信息\n')
    for key in keys_check:
        fpout.write('\t' + key + '\n')
        num_wrong=0
        for ref in refs:
            if (ref['ENTRYTYPE'] != reftype):
                continue
            if(key in ref):
                if (ref[key] == []):
                    fpout.write('\t\t'+key + ' in ' + ref + ' is  empty\n')
                    num_wrong=num_wrong+1
            else:
                fpout.write('\t\t' + ref['ID'] + '\n')
                num_wrong = num_wrong + 1
        if (num_wrong == 0):
            fpout.write('\t\t完整')
            fpout.write('\n')
# 1. refs
refs = loadrefs(filename_bib)
# 2. num of refs
num_refs = len(refs)

fpout = open('log_checkref.txt', 'w')
# basic information
infoRefs(refs,fpout)
# 3 check keys for article
check_article(refs, keys_check_article,'article',fpout)


fpout.close()