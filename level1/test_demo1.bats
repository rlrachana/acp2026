@test "demo1 runs" {
  run bash -c "echo -e '5\n21 64 87 54 68' | ./demo1.exe"
  [ "$status" -eq 0 ]
}