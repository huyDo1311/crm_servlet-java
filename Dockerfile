FROM tomcat:10.1-jdk17

COPY target/crm_app.war /usr/local/tomcat/webapps/crm_app.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
