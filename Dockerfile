FROM maven:3-openjdk-17

WORKDIR /app

COPY ./pom-0.xml /app

RUN mvn -f pom-0.xml dependency:copy-dependencies

COPY ./pom.xml /app

RUN mvn dependency:copy-dependencies

COPY ./h2.server.properties /root/.h2.server.properties

CMD ["java", "-cp", "./target/dependency/*", "org.h2.tools.Console", "-web", "-webAllowOthers"]

EXPOSE 8082

