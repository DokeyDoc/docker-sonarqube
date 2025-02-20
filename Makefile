ENV_FILE=.ENV_FILE

include .env

watch:
	@echo "ENVIRONMENT=dev" > ${ENV_FILE}
	@docker compose up react-app --build --watch

run: 
	@echo "ENVIRONMENT=prod" > ${ENV_FILE}
	@docker compose up react-app -d --build 

sonar:
	@docker compose up sonarqube sonarqube-database

sonar-scan:
	docker run \
	--rm \
	--network="host" \
	-e SONAR_HOST_URL="http://localhost:9000" \
	-e SONAR_TOKEN="$(SONAR_TOKEN)" \
	-v "./:/usr/src" \
	sonarsource/sonar-scanner-cli \
	-Dsonar.projectKey=$(PROJECT_KEY)