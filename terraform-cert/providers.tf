# =============================================================================
# Certificate Renewal module — Providers Configuration
# =============================================================================

terraform {
  required_version = ">= 1.9.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    acme = {
      source  = "vancluever/acme"
      version = "~> 2.23.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-ctmp3-tfstate"
    storage_account_name = "stctmp3tfstate"
    container_name       = "tfstate"
    key                  = "ctmp3.cert.tfstate"
    use_oidc             = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

# The ACME provider configuration pointing to Let's Encrypt production directory
provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}
