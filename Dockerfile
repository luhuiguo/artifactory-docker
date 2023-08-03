FROM releases-docker.jfrog.io/jfrog/artifactory-pro:7.63.9

WORKDIR /opt/jfrog/artifactory/app/artifactory/tomcat/webapps

RUN /opt/jfrog/artifactory/app/third-party/java/bin/jar xvf artifactory.war WEB-INF/lib/artifactory-addons-manager-7.63.8.jar

RUN /opt/jfrog/artifactory/app/third-party/java/bin/jar xvf WEB-INF/lib/artifactory-addons-manager-7.63.8.jar org/jfrog/license/api/a.class

COPY a.class org/jfrog/license/api/a.class

RUN /opt/jfrog/artifactory/app/third-party/java/bin/jar uf WEB-INF/lib/artifactory-addons-manager-7.63.8.jar org/jfrog/license/api/a.class

RUN /opt/jfrog/artifactory/app/third-party/java/bin/jar uf artifactory.war WEB-INF/lib/artifactory-addons-manager-7.63.8.jar

RUN rm -rf WEB-INF

RUN rm -rf org

WORKDIR /opt/jfrog/artifactory
