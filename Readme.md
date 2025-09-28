<p align="center">
  <img src="./docs/logo_localstack.png" alt="LocalStack" height="100"/>
  &nbsp;&nbsp;&nbsp;
  <img src="https://upload.wikimedia.org/wikipedia/commons/9/93/Amazon_Web_Services_Logo.svg" alt="AWS" height="80"/>
  &nbsp;&nbsp;&nbsp;
  <img src="https://www.vectorlogo.zone/logos/terraformio/terraformio-icon.svg" alt="Terraform" height="80"/>
</p>

# 🚀 LocalStack + Terraform - Exemplo com S3</h1>

Este é um exemplo prático de Infraestrutura como código com uso do LocalStack com Terraform para provisionamento local de recursos AWS, incluindo a criação e gerenciamento de buckets S3, com suporte a Docker Compose, Makefile e automação em Python.

[![Python](https://img.shields.io/badge/Python-3.11%2B-blue.svg)](https://www.python.org/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/tvlemes/etl-databricks-connect/blob/main/LICENSE)
[![Status](https://img.shields.io/badge/status-Concluído-green.svg)]()

## 📂 Estrutura do Projeto
```
LocalStack com Terraform/
│
├── s3/ # Configurações Terraform para S3
│ ├── provider.tf # Configuração do provedor AWS apontando para LocalStack
│ ├── terraform.tf # Código para criação do bucket
│ ├── outputs.tf # Saídas do Terraform
│
├── volume/ # Volume persistente do Docker (cache, logs, etc.)
│
├── docker-compose.yml # Configuração do LocalStack
├── requirements.txt # Dependências Python (boto3, awscli)
├── Makefile # Automação de comandos
└── .gitignore
```

---

## ⚙️ Pré-requisitos

 - Docker
 - Terraform
 - Python >= 3.11 

 ---

## ▶️ Passo a Passo
1. Subir o LocalStack
```bash
docker-compose up -d
```

2. Entrar no container (opcional)
```bash
docker exec -it nome_container bash
```

3. Configurar dependências dentro do container, verificar no `docker-compose.yml` onde foi configurado o volume para compartilhar a pasta com o hospedeiro:
```bash
pip install -r requirements.txt
```

4. Inicializar e aplicar Terraform
```bash
terraform init -reconfigure   # inicializa e força reconfiguração
terraform validate            # valida o código
terraform fmt                 # verifica a formatação dos arquivos
terraform plan                # mostra o que será criado
terraform apply -auto-approve # cria os recursos no LocalStack
```

5. Verificar buckets no LocalStack
```bash
awslocal s3 ls
```

---

## 🛠️ Makefile (atalhos)

```bash
make up           # Sobe LocalStack no Docker
make init         # Inicializa Terraform
make apply        # Cria os recursos
make list-buckets # Lista os buckets no LocalStack
make destroy      # Remove os recursos
```

---

## 🐞 Problemas Comuns

* Erro: lookup sts.us-east-1.amazonaws.com: no such host\
✅ Verifique se endpoints.sts está definido e skip_requesting_account_id = true no provider.tf.\
✅ Rode novamente terraform init -reconfigure.\

* Credenciais inválidas → LocalStack aceita qualquer access_key/secret_key (ex: test).

* Porta incorreta → Ajuste http://localhost:4566 (ou a porta definida no docker-compose.yml).

---

## 👨‍💻 Sobre

👤 Autor: Thiago Vilarinho Lemes <br>
🏠 Home: https://thiagolemes.netlify.app/ \
🔗 LinkedIn: <a href="https://www.linkedin.com/in/thiago-v-lemes-b1232727" target="_blank">Thiago Lemes</a><br>
✉️ e-mail:contatothiagolemes@gmail.com | lemes_vilarinho@yahoo.com.br
