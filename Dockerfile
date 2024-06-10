FROM tomcat:8
# Take the war and copy to webapps of tomcat
COPY target/newapp.war /usr/local/tomcat/webapps/
COPY /opt/setenv.sh /usr/local/tomcat/bin/
Copy /opt/config.yaml /opt/tomcat
Copy /opt/jmx_prometheus_httpserver-0.18.0.jar /opt/tomcat
RUN java -jar /opt/jmx_prometheus_httpserver-0.18.0.jar
