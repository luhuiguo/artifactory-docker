FROM docker.bintray.io/jfrog/artifactory-pro:7.18.6

WORKDIR /opt/jfrog/artifactory/app/artifactory/tomcat/webapps

RUN /opt/jfrog/artifactory/app/third-party/java/bin/jar xvf artifactory.war

RUN /opt/jfrog/artifactory/app/third-party/java/bin/jar xvf WEB-INF/lib/artifactory-addons-manager-7.18.6.jar

COPY a.class /opt/jfrog/artifactory/app/artifactory/tomcat/webapps/org/jfrog/license/api/a.class

RUN /opt/jfrog/artifactory/app/third-party/java/bin/jar uf WEB-INF/lib/artifactory-addons-manager-7.18.6.jar org/jfrog/license/api/a.class

RUN /opt/jfrog/artifactory/app/third-party/java/bin/jar uf artifactory.war WEB-INF/lib/artifactory-addons-manager-7.18.6.jar

RUN rm -rf WEB-INF

RUN rm -rf META-INF

RUN rm -rf com

RUN rm -rf org

RUN rm -rf webapp
