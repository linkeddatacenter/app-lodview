FROM maven:3.5.0-jdk-8 as lodview
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/dvcama/LodView.git
COPY resources/css/* /LodView/src/main/webapp/resources/css/
COPY resources/img/* /LodView/src/main/webapp/resources/img/

RUN cd LodView && mvn compile war:war
FROM tomcat:8

RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY --from=lodview /LodView/target/lodview /usr/local/tomcat/webapps/ROOT

COPY templates /templates
COPY run_server.sh /run_server.sh
RUN chmod +x /run_server.sh

ENV APP_NAME="ROOT"
CMD /run_server.sh
