import re
from typing import List

# Read and save every line of the raw catalog in memory
with open("catalog-raw.txt", 'r') as f:
    catalog_raw: List[str] = f.readlines()

# Create the data file and open for writing
with open("py-data.txt", 'w') as f:

    # Go through every line of the raw catalog
    for line in catalog_raw:

        # Ignore the headers
        if line[0] == '#':
            continue

        # Replace bad values to 'nan'
        parsed = re.sub(r' 99 ', ' nan ', line)
        parsed = re.sub(r' -99 ', ' nan ', parsed)
        parsed = re.sub(r' 99.0*0 ', ' nan ', parsed)
        parsed = re.sub(r' -99.0*0 ', ' nan ', parsed)

        # Write to file
        f.write(parsed)

# Read the recently created data file
with open("py-data.txt", 'r') as f:
    catalog: List[str] = f.readlines()

# Create the magnitudes file
with open("py-magnitudes.txt", 'w') as f:

    # Separate only the ID, SPECZ, F435W, F606W, F775W
    for line in catalog:
        cols = line.split()

        # Estimate color by subtracting F775W from F435W
        color = float(cols[9]) - float(cols[11])

        # Format the data
        data = ' '.join([cols[0], cols[93], cols[9],
                        cols[10], cols[11], str(color), '\n'])

        # Write to file
        f.write(data)

# Read the magnitudes file
with open("py-magnitudes.txt", 'r') as f:
    magnitudes: List[str] = f.readlines()

# Split each line so we can convert the last column to a float
# for sorting
all_magnitudes: List[List[str]] = []
for line in magnitudes:
    parsed = line.split()
    parsed[1] = float(parsed[1])
    all_magnitudes.append(line.split())

sorted_magnitudes = sorted(all_magnitudes, key=lambda x: x[1])

# Create the reddest objects file
with open("py-reddest-with-z.txt", 'w') as f:

    for line in sorted_magnitudes:

        # Ignore lines with blank SPECZ
        if line[1] == 'nan' or line[-1] == 'nan' or float(line[-1]) < 3:
            continue

        # Format the line for later use
        parsed = ' '.join(line) + '\n'
        f.write(parsed)
