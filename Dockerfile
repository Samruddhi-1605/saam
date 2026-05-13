# Use a lightweight JDK image
FROM eclipse-temurin:21-jdk-jammy

# Set the working directory
WORKDIR /app

# Copy the source code into the container
COPY Hello.java .

# Compile the java file
RUN javac Hello.java

# Run the application
CMD ["java", "Hello"]
