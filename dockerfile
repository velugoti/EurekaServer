FROM eclipse-temurin:21-jdk-jammy

# Set working directory
WORKDIR /app

# Copy the built jar (renamed inside container)
COPY build/libs/EurekaServer-*.jar eureka-server.jar

# Expose Eureka port
EXPOSE 8761

# Run the application
ENTRYPOINT ["java","-jar","eureka-server.jar"]