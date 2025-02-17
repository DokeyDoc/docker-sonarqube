ENV_FILE=.ENV_FILE

watch:
	@echo "ENVIRONMENT=dev" > ${ENV_FILE}
	@docker compose up --build --watch

run: 
	@echo "ENVIRONMENT=prod" > ${ENV_FILE}
	@docker compose up --build 