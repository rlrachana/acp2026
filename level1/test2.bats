@test "rectangle 1 largest" {
  run bash -c "printf '5\n5\n3\n3\n2\n2\n' | ./demo2.exe"
  [[ "$output" == *"Rectangle 1 has the largest area"* ]]
}

@test "rectangle 2 largest" {
  run bash -c "printf '2\n2\n5\n5\n3\n3\n' | ./demo2.exe"
  [[ "$output" == *"Rectangle 2 has the largest area"* ]]
}

@test "rectangle 3 largest" {
  run bash -c "printf '2\n2\n3\n3\n5\n5\n' | ./demo2.exe"
  [[ "$output" == *"Rectangle 3 has the largest area"* ]]
}

@test "rectangle 1 and 2 equal largest" {
  run bash -c "printf '5\n5\n5\n5\n2\n2\n' | ./demo2.exe"
  [[ "$output" == *"Rectangle 1 and Rectangle 2 have equal"* ]]
}

@test "rectangle 1 and 3 equal largest" {
  run bash -c "printf '5\n5\n2\n2\n5\n5\n' | ./demo2.exe"
  [[ "$output" == *"Rectangle 1 and Rectangle 3 have equal"* ]]
}

@test "rectangle 2 and 3 equal largest" {
  run bash -c "printf '2\n2\n5\n5\n5\n5\n' | ./demo2.exe"
  [[ "$output" == *"Rectangle 2 and Rectangle 3 have equal"* ]]
}

@test "all rectangles equal" {
  run bash -c "printf '4\n4\n4\n4\n4\n4\n' | ./demo2.exe"
  [[ "$output" == *"All rectangles have equal area"* ]]
}

@test "zero area rectangle" {
  run bash -c "printf '0\n5\n2\n2\n3\n3\n' | ./demo2.exe"
  [[ "$output" == *"Rectangle 3 has the largest area"* ]]
}

@test "negative values" {
  run bash -c "printf '-5\n5\n2\n2\n3\n3\n' | ./demo2.exe"
  [[ "$output" == *"Rectangle 3"* ]]
}

@test "float values" {
  run bash -c "printf '2.5\n2\n3.1\n3\n1\n1\n' | ./demo2.exe"
  [[ "$output" == *"Rectangle 2 has the largest area"* ]]
}

@test "very large values" {
  run bash -c "printf '1000\n1000\n500\n500\n200\n200\n' | ./demo2.exe"
  [[ "$output" == *"Rectangle 1 has the largest area"* ]]
}