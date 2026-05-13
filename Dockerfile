FROM eclipse-temurin:21
WORKDIR /app
COPY . /app
RUN javac Hello.java
CMD ["java", "Hello"]
