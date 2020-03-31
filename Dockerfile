FROM docker.bintray.io/jfrog/artifactory-pro:7.3.2

WORKDIR /opt/jfrog/artifactory/app/artifactory/tomcat/webapps

RUN jar xvf artifactory.war

RUN jar xvf WEB-INF/lib/artifactory-addons-manager-7.3.2.jar

COPY a.class /opt/jfrog/artifactory/app/artifactory/tomcat/webapps/org/jfrog/license/api/a.class

RUN jar uf WEB-INF/lib/artifactory-addons-manager-7.3.2.jar org/jfrog/license/api/a.class

RUN jar uf artifactory.war WEB-INF/lib/artifactory-addons-manager-7.3.2.jar

RUN rm -rf WEB-INF

RUN rm -rf META-INF

RUN rm -rf com

RUN rm -rf org

RUN rm -rf webapp
