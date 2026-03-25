@test "both empty strings" {
  run bash -c "echo -e '\n\n' | ./demo7.exe"
  [[ "$output" == *"Both strings are equal"* ]]
}

@test "one empty, one non-empty" {
  run bash -c "echo -e '\nhello' | ./demo7.exe"
  [[ "$output" == *"String 2 is lexicographically greater"* ]]
}

@test "same strings" {
  run bash -c "echo -e 'abc\nabc' | ./demo7.exe"
  [[ "$output" == *"Both strings are equal"* ]]
}

@test "string1 greater" {
  run bash -c "echo -e 'zebra\napple' | ./demo7.exe"
  [[ "$output" == *"String 1 is lexicographically greater"* ]]
}

@test "string2 greater" {
  run bash -c "echo -e 'apple\nzebra' | ./demo7.exe"
  [[ "$output" == *"String 2 is lexicographically greater"* ]]
}

@test "case sensitivity" {
  run bash -c "echo -e 'Apple\napple' | ./demo7.exe"
  [[ "$output" == *"String 2 is lexicographically greater"* ]]
}

@test "strings with spaces" {
  run bash -c "echo -e 'hello world\nhello world' | ./demo7.exe"
  [[ "$output" == *"Both strings are equal"* ]]
}

@test "leading space vs no space" {
  run bash -c "echo -e ' apple\napple' | ./demo7.exe"
  [[ "$output" == *"String 2 is lexicographically greater"* ]]
}

@test "numbers in strings" {
  run bash -c "echo -e '123\n45' | ./demo7.exe"
  [[ "$output" == *"String 2 is lexicographically greater"* ]]
}

@test "special characters" {
  run bash -c "echo -e '@abc\n#abc' | ./demo7.exe"
  [[ "$output" == *"String 1 is lexicographically greater"* ]]
}

@test "long strings" {
  run bash -c "echo -e 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' | ./demo7.exe"
  [[ "$output" == *"Both strings are equal"* ]]
}