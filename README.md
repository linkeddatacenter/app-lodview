# Lodview container

LodView is a Java web application based on Spring and Jena, it's a tool able to offer a W3C standard compliant IRI dereferenciation. LodView, in conjunction with a SPARQL endpoint, allows you to publish RDF data according to all defined standards for Linked Open Data.

LodView is easy to configure and deploy for any developer and it dramatically improves the end user’s experience in accessing HTML based representations of RDF resources.


Lodview is a project Copyright (c) 2014 <Diego Valerio Camarda, Alessandro Antonuccio> see https://github.com/dvcama/LodView for more info.

This implementation is functional to the LinkedData.Center sdaas tools services and add some namespaces to support g0v community and LinkedData.Center ontologies.


## using LodView


You can use the following environment variables to customize the container:

- `LODVIEW_URISPACE` -> the value for void:uriSpace fro knowledge base (default : http://linkeddata.center/resource/)
- `LODVIEW_URISPACEPREFIX` -> the prefix for uriSpace (default 'resource')
- `LODVIEW_SPARQLENDPOINT` -> the sparql endpoint for the knowledge base (default : https://linkeddata.center/sparql)
- `LODVIEW_AUTHUSERNAME` -> the sparql endpoint username used for sparql endpoint access authentication ('' for default )
- `LODVIEW_AUTHPASSWORD` -> the sparql endpoint username used for sparql endpoint access  authentication ('' for default )
- `LODVIEW_HOMEURL` -> home link (accessible from the banner) ('http;//linkedddata.center/' for default )
- `LODVIEW_LANG` -> home link (accessible from the banner) ('http;//linkedddata.center/' for default )
- `LODVIEW_LICENSE` -> a service license statement (empty by default)
- `LODVIEW_DATALICENSE` -> data provenance info and licenses

The home page can be customized using following variables:

- `LODMAP_HOME_TITLE` 
- `LODMAP_HOME_ABSTRACT`
- `LODMAP_HOME_DESCTRIPTION`

Run the application with docker

```
docker build -t test-lodview .
docker run -d --name lodview  -p 9090:8080 -e LODVIEW_SPARQLENDPOINT="https://dbpedia.org/sparql"  -e LODVIEW_URISPACE="http://dbpedia.org/resource/" test-lodview 
```    

Try it at http://localhost:9090/Linked_Data

## Publish on docker hub

```
VERSION=1.0.1
NAME=linkeddatacenter/lodview
git tag $VERSION
docker build --no-cache  -t $NAME .
docker tag $NAME:latest $NAME:$VERSION
docker login 
docker push $NAME:$VERSION
docker push $NAME:latest

