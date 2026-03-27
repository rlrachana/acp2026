#!/usr/bin/env bats

# 1. single match
@test "single matching destination" {
  run ./demo4 <<< "101
Delhi
50
102
Mumbai
40
103
Chennai
30
104
Bangalore
20
Delhi"
  [[ "$output" == *"Flight Number: 101"* ]]
}

# 2. multiple matches
@test "multiple matching destinations" {
  run ./demo4 <<< "101
Delhi
50
102
Delhi
40
103
Chennai
30
104
Delhi
20
Delhi"
  [[ "$output" == *"Flight Number: 101"* ]]
  [[ "$output" == *"Flight Number: 102"* ]]
  [[ "$output" == *"Flight Number: 104"* ]]
}

# 3. no match
@test "no matching destination" {
  run ./demo4 <<< "101
Delhi
50
102
Mumbai
40
103
Chennai
30
104
Bangalore
20
Kolkata"
  [[ "$output" == *"No flight available"* ]]
}

# 4. all flights same destination
@test "all flights same destination" {
  run ./demo4 <<< "101
Delhi
50
102
Delhi
40
103
Delhi
30
104
Delhi
20
Delhi"
  [[ "$output" == *"Flight Number: 101"* ]]
  [[ "$output" == *"Flight Number: 104"* ]]
}

# 5. case sensitivity check
@test "case sensitivity" {
  run ./demo4 <<< "101
Delhi
50
102
Mumbai
40
103
Chennai
30
104
Bangalore
20
delhi"
  [[ "$output" == *"No flight available"* ]]
}

# 6. special characters in destination
@test "special characters" {
  run ./demo4 <<< "101
Delhi1
50
102
Mumbai#
40
103
Chennai@
30
104
Bangalore$
20
Mumbai#"
  [[ "$output" == *"Flight Number: 102"* ]]
}

# 7. numeric destination
@test "numeric destination" {
  run ./demo4 <<< "101
123
50
102
456
40
103
789
30
104
000
20
456"
  [[ "$output" == *"Flight Number: 102"* ]]
}

# 8. large flight numbers
@test "large flight numbers" {
  run ./demo4 <<< "999999
Delhi
50
888888
Mumbai
40
777777
Chennai
30
666666
Bangalore
20
Mumbai"
  [[ "$output" == *"Flight Number: 888888"* ]]
}

# 9. zero seats (still valid)
@test "zero seats" {
  run ./demo4 <<< "101
Delhi
0
102
Mumbai
0
103
Chennai
0
104
Bangalore
0
Chennai"
  [[ "$output" == *"Flight Number: 103"* ]]
}

# 10. repeated search match order
@test "order preservation" {
  run ./demo4 <<< "101
Delhi
50
102
Delhi
40
103
Delhi
30
104
Delhi
20
Delhi"
  [[ "$output" == *"Flight Number: 101"* ]]
  [[ "$output" == *"Flight Number: 102"* ]]
}

# 11. empty-like input (edge case)
@test "empty-like destination" {
  run ./demo4 <<< "101
Delhi
50
102
Mumbai
40
103
Chennai
30
104
Bangalore
20
 "
  [[ "$output" == *"No flight available"* ]]
}