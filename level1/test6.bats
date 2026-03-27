#!/usr/bin/env bats

# 1. n = 0 (invalid size)
@test "n = 0 (invalid)" {
  run ./demo6 <<< "0"
  [[ "$output" == *"Invalid"* ]]
}

# 2. negative n
@test "negative n" {
  run ./demo6 <<< "-5"
  [[ "$output" == *"Invalid"* ]]
}

# 3. n = 1 (single element)
@test "n = 1" {
  run ./demo6 <<< "1
10"
  [[ "$output" == *"Element 0:10"* ]]
}

# 4. normal case (small array)
@test "normal case" {
  run ./demo6 <<< "3
1
2
3"
  [[ "$output" == *"Element 0:1"* ]]
  [[ "$output" == *"Element 1:2"* ]]
  [[ "$output" == *"Element 2:3"* ]]
}

# 5. larger array
@test "larger array" {
  run ./demo6 <<< "5
10
20
30
40
50"
  [[ "$output" == *"Element 4:50"* ]]
}

# 6. all zeros
@test "all zeros" {
  run ./demo6 <<< "3
0
0
0"
  [[ "$output" == *"Element 2:0"* ]]
}

# 7. negative values
@test "negative values" {
  run ./demo6 <<< "3
-1
-2
-3"
  [[ "$output" == *"Element 1:-2"* ]]
}

# 8. mixed values
@test "mixed values" {
  run ./demo6 <<< "4
-1
0
5
-10"
  [[ "$output" == *"Element 2:5"* ]]
}

# 9. repeated values
@test "repeated values" {
  run ./demo6 <<< "3
7
7
7"
  [[ "$output" == *"Element 2:7"* ]]
}

# 10. large numbers
@test "large numbers" {
  run ./demo6 <<< "2
100000
200000"
  [[ "$output" == *"Element 1:200000"* ]]
}

# 11. program exit check (no crash)
@test "program runs successfully" {
  run ./demo6 <<< "2
1
2"
  [ "$status" -eq 0 ]
}

# 11. check delete (no crash after free)
@test "delete array check" {
  run bash -c "printf '2\n1\n2\n' | ./demo6"
  [ "$status" -eq 0 ]
}