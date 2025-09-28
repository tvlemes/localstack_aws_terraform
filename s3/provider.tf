# Para baixar o provider da AWS para o Terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.12.0"
    }
  }
}

# Criando a autenticação na AWS Local
provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  s3_use_path_style           = true # , mas é necessario para encontrar o Docker
  skip_credentials_validation = true # evita que o Terraform tente validar credenciais na AWS real.
  skip_requesting_account_id  = true # evita que o Terraform tente validar credenciais na AWS real.   

  # Criando os serviços da AWS no Docker
  endpoints {
    s3  = "http://localhost:4566" # ⚙️ criando link com S3
    sts = "http://localhost:4566" # 👈 ESSENCIAL
    iam = "http://localhost:4566"
    # adicione outros endpoints que precisar
  }
}