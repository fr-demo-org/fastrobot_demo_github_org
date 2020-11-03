resource "null_resource" "tf_version" {
  provisioner "local-exec" {
    command = "echo hi"
  }
}