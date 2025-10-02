# ======================
# Stage 1 - Build do SPI com Maven
# ======================
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

# Copia apenas arquivos de definição primeiro (cache mais eficiente)
COPY pom.xml .
COPY src ./src

# Faz o build do SPI e gera o .jar em target/
RUN mvn clean package -DskipTests

# ======================
# Stage 2 - Keycloak
# ======================
FROM quay.io/keycloak/keycloak:26.2.4

ENV KC_DB=postgres
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin
ENV KC_THEME_STATIC_MAX_AGE=0
ENV KC_THEME_CACHE_TTL=0
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_LOG_LEVEL=DEBUG

WORKDIR /opt/keycloak

# Copia o .jar do SPI gerado pelo Maven
COPY --from=builder /app/target/*.jar /opt/keycloak/providers/

# Copia seu tema customizado (HTML, FTL, CSS etc.)
COPY themes/uems-login /opt/keycloak/themes/uems-login

# Opcional: força o rebuild do cache do KC
RUN /opt/keycloak/bin/kc.sh build

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]