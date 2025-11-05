# Use OpenJDK runtime
FROM openjdk:21-jdk-slim

# Set OpenTelemetry Java Agent version
ARG OTEL_AGENT_VERSION=1.28.0

# Download the OpenTelemetry Java agent
ADD https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v${OTEL_AGENT_VERSION}/opentelemetry-javaagent.jar /otel-javaagent.jar

# Copy your app jar
COPY target/oopApp-1.0.0.jar /app.jar

# Expose your app port
EXPOSE 38080

# Run the app with the OpenTelemetry agent attached
ENTRYPOINT ["java", "-javaagent:/otel-javaagent.jar", "-jar", "/app.jar"]
