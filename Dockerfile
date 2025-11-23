# Étape 1 : Build (Maven)
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copier tout le code source
COPY . .

# Compiler et créer le JAR
RUN mvn clean package -DskipTests

# Étape 2 : Runtime (JRE uniquement)
FROM eclipse-temurin:17-jre
WORKDIR /app

# Copier le JAR généré
COPY --from=build /app/target/*.jar app.jar

# Exposer le port (change si ton app utilise un autre port)
EXPOSE 8080

# Commande de lancement
ENTRYPOINT ["java", "-jar", "app.jar"]
