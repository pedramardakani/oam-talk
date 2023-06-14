# Build the directory for downloaded files.
mkdir download

# Download the necessary images.
url="http://cdsarc.u-strasbg.fr/ftp/J/A+A/621/A133/fits"
wget --continue --output-document "./download/abyss-f105w.fits" "$url/ah_f105w.fits"
wget --continue --output-document "./download/abyss-f125w.fits" "$url/ah_f125w.fits"
wget --continue --output-document "./download/abyss-f160w.fits" "$url/ah_f160w.fits"

# Have a look at the images (just to get a feeling of the data)
ds9 download/abyss-f105w.fits -zscale -zoom to fit
ds9 download/abyss-f125w.fits -zscale -zoom to fit
ds9 download/abyss-f160w.fits -zscale -zoom to fit

# Run NoiseChisel (to identify pixels with signal)
astnoisechisel download/abyss-f105w.fits --output f105w-det.fits
astnoisechisel download/abyss-f160w.fits --output f160w-det.fits

# Run Segment (to identify sub-structure)
astsegment f160w-det.fits --output f160w-seg.fits

# Generate a catalog using the F160W image as reference.
astmkcatalog f160w-seg.fits --zeropoint 25.94 --output f160w-cat.fits --ids --ra --dec --magnitude
astmkcatalog f160w-seg.fits --zeropoint 26.27 --valuesfile f105w-det.fits --output f105w-cat.fits --ids --ra --dec --magnitude

# Just to confirm that both tables/catalogs have the same size.
astfits f105w-cat.fits
astfits f160w-cat.fits

# Take out the magnitude column from the F105W catalog and put it
# into the F160W catalog, then delete the temporary file and fix
# the names of the two magnitude columns.
asttable f105w-cat.fits -cMAGNITUDE -of105w-mag.fits
asttable f160w-cat.fits --catcolumnfile f105w-mag.fits --output both-cat.fits
astfits both-cat.fits --update TTYPE4,MAG-F160W --update TTYPE5,MAG-F105W
rm f105w-mag.fits

# Extract the RA and Dec of the reddest object (with a ',' between
# the RA and Dec) that is relatively bright magnitude (to be nicely
# visible) and put it into the variable 'center', then check the
# value.
center=$(asttable both-cat.fits --range MAG-F160W,-inf,27 -cRA,DEC,'arith MAG-F105W MAG-F160W -' | asttable  --sort 3 --descending --head 1 -c1,2 | xargs printf "%s,%s")
echo "$center"

# Crop out the two filters around this coordinate.
astcrop download/abyss-f160w.fits --center "$center" --width 10/3600 -o f160w-crop.fits
astcrop download/abyss-f125w.fits --center "$center" --width 10/3600 -o f125w-crop.fits
astcrop download/abyss-f105w.fits --center "$center" --width 10/3600 -o f105w-crop.fits

# Convert the crops to JPEG for easier viewing
astconvertt f160w-crop.fits f125w-crop.fits f105w-crop.fits -o red.jpg --fluxlow -0.01 --fluxhigh 0.01 -h1 -h1 -h1