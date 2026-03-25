@test "basic concatenation" {
  run bash -c "printf 'hello\nworld\n' | ./demo8.exe"
  [[ "$output" == *"helloworld"* ]]
}

@test "empty second string" {
  run bash -c "printf 'hello\n\n' | ./demo8.exe"
  [[ "$output" == *"hello"* ]]
}

@test "empty first string" {
  run bash -c "printf '\nworld\n' | ./demo8.exe"
  [[ "$output" == *"world"* ]]
}

@test "both empty" {
  run bash -c "printf '\n\n' | ./demo8.exe"
  [[ "$output" == *""* ]]
}

@test "strings with numbers" {
  run bash -c "printf 'abc123\n456\n' | ./demo8.exe"
  [[ "$output" == *"abc123456"* ]]
}

@test "strings with special characters" {
  run bash -c "printf '@@@\n###\n' | ./demo8.exe"
  [[ "$output" == *"@@@###"* ]]
}

@test "long strings" {
  run bash -c "printf 'aaaaaaaaaa\nbbbbbbbbbb\n' | ./demo8.exe"
  [[ "$output" == *"aaaaaaaaaabbbbbbbbbb"* ]]
}