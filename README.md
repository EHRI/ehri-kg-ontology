# EHRI Ontology

This is the repository for the [EHRI Ontology](https://lod.ehri-project-test.eu/ontology/) which hosts the OWL source code, the documentation, and the scripts to automatically generate the said documentation.

## Objectives
The [EHRI Portal](https://portal.ehri-project.eu/) is an aggregator for archival descriptions metadata pertaining to the Holocaust. To date, the Portal gathers more than 380,000 archival descriptions from 2317 archives located in 61 countries and constitutes a precious source of information for researchers on the Holocaust. However, this data was not yet made available as Linked Open Data (LOD). In order to overcome this gap, the [EHRI-KG project](https://ehri-kg.ehri-project.eu/) set out to create a Knowledge Graph based on the EHRI Portal's data.

While the vast majority of the data is aligned to the [Records in Contexts Ontology (RiC-O)](https://www.ica.org/standards/RiC/ontology), and where necessary to [schema.org](https://schema.org/), there are still data modelling gaps, mainly stemming from EHRI's intesive use of classic archival specifications ([ISAD(G)](https://www.ica.org/resource/isadg-general-international-standard-archival-description-second-edition/), [ISDIAH](https://www.ica.org/resource/isdiah-international-standard-for-describing-institutions-with-archival-holdings/) and [ISAAR](https://www.ica.org/resource/isaar-cpf-international-standard-archival-authority-record-for-corporate-bodies-persons-and-families-2nd-edition/)) and its adaptation to the Holocaust-specific context, which require a proper formalisation. The EHRI Ontology is, therefore, the result of this data modeling and formalisation effort and is offered as an extension of RiC-O ready to be reused by others practicioners.

## Documentation
The documentation for this ontology is generated using [Widoco](https://github.com/dgarijo/Widoco). Its output is then enriched with some additional resources to bypass some of the existing limitations or customise the final look. The generation process is fully automated and can be run using the following command:
```bash
$ bash generate-documentation.sh
```
The latest version is available at: [https://lod.ehri-project-test.eu/ontology/](https://lod.ehri-project-test.eu/ontology/)

## Multilinguality
The labels (`rdfs:label`) for all the declared elements are translated to English, Spanish and French whereas the definitions (`rdfs:comment`) are only offered in English. Due to this, the documentation is for now only generated in English. However, contributions with additional translations are always welcome.

## Funding
This work has been carried out in the context of the OSCARS project, which has received funding from the European Commission’s Horizon Europe Research and Innovation programme under grant agreement No. 101129751.

## Authors
* [Herminio García-González](https://github.com/herminiogg)
* [Mike Bryant](https://github.com/mikesname)