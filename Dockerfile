FROM docker.bintray.io/jfrog/artifactory-pro:5.9.3

WORKDIR /opt/jfrog/artifactory/webapps

RUN jar xvf artifactory.war

RUN jar xvf WEB-INF/lib/artifactory-addons-manager-5.9.3.jar

COPY a.class /opt/jfrog/artifactory/webapps/org/jfrog/license/api/a.class

RUN jar uf WEB-INF/lib/artifactory-addons-manager-5.9.3.jar org/jfrog/license/api/a.class

RUN jar uf artifactory.war WEB-INF/lib/artifactory-addons-manager-5.9.3.jar
