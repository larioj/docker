import glob
import os.path
import sys
from sklearn.feature_extraction.text import CountVectorizer, TfidfTransformer
from sklearn.naive_bayes import MultinomialNB
from sklearn.pipeline import Pipeline

train_file = sys.argv[1]
test_file = sys.argv[2]

# Load the training data

# Construct single training set and targets
train_docs = ham_docs + spam_docs
train_target = [0] * len(ham_docs) + [1] * len(spam_docs)

# Initialize classifier pipeline
# CountVectorizer creates a feature vector with each component as an absolute count
# of word occurrence
vectorizer = CountVectorizer(analyzer='word', stop_words='english', input='filename')
# Perform tf-idf transformation to help normalize documents
tfidf_transformer = TfidfTransformer()
# Use a naive bayes classifier
bayes_classifier = MultinomialNB()

spam_classifier = Pipeline([
  ('vectorizer', vectorizer),
  ('tfidf_transformer', tfidf_transformer),
  ('classifier', bayes_classifier)
])

# Train to produce a model
spam_classifier.fit(train_docs, train_target)

# Use model to predict test docs
predicted = spam_classifier.predict(test_docs)

# Format output as CSV
for doc, spam in zip(test_docs, predicted):
  print('{},{}'.format(os.path.basename(doc), spam))




with open("relation_extraction_dataset.csv", 'rb') as csvfile:
    # [type, sentence, entity1, entity2]
    rels = csv.reader(csvfile, delimiter=",", quotechar = "\"")
    sent = ie_preprocess(rels.next()[1])[0]
    grammar = "NP: {<DT>?<JJ>*<NN>}"
    cp = nltk.RegexpParser(grammar)
    res = cp.parse(sent)
    res1 = nltk.ne_chunk(sent)
    print sent