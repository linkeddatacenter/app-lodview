# Lodview container

LodView is a Java web application based on Spring and Jena, it's a tool able to offer a W3C standard compliant IRI dereferenciation. LodView, in conjunction with a SPARQL endpoint, allows you to publish RDF data according to all defined standards for Linked Open Data.

LodView is easy to configure and deploy for any developer and it dramatically improves the end user’s experience in accessing HTML based representations of RDF resources.


Lodview is a project Copyright (c) 2014 <Diego Valerio Camarda, Alessandro Antonuccio> see https://github.com/dvcama/LodView for more info.

This implementation is functional to the LinkedData.Center sdaas tools services and add some namespaces to support g0v community and LinkedData.Center ontologies.


## using LodView


You can use the following environment variables to customize the container:


- `LODVIEW_TBOXPREFIX` -> the prefix for uriSpace (default 'mef')
- `LODVIEW_TBOXSPACE` -> the main vocabulary for your domain ('http://w3id.org/g0v/it/mef#' by default)
- `LODVIEW_URISPACEPREFIX` -> the prefix for uriSpace (default 'resource')
- `LODVIEW_URISPACE` -> the value for void:uriSpace fro knowledge base (default: http://data.budget.g0v.it/resource/)
- `LODVIEW_SPARQLENDPOINT` -> the sparql endpoint for the knowledge base (default : https://data.budget.g0v.it/sdaas/sparql)
- `LODVIEW_AUTHUSERNAME` -> the sparql endpoint username used for sparql endpoint access authentication (empty by default )
- `LODVIEW_AUTHPASSWORD` -> the sparql endpoint username used for sparql endpoint access  authentication (empty by default )
- `LODVIEW_HOMEURL` -> home link (accessible from the banner) ('http://linkedddata.center/' for default )
- `LODEVIEW_HEADERLOGO` -> header logo url, relative or absolute (default ../img/logo-header-lodview@2x.png)
- `LODVIEW_LANG` -> home link (accessible from the banner) ('auto' by default )
- `LODVIEW_LICENSE` -> a service license statement (empty by default)
- `LODVIEW_DATALICENSE` -> data provenance info and licenses (empty by default)
- `LODVIEW_PUBLICURLPREFIX` -> how clients access your app ('https://data.budget.g0v.it/lodview/' by defatult). Use auto for local testing.
- `APP_NAME` -> overrides the pathname of the app url, by default is the root (APP_NAME="ROOT")

The home page can be customized using following variables:

- `LODVIEW_HOME_TITLE` 
- `LODVIEW_HOME_ABSTRACT`
- `LODVIEW_HOME_DESCRIPTION`

Run the application with docker

```
docker build -t test-lodview .
docker run -d --name lodview  -p 9090:8080 -e LODVIEW_PUBLICURLPREFIX=auto test-lodview 
```

Try it at http://localhost:9090/

## Publish on docker hub

```
VERSION=1.3.0
NAME=linkeddatacenter/lodview
git add . && git commit -m "Ready for $VERSION" && git push


docker build --no-cache  -t $NAME .
docker tag $NAME:latest $NAME:$VERSION
docker login 
docker push $NAME:$VERSION
docker push $NAME:latest
```
