# FROM tomcat:9.0
#
# ADD target/*.war /usr/local/tomcat/webapps/
#
# CMD ["catalina.sh", "run"]

# 1단계: Maven으로 WAR 빌드
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

# Maven 캐시
COPY pom.xml .
RUN mvn -B dependency:go-offline

# 소스 복사
COPY . .

# WAR 파일 생성
RUN mvn -B clean package -DskipTests


# 2단계: Tomcat 10 + Java 17
FROM tomcat:10.1-jdk17-temurin

# 디폴트 ROOT 삭제
RUN rm -rf /usr/local/tomcat/webapps/*

# 빌드 결과 복사
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
