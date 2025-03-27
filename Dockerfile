
FROM tomcat:8.5.34-jre8

RUN rm -rf /usr/local/tomcat/webapps/*

COPY shop-1.0.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8083

CMD ["catalina.sh", "run"]