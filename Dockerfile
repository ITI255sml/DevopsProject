FROM openjdk:11
WORKDIR /app
COPY ./target/eventsProject-1.0.0.jar eventsProject-1.0.0.jar
CMD ["java","-jar","eventsProject-1.0.0.jar"]
