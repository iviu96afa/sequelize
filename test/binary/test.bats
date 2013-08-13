#!/usr/bin/env test/binary/bats/bin/bats

@test "no arguments prints usage instructions" {
  run bin/sequelize

  [ $status -eq 0 ]
  [ $(expr "${lines[0]}" : "Using environment 'development'.") -ne 0 ]
  [ $(expr "${lines[1]}" : "Try \"sequelize --help\" for usage information.") -ne 0 ]
}

@test "--help prints the help" {
  run bin/sequelize --help

  [ $status -eq 0 ]
  [ "${lines[0]}" = "  Usage: sequelize [options]" ]
}