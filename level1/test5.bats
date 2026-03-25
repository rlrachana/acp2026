@test "n = 1 (single element swap)" {
  run bash -c "printf '1\n5\n10\n' | ./demo5.exe"
  [[ "$output" == *"Array1:10"* ]]
  [[ "$output" == *"Array2:5"* ]]
}

@test "n = 3 normal case" {
  run bash -c "printf '3\n1\n2\n3\n4\n5\n6\n' | ./demo5.exe"
  [[ "$output" == *"Array1:4 5 6"* ]]
  [[ "$output" == *"Array2:1 2 3"* ]]
}

@test "arrays already same" {
  run bash -c "printf '3\n1\n1\n1\n1\n1\n1\n' | ./demo5.exe"
  [[ "$output" == *"Array1:1 1 1"* ]]
  [[ "$output" == *"Array2:1 1 1"* ]]
}

@test "negative numbers" {
  run bash -c "printf '3\n-1\n-2\n-3\n4\n5\n6\n' | ./demo5.exe"
  [[ "$output" == *"Array1:4 5 6"* ]]
  [[ "$output" == *"Array2:-1 -2 -3"* ]]
}

@test "mixed positive and negative" {
  run bash -c "printf '3\n-1\n2\n-3\n7\n-8\n9\n' | ./demo5.exe"
  [[ "$output" == *"Array1:7 -8 9"* ]]
  [[ "$output" == *"Array2:-1 2 -3"* ]]
}

@test "all zeros" {
  run bash -c "printf '3\n0\n0\n0\n0\n0\n0\n' | ./demo5.exe"
  [[ "$output" == *"Array1:0 0 0"* ]]
  [[ "$output" == *"Array2:0 0 0"* ]]
}

@test "large numbers" {
  run bash -c "printf '3\n1000\n2000\n3000\n4000\n5000\n6000\n' | ./demo5.exe"
  [[ "$output" == *"Array1:4000 5000 6000"* ]]
  [[ "$output" == *"Array2:1000 2000 3000"* ]]
}

@test "n = 0 (boundary case)" {
  run bash -c "printf '0\n' | ./demo5.exe"
  # may behave undefined (important boundary)
}

@test "negative n (boundary case)" {
  run bash -c "printf '-3\n' | ./demo5.exe"
  # undefined behavior
}

@test "large n small values" {
  run bash -c "printf '5\n1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n' | ./demo5.exe"
  [[ "$output" == *"Array1:6 7 8 9 10"* ]]
  [[ "$output" == *"Array2:1 2 3 4 5"* ]]
}