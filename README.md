# 🚀 ToggleMaster - Infraestrutura como Código (IaC)

![Terraform](https://img.shields.io/badge/Terraform-IaC-blue)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![EKS](https://img.shields.io/badge/Kubernetes-EKS-blue)
![DevSecOps](https://img.shields.io/badge/Security-DevSecOps-red)
![GitOps](https://img.shields.io/badge/GitOps-ArgoCD-purple)

---

## 📖 Visão Geral

Este repositório contém toda a **infraestrutura como código (IaC)** do projeto ToggleMaster, desenvolvida utilizando **Terraform** para provisionamento automatizado na AWS.

O objetivo deste projeto é implementar uma arquitetura moderna baseada em:

- 🏗️ Infraestrutura como Código (IaC)
- 🔐 DevSecOps
- 🔄 GitOps
- ☁️ Microsserviços em Kubernetes (EKS)

---

## 🎯 Objetivo do Projeto

Este projeto foi desenvolvido como parte do **Tech Challenge – Pós Tech FIAP**, com o objetivo de substituir processos manuais por uma abordagem automatizada e versionada de infraestrutura e deploy.

A solução elimina problemas como:

- Deploy manual com `kubectl apply`
- Exposição de credenciais em arquivos
- Falta de padronização de ambientes
- Dificuldade de replicação de infraestrutura

---

## 🏗️ Arquitetura

A infraestrutura contempla os seguintes componentes:

### 🌐 Networking
- VPC
- Subnets públicas e privadas
- Internet Gateway
- Route Tables

### ☸️ Kubernetes
- Cluster EKS
- Node Groups

### 🗄️ Banco de Dados
- 3 instâncias RDS PostgreSQL
- 1 cluster Redis (ElastiCache)

### 📊 Dados e Mensageria
- DynamoDB (analytics)
- SQS (mensageria)

### 📦 Containers
- 5 repositórios no Amazon ECR

### 📁 Estado Terraform
- Backend remoto em S3 (armazenamento do state)

---

## 🧱 Estrutura do Projeto

```bash
.
├── modules/
│   ├── networking/
│   ├── eks/
│   ├── databases/
│   ├── ecr/
│   ├── sqs/
│   └── dynamodb/
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
└── backend.tf
```

---

## ⚙️ Pré-requisitos

Antes de executar o projeto, você precisa ter instalado:

- Terraform
- AWS CLI
- kubectl (opcional)
- Conta AWS configurada

---

## 🔐 Configuração de Credenciais

Configure suas credenciais AWS:

```bash
aws configure
```

Ou via variáveis de ambiente:

```bash
export AWS_ACCESS_KEY_ID=SEU_ACCESS_KEY
export AWS_SECRET_ACCESS_KEY=SEU_SECRET_KEY
export AWS_DEFAULT_REGION=us-east-1
```

---

## 🚀 Como Executar

### 1. Inicializar o Terraform

```bash
terraform init
```

---

### 2. Validar configuração

```bash
terraform validate
```

---

### 3. Planejar infraestrutura

```bash
terraform plan
```

---

### 4. Provisionar recursos

```bash
terraform apply
```

Confirme digitando:

```bash
yes
```

---

## 🧠 Conceito Importante

> "Se não está no código, não existe."

Toda a infraestrutura deste projeto é versionada e reproduzível, garantindo:

- consistência entre ambientes  
- redução de erros manuais  
- facilidade de manutenção  

---

## 🔄 Integração com GitOps

Este projeto funciona em conjunto com o repositório de GitOps:

👉 https://github.com/wilckg/toggle-master-gitops

Fluxo:

1. Terraform cria infraestrutura  
2. CI gera imagem Docker  
3. GitOps atualiza manifestos  
4. ArgoCD sincroniza automaticamente com o cluster  

---

## 🔐 Segurança

O projeto segue práticas de DevSecOps:

- uso de AWS Secrets Manager  
- isolamento em subnets privadas  
- controle de acesso via IAM  
- pipelines com análise de vulnerabilidades  

---

## ⚠️ Observações

- Evite executar `terraform apply` em ambientes produtivos sem revisão  
- Certifique-se de que o bucket S3 para o state já existe  
- Recursos AWS podem gerar custos  

---

## 💰 Custos

Este projeto utiliza serviços pagos da AWS:

- EKS  
- RDS  
- ElastiCache  
- S3  
- DynamoDB  
- SQS  

Recomenda-se utilizar AWS Calculator para estimativas.

---

## 🧪 Ambientes

O projeto pode ser adaptado para múltiplos ambientes:

- dev  
- staging  
- production  

---

## 👨‍💻 Autor

Wilck Gomes  

---

## 📄 Licença

Este projeto é apenas para fins educacionais (Tech Challenge - Pós Tech FIAP).
