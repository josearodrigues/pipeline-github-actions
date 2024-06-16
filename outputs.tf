output "vm_aws_ip" {
  description = "IP público da vm criada na AWS"
  value       = aws_instance.vm.public_ip
}

/* output "vm_azure_ip" {
  description = "IP público da vm criada na Azure"
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
} */