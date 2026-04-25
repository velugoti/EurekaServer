FROM eclipse-temurin:21-jdk-jammy

WORKDIR /app

COPY build/libs/eureka-server.jar app.jar

EXPOSE 8761

ENTRYPOINT ["java","-jar","app.jar"]