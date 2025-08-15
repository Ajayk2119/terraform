resource "local_file" "my_test1" {
  filename = "text1.txt"
  file_permission = 655
  content = "first file via tf"

}