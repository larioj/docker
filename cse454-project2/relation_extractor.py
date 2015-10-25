import csv, nltk, os, pprint, random, re, string, sys
from nltk import classify, NaiveBayesClassifier, word_tokenize, stem
from nltk.stem.snowball import SnowballStemmer
from ast import literal_eval as make_tuple

# file -> [[sentence, entity1, entity2]]

def entitites(sent):
    doc = nltk.ne_chunk(sent)
    IN = re.compile(r'.*');
    tups = [make_tuple(nltk.sem.relextract.clause(rel, ''))
        for rel in nltk.sem.extract_rels('PERSON', 'ORG', doc, pattern = IN)]
    return tups

def replicate(tup):
    ents = tup[0]
    sent = tup[1]
    return [(ent, sent) for ent in ents]

def preprocess(doc):
    stemmer = stem.snowball.EnglishStemmer()
    sentences = nltk.sent_tokenize(doc)
    words = [stemmer.stem(nltk.word_tokenize(sent)) for sent in sentences]
    tagged = [nltk.pos_tag(sent) for sent in words]
    tups = [entitites(sent) for sent in tagged]
    zipped = zip (tups, sentences)
    reps = [replicate(tup) for tup in zipped]
    flat = [tup for ltups in reps for tup in ltups]
    return flat

print (preprocess("Francis Davis (born August 30, 1946, Philadelphia) is an American author and journalist. George Smalridge was born at Lichfield, son of the Sheriff of Lichfield Thomas Smalridge, George received his early education, this being completed at Westminster School and at Christ Church, Oxford."))



#with open("test_data.csv", 'rb') as csvfile:
#    # [type, sentence, entity1, entity2]
#    sents = csv.reader(csvfile, delimiter=",", quotechar = "\"")
#    for row in sents:
#        sent = row[1]
#        print(preprocess(sent))
#    sent = ie_preprocess(rels.next()[1])[0]
#    grammar = "NP: {<DT>?<JJ>*<NN>}"
#    cp = nltk.RegexpParser(grammar)
#    res = cp.parse(sent)
#    res1 = nltk.ne_chunk(sent)
#    print sent
