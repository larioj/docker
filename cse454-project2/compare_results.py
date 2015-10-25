import sys, csv

proposed_classification_filename = sys.argv[1] # get filename from command line args

key = {}
with open('key3.csv') as csvfile: # read answer key from file
	key_reader = csv.reader(csvfile)
	for row in key_reader:
		key[int(row[0])] = [row[1], row[2], row[3]]

proposed_classification = [] 
with open(proposed_classification_filename) as csvfile: # read student result from file
	pc_reader = csv.reader(csvfile)
	for row in pc_reader:
		proposed_classification.append(row)

num_test_cases = len(key.keys())
num_true = sum(map(lambda x: 1 if key[x][0] == 'born-in' else 0, key.keys()))

tp = 0
fp = 0
fn = 0

fp_pp = 0 # false positives where label existed in sentence but person or place was wrong
fp_label = 0 #  false positives where born-in did not exist in sentence

found = range(0, num_test_cases)
found = map(lambda x: 0, found)

for row in proposed_classification:
	sentence_key = key[int(row[0])]
	proposed_person = row[2]
	proposed_place = row[3]
	proposed_label = row[1]
	key_person = sentence_key[1]
	key_place = sentence_key[2]
	key_label = sentence_key[0]
	if proposed_label == "born-in":
		if key_label == "born-in":
			if (proposed_person in key_person or key_person in proposed_person) and (proposed_place in key_place or key_place in proposed_place):
				tp += 1
				found[int(row[0])] = 1
			elif (proposed_person in key_place or key_person in proposed_place) and (proposed_place in key_person or key_place in proposed_person):
				tp += 1
				found[int(row[0])] = 1
			else:
				fp += 1
				fp_pp += 1
		else:
			fp += 1		
			fp_label += 1	

fn = num_true - sum(found)
print "A. Total number of born-in relations which existed in the test set:"
print num_true
print "B. Number of the above relations which you discovered:"
print sum(found)
print "C. False Negatives (Number of the born-in relations which you missed):"
print fn
print "D. Number of the born-in relations you discovered which correponded to true born-in relations:"
print tp
print "(If C is different than B, it is because some of your relations were duplicates.)"
print "E. False Positives where you found a born-in relation in a sentence where no born-in relation existed:"
print fp_label
print "F. False Positives where you found a born-in relation in a sentence where one existed, but identified incorrect entities:"
print fp_pp
print "G. Total False Positives"
print fp
print "To compute your recall, precision, and F1, use quantity A as true positives, quantity G as false positives, and quantity C as false negatives."
