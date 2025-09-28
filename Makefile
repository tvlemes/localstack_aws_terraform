# Makefile para LocalStack + Terraform

# Subir o docker-compose.yml
up:
	docker compose up -d

# Parar o docker-compose.yml
stop:
	docker compose down

#Logs do docker-compose.yml
logs:
	docker compose logs -f localstack

# Inicializa as configurações do Terraform
init:
	cd s3 && terraform init -reconfigure

# Informa o detalhamento do que será criado na AWS 
plan:
	cd s3 && terraform plan

# Valida o código
validate:
	cd s3 && terraform validate

# Aplica a criação do bucket
apply:
	cd s3 && terraform apply -auto-approve

# Verifica a saída do S3
output:
	cd s3 && terraform output

# Apaga o bucket do S3
destroy:
	cd s3 && terraform destroy -auto-approve