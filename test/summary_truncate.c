#include <pg_query.h>
#include "src/pg_query_summary.h"

#include <stdio.h>
#include <stdlib.h>

#include "test/framework/main.h"

static Summary summary(char *query, int parser_options, int truncate_limit)
{
	PgQuerySummaryParseResultInternal parse_result = pg_query_summary_internal(query, parser_options, truncate_limit);

	if (parse_result.error != NULL)
	{
		printf("  ERROR: %s\n", parse_result.error->message);
		exit(1);
	}

	Summary		summary = parse_result.summary;

	/* We no longer have a use for parts using the system allocator. */
	pg_query_free_summary_parse_result_internal(parse_result);

	return summary;
}

void
it_omits_target_list(TestState * test_state)
{
	TEST_INIT();
	char	   *query = "SELECT a, b, c, d, e, f FROM xyz WHERE a = b";
	Summary		result = summary(query, 0, 40);

	TEST_ASSERT_STR_EQUAL(result.truncated_query, "SELECT ... FROM xyz WHERE a = b");
}

void
it_omits_CTE_definition(TestState * test_state)
{
	TEST_INIT();
	char	   *query = "WITH x AS (SELECT * FROM y) SELECT * FROM x";
	Summary		result = summary(query, 0, 40);

	TEST_ASSERT_STR_EQUAL(result.truncated_query, "WITH x AS (...) SELECT * FROM x");
}

void
it_omits_WHERE_clause(TestState * test_state)
{
	TEST_INIT();
	char	   *query = "SELECT * FROM z WHERE a = b AND x = y";
	Summary		result = summary(query, 0, 30);

	TEST_ASSERT_STR_EQUAL(result.truncated_query, "SELECT * FROM z WHERE ...");
}

void
it_omits_INSERT_field_list(TestState * test_state)
{
	TEST_INIT();
	char	   *query = "INSERT INTO \"x\" (a, b, c, d, e, f) VALUES ($1)";
	Summary		result = summary(query, 0, 32);

	TEST_ASSERT_STR_EQUAL(result.truncated_query, "INSERT INTO x (...) VALUES ($1)");
}

void
it_omits_comments(TestState * test_state)
{
	TEST_INIT();
	char	   *query = "SELECT $1 /* application:test */";
	Summary		result = summary(query, 0, 100);

	TEST_ASSERT_STR_EQUAL(result.truncated_query, "SELECT $1");
}

void
it_falls_back_to_simple_truncation(TestState * test_state)
{
	TEST_INIT();
	char	   *query = "SELECT * FROM t";
	Summary		result = summary(query, 0, 10);

	TEST_ASSERT_STR_EQUAL(result.truncated_query, "SELECT ...");
}

void
it_handles_problematic_cases(TestState * test_state)
{
	TEST_INIT();
	char	   *query = "SELECT CASE WHEN $2.typtype = $1 THEN $2.typtypmod ELSE $1.atttypmod END";
	Summary		result = summary(query, 0, 50);

	TEST_ASSERT_STR_EQUAL(result.truncated_query, "SELECT ...");
}

void
it_omits_UPDATE_target_list(TestState * test_state)
{
	TEST_INIT();
	char	   *query = "UPDATE x SET a = 1, c = 2, e = 'str'";
	Summary		result = summary(query, 0, 30);

	TEST_ASSERT_STR_EQUAL(result.truncated_query, "UPDATE x SET ... = ...");
}

void
it_omits_ON_CONFLICT_target_list(TestState * test_state)
{
	TEST_INIT();
	char	   *query = "INSERT INTO y(a) VALUES(1) ON CONFLICT DO UPDATE SET a = 123456789";
	Summary		result = summary(query, 0, 65);

	TEST_ASSERT_STR_EQUAL(result.truncated_query, "INSERT INTO y (a) VALUES (1) ON CONFLICT DO UPDATE SET ... = ...");
}

void
it_omits_ON_CONFLICT_target_list_2(TestState * test_state)
{
	TEST_INIT();
	char	   *query = "\
        INSERT INTO foo (a, b, c, d) VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29) \
        ON CONFLICT (id) \
        DO UPDATE SET (a, b, c, d) = (excluded.a,excluded.b,excluded.c,case when foo.d = excluded.d then excluded.d end) \
    ";
	Summary		result = summary(query, 0, 100);

	TEST_ASSERT_STR_EQUAL(result.truncated_query, "INSERT INTO foo (a, b, c, d) VALUES (...) ON CONFLICT (id) DO UPDATE SET ... = ...");;
}

void
it_handles_GRANT(TestState * test_state)
{
	TEST_INIT();
	char	   *query = "GRANT SELECT (abc, def, ghj) ON TABLE t1 TO r1";
	Summary		result = summary(query, 0, 35);

	TEST_ASSERT_STR_EQUAL(result.truncated_query, "GRANT select (abc, def, ghj) ON ...");
}

void
it_does_not_segfault_on_target_list_from_CTE_already_removed_from_possible_truncations(TestState * test_state)
{
	TEST_INIT();
	char	   *query = "\
        WITH activity AS ( \
            SELECT pid, COALESCE(a.usename, '') AS usename \
            FROM pganalyze.get_stat_activity() a \
        ) \
        SELECT \
        FROM pganalyze.get_stat_progress_vacuum() v \
        JOIN activity a USING (pid) \
    ";
	Summary		result = summary(query, 0, 100);

	TEST_ASSERT_STR_EQUAL(result.truncated_query, "WITH activity AS (...) SELECT FROM pganalyze.get_stat_progress_vacuum() v JOIN activity a USING (...");;
}

/*  If we truncate the index expression in the future this would remove (lower(d) || upper(d)) first */
void
it_handles_CREATE_INDEX(TestState * test_state)
{
	TEST_INIT();
	char	   *query = "CREATE INDEX testidx ON test USING btree ((lower(d) || upper(d)), a, (b+c))";
	Summary		result = summary(query, 0, 60);

	TEST_ASSERT_STR_EQUAL(result.truncated_query, "CREATE INDEX testidx ON test USING btree ((lower(d) || up...");;
}

void
char_truncate_works(TestState * test_state)
{
	char	   *query = "WITH \"原チコ氏にはす腹腹腹腹腹腹腹腹腹腹腹\" AS (SELECT) SELECT w";
	Summary		result = summary(query, 0, 21);
	char	   *output = "WITH \"原チコ氏にはす腹腹腹腹腹...";

	TEST_ASSERT_STR_EQUAL(result.truncated_query, output);;
}

int
main(int argc, char *argv[])
{
	TestFn	   *tests[] = {
		&it_omits_target_list,
		&it_omits_CTE_definition,
		&it_omits_WHERE_clause,
		&it_omits_INSERT_field_list,
		&it_omits_comments,
		&it_falls_back_to_simple_truncation,
		&it_handles_problematic_cases,
		&it_omits_UPDATE_target_list,
		&it_omits_ON_CONFLICT_target_list,
		&it_omits_ON_CONFLICT_target_list_2,
		&it_handles_GRANT,
		&it_does_not_segfault_on_target_list_from_CTE_already_removed_from_possible_truncations,
		&it_handles_CREATE_INDEX,
		&char_truncate_works,
		NULL
	};

	return test_run_with_mcxt(argc, argv, tests, NULL);
}
