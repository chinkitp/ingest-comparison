import glob, os
os.chdir("./")
files=[]
for file in glob.glob("*.tmp"):
    files.append(file)

with open('./final', 'a') as outfile:
    for fname in files:
        outfile.write("\n")
        with open(fname) as infile:
            outfile.write(infile.read())