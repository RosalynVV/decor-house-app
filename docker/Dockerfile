FROM eclipse-temurin:17-jdk-jammy

ENV APP_HOME=/decor-house-app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

EXPOSE 8084

COPY target/decor-house-*.jar app.jar

RUN useradd -m appuser && chown -R appuser:appuser $APP_HOME
USER appuser

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:8084/actuator/health || exit 1

ENTRYPOINT ["java", "-jar", "app.jar"]
