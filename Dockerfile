FROM tomcat:8
# Take the war and copy to webapps of tomcat
COPY target/newapp.war /usr/local/tomcat/webapps/
COPY Tomcat/config.yaml /usr/local/tomcat/bin/
COPY Tomcat/setenv.sh /opt/tomcat
COPY Tomcat/jmx_prometheus_httpserver-0.18.0.jar /opt/tomcat
RUN java -jar /opt/jmx_prometheus_httpserver-0.18.0.jar
