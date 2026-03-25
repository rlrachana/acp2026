@test "n = 1 (single rectangle)" {
  run bash -c "printf '1\n5\n4\n' | ./demo3.exe"
  [[ "$output" == *"Rectangle 1 has the largest area"* ]]
}

@test "n = 2, rectangle 1 larger" {
  run bash -c "printf '2\n6\n6\n2\n2\n' | ./demo3.exe"
  [[ "$output" == *"Rectangle 1 has the largest area"* ]]
}

@test "n = 2, rectangle 2 larger" {
  run bash -c "printf '2\n2\n3\n5\n5\n' | ./demo3.exe"
  [[ "$output" == *"Rectangle 2 has the largest area"* ]]
}

@test "n = 3, middle rectangle largest" {
  run bash -c "printf '3\n2\n2\n10\n10\n3\n3\n' | ./demo3.exe"
  [[ "$output" == *"Rectangle 2 has the largest area"* ]]
}

@test "all rectangles equal" {
  run bash -c "printf '3\n2\n2\n2\n2\n2\n2\n' | ./demo3.exe"
  [[ "$output" == *"Rectangle 1 has the largest area"* ]]
}

@test "zero dimensions" {
  run bash -c "printf '2\n0\n5\n3\n3\n' | ./demo3.exe"
  [[ "$output" == *"Rectangle 2 has the largest area"* ]]
}

@test "negative dimensions" {
  run bash -c "printf '2\n-5\n4\n3\n3\n' | ./demo3.exe"
  [[ "$output" == *"Rectangle 2 has the largest area"* ]]
}

@test "float values" {
  run bash -c "printf '2\n2.5\n3.5\n3.1\n3.1\n' | ./demo3.exe"
  [[ "$output" == *"Rectangle 2 has the largest area"* ]]
}

@test "very large values" {
  run bash -c "printf '2\n1000\n1000\n500\n500\n' | ./demo3.exe"
  [[ "$output" == *"Rectangle 1 has the largest area"* ]]
}

@test "n = 0 (boundary case)" {
  run bash -c "printf '0\n' | ./demo3.exe"
  # No assertion (undefined behavior expected)
}

@test "negative n (boundary case)" {
  run bash -c "printf '-3\n' | ./demo3.exe"
  # No assertion (undefined behavior expected)
}