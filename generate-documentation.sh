#!/bin/bash

if [ "$1" = "-sudo" ]; then
    with_sudo=sudo
fi

if [ ! -f widoco.jar ]; then
    curl -L https://github.com/dgarijo/Widoco/releases/download/v1.4.25/widoco-1.4.25-jar-with-dependencies_JDK-11.jar -o widoco.jar
fi

uvx --from mitmproxy mitmdump -s proxy/proxy.py &

proxy_pid=$!

sleep 30s

if [ `$with_sudo keytool -list -cacerts -alias mitmproxy -storepass changeit | grep "Certificate fingerprint" | wc -l` -lt 1 ]; then
    echo "Importing mitmproxy certificate into Java cacerts"
    $with_sudo keytool -importcert -noprompt -alias mitmproxy -storepass changeit -keystore $JAVA_HOME/lib/security/cacerts -trustcacerts -file ~/.mitmproxy/mitmproxy-ca-cert.pem
fi

# Generate documentation with OOPS evaluation
java -Dhttps.proxyHost=localhost -Dhttps.proxyPort=8080 -Dhttp.proxyHost=localhost -Dhttp.proxyPort=8080 -jar widoco.jar -ontFile ./ontology/ehri.owl -outFolder ./documentation -getOntologyMetadata -oops -rewriteAll -htaccess -excludeProvenance
# Generate documentation without OOPS evaluation
java -Dhttps.proxyHost=localhost -Dhttps.proxyPort=8080 -Dhttp.proxyHost=localhost -Dhttp.proxyPort=8080 -jar widoco.jar -ontFile ./ontology/ehri.owl -outFolder ./documentation -getOntologyMetadata -rewriteAll -htaccess -excludeProvenance

# Include static sections in the generated documentation
cp configurations/documentationAdditionalContent/introduction-en.html documentation/sections/introduction-en.html
cp configurations/documentationAdditionalContent/description-en.html documentation/sections/description-en.html
cp configurations/documentationAdditionalContent/references-en.html documentation/sections/references-en.html
mkdir documentation/images
cp configurations/documentationAdditionalContent/ehriPortalDataModel.png documentation/images/ehriPortalDataModel.png
cp configurations/documentationAdditionalContent/ontologyDiagram.png documentation/images/ontologyDiagram.png
cat configurations/documentationAdditionalContent/custom.css >> documentation/resources/extra.css
sed -i 's/<a href="https:\/\/www\.ica\.org\/standards\/RiC\/ontology">ontology<\/a>/<a href="https:\/\/www\.ica\.org\/standards\/RiC\/ontology\/1\.1">RiC-O 1\.1<\/a>/g' documentation/index-en.html

kill $proxy_pid