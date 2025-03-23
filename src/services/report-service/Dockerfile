# Dockerfile for Session Service
FROM openjdk:8-jdk-alpine

# Set working directory
WORKDIR /report_service

COPY . .
RUN chmod +x wait-for-it.sh
RUN apk update && apk add bash \
&& apk add maven
RUN mvn -B dependency:go-offline
RUN mvn -N io.takari:maven:wrapper
RUN mvn -B package -DskipTests

#EXPOSE 8086


# Define environment variables
ENV POSTGRES_HOST=postgres
ENV POSTGRES_PORT=5432
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD="postgres"
ENV POSTGRES_DB=statistics_db
ENV RABBIT_MQ_HOST=rabbitmq
ENV RABBIT_MQ_PORT=5672
ENV RABBIT_MQ_USER=guest
ENV RABBIT_MQ_PASSWORD=guest
ENV RABBIT_MQ_QUEUE_NAME=messagequeue
ENV RABBIT_MQ_EXCHANGE=messagequeue-exchange

# Run the application
CMD ["./wait-for-it.sh",  "-s", "-t", "60", "postgres:5432", "-s", "-t", "60", "rabbitmq:5672", "--", "java", "-jar", "target/session-service-0.0.1-SNAPSHOT.jar"]
