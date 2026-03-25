@test "n = 0 (invalid)" {
  run bash -c "printf '0\n' | ./demo1.exe"
  [[ "$output" == *"Invalid value of n"* ]]
}

@test "n < 0 (invalid)" {
  run bash -c "printf '-5\n' | ./demo1.exe"
  [[ "$output" == *"Invalid value of n"* ]]
}

@test "n = 1 (single element)" {
  run bash -c "printf '1\n42\n' | ./demo1.exe"
  [[ "$output" == *"42.000000"* ]]
}

@test "all elements equal" {
  run bash -c "printf '3\n5\n5\n5\n' | ./demo1.exe"
  [[ "$output" == *"5.000000"* ]]
}

@test "max at first index" {
  run bash -c "printf '4\n9\n2\n3\n1\n' | ./demo1.exe"
  [[ "$output" == *"9.000000 at index 0"* ]]
}

@test "max at last index" {
  run bash -c "printf '4\n1\n2\n3\n9\n' | ./demo1.exe"
  [[ "$output" == *"9.000000 at index 3"* ]]
}

@test "negative numbers" {
  run bash -c "printf '3\n-5\n-2\n-10\n' | ./demo1.exe"
  [[ "$output" == *"-2.000000"* ]]
}

@test "mixed positive and negative" {
  run bash -c "printf '5\n-1\n3\n-2\n10\n0\n' | ./demo1.exe"
  [[ "$output" == *"10.000000 at index 3"* ]]
}

@test "float values" {
  run bash -c "printf '3\n1.5\n2.7\n2.6\n' | ./demo1.exe"
  [[ "$output" == *"2.700000"* ]]
}

@test "large values" {
  run bash -c "printf '3\n10000\n99999\n50000\n' | ./demo1.exe"
  [[ "$output" == *"99999.000000"* ]]
}

@test "max in middle" {
  run bash -c "printf '5\n1\n8\n3\n2\n4\n' | ./demo1.exe"
  [[ "$output" == *"8.000000 at index 1"* ]]
}