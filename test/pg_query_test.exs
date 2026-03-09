defmodule PgQueryTest do
  use ExUnit.Case

  test "parsing of ddl statement" do
    assert {:ok, ast} = PgQuery.parse("create table a (id int8 primary key)")

    assert %PgQuery.ParseResult{
             version: 170_007,
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

  test "error results" do
    query = "select * from something; snot!"

    assert {:error, %{cursorpos: cursorpos, message: _}} =
             PgQuery.parse(query)

    assert binary_part(query, cursorpos, 4) == "snot"
  end

  test "parses and deparses a query" do
    query = "CREATE TABLE a (id int8 PRIMARY KEY)"
    assert {:ok, ast} = PgQuery.parse(query)
    assert {:ok, query2} = PgQuery.protobuf_to_query(ast)
    assert query == query2
  end

  test "parses and deparses a query with bang function" do
    query = "CREATE TABLE a (id int8 PRIMARY KEY)"
    ast = PgQuery.parse!(query)
    query2 = PgQuery.protobuf_to_query!(ast)
    assert query == query2
  end

  test "raises on oversized query" do
    # The NIF rejects queries >= 65536 bytes (MAX_QUERY_SIZE) via enif_make_badarg,
    # which raises ArgumentError rather than crashing the VM.
    small_query = "SELECT '" <> String.duplicate("a", 16 * 1024) <> "'"
    assert {:ok, _} = PgQuery.parse(small_query)

    oversized = "SELECT '" <> String.duplicate("a", 65_536) <> "'"
    assert_raise ArgumentError, fn -> PgQuery.parse(oversized) end
  end

  test "scans a query" do
    query = "SELECT * FROM users WHERE id = 1"
    assert {:ok, scan_result} = PgQuery.scan(query)

    # Basic structure validation
    assert %PgQuery.ScanResult{tokens: tokens} = scan_result
    assert is_list(tokens)
    assert length(tokens) == 8

    # Check some expected tokens
    assert Enum.any?(tokens, fn token ->
             token.token == :SELECT
           end)

    assert Enum.any?(tokens, fn token ->
             token.token == :FROM
           end)
  end
end
