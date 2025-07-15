#!/bin/bash

if [ ! -f widoco.jar ]; then
    curl -L https://github.com/dgarijo/Widoco/releases/download/v1.4.25/widoco-1.4.25-jar-with-dependencies_JDK-11.jar -o widoco.jar
fi

java -jar widoco.jar -ontFile ./ontology/ehri.owl -outFolder ./documentation -getOntologyMetadata -oops -rewriteAll -htaccess -excludeProvenance

# Include static sections in the generated documentation
cp documentationAdditionalContent/introduction-en.html documentation/sections/introduction-en.html
cp documentationAdditionalContent/references-en.html documentation/sections/references-en.html
mkdir documentation/images
cp documentationAdditionalContent/ehriPortalDataModel.png documentation/images/ehriPortalDataModel.png
cat documentationAdditionalContent/custom.css >> documentation/resources/extra.css