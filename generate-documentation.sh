#!/bin/bash

if [ ! -f widoco.jar ]; then
    curl -L https://github.com/dgarijo/Widoco/releases/download/v1.4.25/widoco-1.4.25-jar-with-dependencies_JDK-11.jar -o widoco.jar
fi

#java -jar widoco.jar -ontFile ./ontology/ehri.owl -outFolder ./documentation -getOntologyMetadata -oops -rewriteAll -htaccess -uniteSections -excludeProvenance
java -jar widoco.jar -ontFile ./ontology/ehri.owl -outFolder ./documentation -getOntologyMetadata -oops -rewriteAll -htaccess -excludeProvenance