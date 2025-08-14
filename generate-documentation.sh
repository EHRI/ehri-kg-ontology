#!/bin/bash

if [ ! -f widoco.jar ]; then
    curl -L https://github.com/dgarijo/Widoco/releases/download/v1.4.25/widoco-1.4.25-jar-with-dependencies_JDK-11.jar -o widoco.jar
fi

# Generate documentation with OOPS evaluation
java -jar widoco.jar -ontFile ./ontology/ehri.owl -outFolder ./documentation -getOntologyMetadata -oops -rewriteAll -htaccess -excludeProvenance
# Generate documentation without OOPS evaluation
java -jar widoco.jar -ontFile ./ontology/ehri.owl -outFolder ./documentation -getOntologyMetadata -rewriteAll -htaccess -excludeProvenance

# Include static sections in the generated documentation
cp configurations/documentationAdditionalContent/introduction-en.html documentation/sections/introduction-en.html
cp configurations/documentationAdditionalContent/references-en.html documentation/sections/references-en.html
mkdir documentation/images
cp configurations/documentationAdditionalContent/ehriPortalDataModel.png documentation/images/ehriPortalDataModel.png
cat configurations/documentationAdditionalContent/custom.css >> documentation/resources/extra.css
sed -i 's/<a href="https:\/\/www\.ica\.org\/standards\/RiC\/ontology">ontology<\/a>/<a href="https:\/\/www\.ica\.org\/standards\/RiC\/ontology\/1\.0\.2">RiC-O 1\.0\.2<\/a>/g' documentation/index-en.html