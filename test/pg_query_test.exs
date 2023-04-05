defmodule PgQueryTest do
  use ExUnit.Case

  test "parsing of ddl statement" do
    assert {:ok, ast} = PgQuery.parse("create table a (id int8 primary key)")

    assert %PgQuery.ParseResult{
             version: 150_001,
             stmts: [
               %PgQuery.RawStmt{
                 stmt: %PgQuery.Node{
                   node:
                     {:create_stmt,
                      %PgQuery.CreateStmt{
                        relation: %PgQuery.RangeVar{
                          schemaname: "",
                          relname: "a",
                          location: 13
                        }
                      }}
                 }
               }
             ]
           } = ast
  end
end
