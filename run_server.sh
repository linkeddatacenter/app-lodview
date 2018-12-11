#!/bin/bash
# This file generates run time the configurations file from following environment variables

LODVIEW_URISPACE=${LODVIEW_URISPACE:-http://data.budget.g0v.it/resource/}
LODVIEW_URISPACEPREFIX=${LODVIEW_URISPACEPREFIX:-resource}        
LODVIEW_AUTHUSERNAME=${LODVIEW_AUTHUSERNAME:-""}
LODVIEW_AUTHPASSWORD=${LODVIEW_AUTHPASSWORD:-""}
LODVIEW_SPARQLENDPOINT=${LODVIEW_SPARQLENDPOINT:-https://data.budget.g0v.it/sdaas/sparql}
LODVIEW_HOMEURL=${LODVIEW_HOMEURL:-http://linkeddata.center/}
LODEVIEW_HEADERLOGO=${LODEVIEW_HEADERLOGO:-"../img/logo-header-lodview@2x.png"}
LODVIEW_LANG=${LODVIEW_LANG:-auto}
LODVIEW_LICENSE=${LODVIEW_LICENSE:-""}
LODVIEW_PUBLICURLPREFIX=${LODVIEW_PUBLICURLPREFIX:-https://data.budget.g0v.it/lodview/}
LODVIEW_HOME_TITLE=${LODMAP_HOME_TITLE:-"Welcome to LodeView Application"}
LODVIEW_HOME_ABSTRACT=${LODMAP_HOME_ABSTRACT:-"Please try to refer the <a href='welcome'>welcome resource</a>"}
LODVIEW_HOME_DESCRIPTION=${LODMAP_HOME_DESCRIPTION:-"This is a linked data browser of the data contained in SPARQL end point."}

## substitute %%VARNAME%% with the value of $VARNAME
## $1= template file $2 = target
function mytemplate {
    while read -r line ; do
        while [[ "$line" =~ %%([a-zA-Z_][a-zA-Z_0-9]*)%% ]] ; do
            LHS=${BASH_REMATCH[1]}
            eval RHS=\$$LHS;
            line=${line//%%$LHS%%/$RHS}
        done
        echo "$line"
    done < "$1" > "$2"
}

TEMPLATE_DIR="/templates"
APP_DIR="/usr/local/tomcat/webapps/ROOT"

mytemplate $TEMPLATE_DIR/config.ttl.template $APP_DIR/WEB-INF/conf.ttl
mytemplate $TEMPLATE_DIR/footer.jsp.template $APP_DIR/WEB-INF/views/inc/footer.jsp
mytemplate $TEMPLATE_DIR/home.jsp.template $APP_DIR/WEB-INF/views/home.jsp
mytemplate $TEMPLATE_DIR/custom.css.template $APP_DIR/resources/css/custom.css

catalina.sh run