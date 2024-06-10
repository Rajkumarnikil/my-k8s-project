FROM tomcat:8
# Take the war and copy to webapps of tomcat
COPY target/newapp.war /usr/local/tomcat/webapps/
COPY sudo/opt/setenv.sh /usr/local/tomcat/bin/
COPY sudo /opt/config.yaml /opt/tomcat
COPY sudo /opt/jmx_prometheus_httpserver-0.18.0.jar /opt/tomcat
RUN java -jar /opt/jmx_prometheus_httpserver-0.18.0.jar
