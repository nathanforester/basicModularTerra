output "monday_security_group_id" {
    value = aws_security_group.sgapp.id
}

output "monday_subnet_id" {
    value = aws_subnet.subpublic.id
}