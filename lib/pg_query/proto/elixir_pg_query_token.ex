# credo:disable-for-this-file
defmodule PgQuery.Token do
  @moduledoc false
  (
    defstruct []

    (
      @spec default() :: :NUL
      def default() do
        :NUL
      end
    )

    @spec encode(atom() | String.t()) :: integer() | atom()
    [
      (
        def encode(:NUL) do
          0
        end

        def encode("NUL") do
          0
        end
      ),
      (
        def encode(:ASCII_36) do
          36
        end

        def encode("ASCII_36") do
          36
        end
      ),
      (
        def encode(:ASCII_37) do
          37
        end

        def encode("ASCII_37") do
          37
        end
      ),
      (
        def encode(:ASCII_40) do
          40
        end

        def encode("ASCII_40") do
          40
        end
      ),
      (
        def encode(:ASCII_41) do
          41
        end

        def encode("ASCII_41") do
          41
        end
      ),
      (
        def encode(:ASCII_42) do
          42
        end

        def encode("ASCII_42") do
          42
        end
      ),
      (
        def encode(:ASCII_43) do
          43
        end

        def encode("ASCII_43") do
          43
        end
      ),
      (
        def encode(:ASCII_44) do
          44
        end

        def encode("ASCII_44") do
          44
        end
      ),
      (
        def encode(:ASCII_45) do
          45
        end

        def encode("ASCII_45") do
          45
        end
      ),
      (
        def encode(:ASCII_46) do
          46
        end

        def encode("ASCII_46") do
          46
        end
      ),
      (
        def encode(:ASCII_47) do
          47
        end

        def encode("ASCII_47") do
          47
        end
      ),
      (
        def encode(:ASCII_58) do
          58
        end

        def encode("ASCII_58") do
          58
        end
      ),
      (
        def encode(:ASCII_59) do
          59
        end

        def encode("ASCII_59") do
          59
        end
      ),
      (
        def encode(:ASCII_60) do
          60
        end

        def encode("ASCII_60") do
          60
        end
      ),
      (
        def encode(:ASCII_61) do
          61
        end

        def encode("ASCII_61") do
          61
        end
      ),
      (
        def encode(:ASCII_62) do
          62
        end

        def encode("ASCII_62") do
          62
        end
      ),
      (
        def encode(:ASCII_63) do
          63
        end

        def encode("ASCII_63") do
          63
        end
      ),
      (
        def encode(:ASCII_91) do
          91
        end

        def encode("ASCII_91") do
          91
        end
      ),
      (
        def encode(:ASCII_92) do
          92
        end

        def encode("ASCII_92") do
          92
        end
      ),
      (
        def encode(:ASCII_93) do
          93
        end

        def encode("ASCII_93") do
          93
        end
      ),
      (
        def encode(:ASCII_94) do
          94
        end

        def encode("ASCII_94") do
          94
        end
      ),
      (
        def encode(:IDENT) do
          258
        end

        def encode("IDENT") do
          258
        end
      ),
      (
        def encode(:UIDENT) do
          259
        end

        def encode("UIDENT") do
          259
        end
      ),
      (
        def encode(:FCONST) do
          260
        end

        def encode("FCONST") do
          260
        end
      ),
      (
        def encode(:SCONST) do
          261
        end

        def encode("SCONST") do
          261
        end
      ),
      (
        def encode(:USCONST) do
          262
        end

        def encode("USCONST") do
          262
        end
      ),
      (
        def encode(:BCONST) do
          263
        end

        def encode("BCONST") do
          263
        end
      ),
      (
        def encode(:XCONST) do
          264
        end

        def encode("XCONST") do
          264
        end
      ),
      (
        def encode(:Op) do
          265
        end

        def encode("Op") do
          265
        end
      ),
      (
        def encode(:ICONST) do
          266
        end

        def encode("ICONST") do
          266
        end
      ),
      (
        def encode(:PARAM) do
          267
        end

        def encode("PARAM") do
          267
        end
      ),
      (
        def encode(:TYPECAST) do
          268
        end

        def encode("TYPECAST") do
          268
        end
      ),
      (
        def encode(:DOT_DOT) do
          269
        end

        def encode("DOT_DOT") do
          269
        end
      ),
      (
        def encode(:COLON_EQUALS) do
          270
        end

        def encode("COLON_EQUALS") do
          270
        end
      ),
      (
        def encode(:EQUALS_GREATER) do
          271
        end

        def encode("EQUALS_GREATER") do
          271
        end
      ),
      (
        def encode(:LESS_EQUALS) do
          272
        end

        def encode("LESS_EQUALS") do
          272
        end
      ),
      (
        def encode(:GREATER_EQUALS) do
          273
        end

        def encode("GREATER_EQUALS") do
          273
        end
      ),
      (
        def encode(:NOT_EQUALS) do
          274
        end

        def encode("NOT_EQUALS") do
          274
        end
      ),
      (
        def encode(:SQL_COMMENT) do
          275
        end

        def encode("SQL_COMMENT") do
          275
        end
      ),
      (
        def encode(:C_COMMENT) do
          276
        end

        def encode("C_COMMENT") do
          276
        end
      ),
      (
        def encode(:ABORT_P) do
          277
        end

        def encode("ABORT_P") do
          277
        end
      ),
      (
        def encode(:ABSENT) do
          278
        end

        def encode("ABSENT") do
          278
        end
      ),
      (
        def encode(:ABSOLUTE_P) do
          279
        end

        def encode("ABSOLUTE_P") do
          279
        end
      ),
      (
        def encode(:ACCESS) do
          280
        end

        def encode("ACCESS") do
          280
        end
      ),
      (
        def encode(:ACTION) do
          281
        end

        def encode("ACTION") do
          281
        end
      ),
      (
        def encode(:ADD_P) do
          282
        end

        def encode("ADD_P") do
          282
        end
      ),
      (
        def encode(:ADMIN) do
          283
        end

        def encode("ADMIN") do
          283
        end
      ),
      (
        def encode(:AFTER) do
          284
        end

        def encode("AFTER") do
          284
        end
      ),
      (
        def encode(:AGGREGATE) do
          285
        end

        def encode("AGGREGATE") do
          285
        end
      ),
      (
        def encode(:ALL) do
          286
        end

        def encode("ALL") do
          286
        end
      ),
      (
        def encode(:ALSO) do
          287
        end

        def encode("ALSO") do
          287
        end
      ),
      (
        def encode(:ALTER) do
          288
        end

        def encode("ALTER") do
          288
        end
      ),
      (
        def encode(:ALWAYS) do
          289
        end

        def encode("ALWAYS") do
          289
        end
      ),
      (
        def encode(:ANALYSE) do
          290
        end

        def encode("ANALYSE") do
          290
        end
      ),
      (
        def encode(:ANALYZE) do
          291
        end

        def encode("ANALYZE") do
          291
        end
      ),
      (
        def encode(:AND) do
          292
        end

        def encode("AND") do
          292
        end
      ),
      (
        def encode(:ANY) do
          293
        end

        def encode("ANY") do
          293
        end
      ),
      (
        def encode(:ARRAY) do
          294
        end

        def encode("ARRAY") do
          294
        end
      ),
      (
        def encode(:AS) do
          295
        end

        def encode("AS") do
          295
        end
      ),
      (
        def encode(:ASC) do
          296
        end

        def encode("ASC") do
          296
        end
      ),
      (
        def encode(:ASENSITIVE) do
          297
        end

        def encode("ASENSITIVE") do
          297
        end
      ),
      (
        def encode(:ASSERTION) do
          298
        end

        def encode("ASSERTION") do
          298
        end
      ),
      (
        def encode(:ASSIGNMENT) do
          299
        end

        def encode("ASSIGNMENT") do
          299
        end
      ),
      (
        def encode(:ASYMMETRIC) do
          300
        end

        def encode("ASYMMETRIC") do
          300
        end
      ),
      (
        def encode(:ATOMIC) do
          301
        end

        def encode("ATOMIC") do
          301
        end
      ),
      (
        def encode(:AT) do
          302
        end

        def encode("AT") do
          302
        end
      ),
      (
        def encode(:ATTACH) do
          303
        end

        def encode("ATTACH") do
          303
        end
      ),
      (
        def encode(:ATTRIBUTE) do
          304
        end

        def encode("ATTRIBUTE") do
          304
        end
      ),
      (
        def encode(:AUTHORIZATION) do
          305
        end

        def encode("AUTHORIZATION") do
          305
        end
      ),
      (
        def encode(:BACKWARD) do
          306
        end

        def encode("BACKWARD") do
          306
        end
      ),
      (
        def encode(:BEFORE) do
          307
        end

        def encode("BEFORE") do
          307
        end
      ),
      (
        def encode(:BEGIN_P) do
          308
        end

        def encode("BEGIN_P") do
          308
        end
      ),
      (
        def encode(:BETWEEN) do
          309
        end

        def encode("BETWEEN") do
          309
        end
      ),
      (
        def encode(:BIGINT) do
          310
        end

        def encode("BIGINT") do
          310
        end
      ),
      (
        def encode(:BINARY) do
          311
        end

        def encode("BINARY") do
          311
        end
      ),
      (
        def encode(:BIT) do
          312
        end

        def encode("BIT") do
          312
        end
      ),
      (
        def encode(:BOOLEAN_P) do
          313
        end

        def encode("BOOLEAN_P") do
          313
        end
      ),
      (
        def encode(:BOTH) do
          314
        end

        def encode("BOTH") do
          314
        end
      ),
      (
        def encode(:BREADTH) do
          315
        end

        def encode("BREADTH") do
          315
        end
      ),
      (
        def encode(:BY) do
          316
        end

        def encode("BY") do
          316
        end
      ),
      (
        def encode(:CACHE) do
          317
        end

        def encode("CACHE") do
          317
        end
      ),
      (
        def encode(:CALL) do
          318
        end

        def encode("CALL") do
          318
        end
      ),
      (
        def encode(:CALLED) do
          319
        end

        def encode("CALLED") do
          319
        end
      ),
      (
        def encode(:CASCADE) do
          320
        end

        def encode("CASCADE") do
          320
        end
      ),
      (
        def encode(:CASCADED) do
          321
        end

        def encode("CASCADED") do
          321
        end
      ),
      (
        def encode(:CASE) do
          322
        end

        def encode("CASE") do
          322
        end
      ),
      (
        def encode(:CAST) do
          323
        end

        def encode("CAST") do
          323
        end
      ),
      (
        def encode(:CATALOG_P) do
          324
        end

        def encode("CATALOG_P") do
          324
        end
      ),
      (
        def encode(:CHAIN) do
          325
        end

        def encode("CHAIN") do
          325
        end
      ),
      (
        def encode(:CHAR_P) do
          326
        end

        def encode("CHAR_P") do
          326
        end
      ),
      (
        def encode(:CHARACTER) do
          327
        end

        def encode("CHARACTER") do
          327
        end
      ),
      (
        def encode(:CHARACTERISTICS) do
          328
        end

        def encode("CHARACTERISTICS") do
          328
        end
      ),
      (
        def encode(:CHECK) do
          329
        end

        def encode("CHECK") do
          329
        end
      ),
      (
        def encode(:CHECKPOINT) do
          330
        end

        def encode("CHECKPOINT") do
          330
        end
      ),
      (
        def encode(:CLASS) do
          331
        end

        def encode("CLASS") do
          331
        end
      ),
      (
        def encode(:CLOSE) do
          332
        end

        def encode("CLOSE") do
          332
        end
      ),
      (
        def encode(:CLUSTER) do
          333
        end

        def encode("CLUSTER") do
          333
        end
      ),
      (
        def encode(:COALESCE) do
          334
        end

        def encode("COALESCE") do
          334
        end
      ),
      (
        def encode(:COLLATE) do
          335
        end

        def encode("COLLATE") do
          335
        end
      ),
      (
        def encode(:COLLATION) do
          336
        end

        def encode("COLLATION") do
          336
        end
      ),
      (
        def encode(:COLUMN) do
          337
        end

        def encode("COLUMN") do
          337
        end
      ),
      (
        def encode(:COLUMNS) do
          338
        end

        def encode("COLUMNS") do
          338
        end
      ),
      (
        def encode(:COMMENT) do
          339
        end

        def encode("COMMENT") do
          339
        end
      ),
      (
        def encode(:COMMENTS) do
          340
        end

        def encode("COMMENTS") do
          340
        end
      ),
      (
        def encode(:COMMIT) do
          341
        end

        def encode("COMMIT") do
          341
        end
      ),
      (
        def encode(:COMMITTED) do
          342
        end

        def encode("COMMITTED") do
          342
        end
      ),
      (
        def encode(:COMPRESSION) do
          343
        end

        def encode("COMPRESSION") do
          343
        end
      ),
      (
        def encode(:CONCURRENTLY) do
          344
        end

        def encode("CONCURRENTLY") do
          344
        end
      ),
      (
        def encode(:CONDITIONAL) do
          345
        end

        def encode("CONDITIONAL") do
          345
        end
      ),
      (
        def encode(:CONFIGURATION) do
          346
        end

        def encode("CONFIGURATION") do
          346
        end
      ),
      (
        def encode(:CONFLICT) do
          347
        end

        def encode("CONFLICT") do
          347
        end
      ),
      (
        def encode(:CONNECTION) do
          348
        end

        def encode("CONNECTION") do
          348
        end
      ),
      (
        def encode(:CONSTRAINT) do
          349
        end

        def encode("CONSTRAINT") do
          349
        end
      ),
      (
        def encode(:CONSTRAINTS) do
          350
        end

        def encode("CONSTRAINTS") do
          350
        end
      ),
      (
        def encode(:CONTENT_P) do
          351
        end

        def encode("CONTENT_P") do
          351
        end
      ),
      (
        def encode(:CONTINUE_P) do
          352
        end

        def encode("CONTINUE_P") do
          352
        end
      ),
      (
        def encode(:CONVERSION_P) do
          353
        end

        def encode("CONVERSION_P") do
          353
        end
      ),
      (
        def encode(:COPY) do
          354
        end

        def encode("COPY") do
          354
        end
      ),
      (
        def encode(:COST) do
          355
        end

        def encode("COST") do
          355
        end
      ),
      (
        def encode(:CREATE) do
          356
        end

        def encode("CREATE") do
          356
        end
      ),
      (
        def encode(:CROSS) do
          357
        end

        def encode("CROSS") do
          357
        end
      ),
      (
        def encode(:CSV) do
          358
        end

        def encode("CSV") do
          358
        end
      ),
      (
        def encode(:CUBE) do
          359
        end

        def encode("CUBE") do
          359
        end
      ),
      (
        def encode(:CURRENT_P) do
          360
        end

        def encode("CURRENT_P") do
          360
        end
      ),
      (
        def encode(:CURRENT_CATALOG) do
          361
        end

        def encode("CURRENT_CATALOG") do
          361
        end
      ),
      (
        def encode(:CURRENT_DATE) do
          362
        end

        def encode("CURRENT_DATE") do
          362
        end
      ),
      (
        def encode(:CURRENT_ROLE) do
          363
        end

        def encode("CURRENT_ROLE") do
          363
        end
      ),
      (
        def encode(:CURRENT_SCHEMA) do
          364
        end

        def encode("CURRENT_SCHEMA") do
          364
        end
      ),
      (
        def encode(:CURRENT_TIME) do
          365
        end

        def encode("CURRENT_TIME") do
          365
        end
      ),
      (
        def encode(:CURRENT_TIMESTAMP) do
          366
        end

        def encode("CURRENT_TIMESTAMP") do
          366
        end
      ),
      (
        def encode(:CURRENT_USER) do
          367
        end

        def encode("CURRENT_USER") do
          367
        end
      ),
      (
        def encode(:CURSOR) do
          368
        end

        def encode("CURSOR") do
          368
        end
      ),
      (
        def encode(:CYCLE) do
          369
        end

        def encode("CYCLE") do
          369
        end
      ),
      (
        def encode(:DATA_P) do
          370
        end

        def encode("DATA_P") do
          370
        end
      ),
      (
        def encode(:DATABASE) do
          371
        end

        def encode("DATABASE") do
          371
        end
      ),
      (
        def encode(:DAY_P) do
          372
        end

        def encode("DAY_P") do
          372
        end
      ),
      (
        def encode(:DEALLOCATE) do
          373
        end

        def encode("DEALLOCATE") do
          373
        end
      ),
      (
        def encode(:DEC) do
          374
        end

        def encode("DEC") do
          374
        end
      ),
      (
        def encode(:DECIMAL_P) do
          375
        end

        def encode("DECIMAL_P") do
          375
        end
      ),
      (
        def encode(:DECLARE) do
          376
        end

        def encode("DECLARE") do
          376
        end
      ),
      (
        def encode(:DEFAULT) do
          377
        end

        def encode("DEFAULT") do
          377
        end
      ),
      (
        def encode(:DEFAULTS) do
          378
        end

        def encode("DEFAULTS") do
          378
        end
      ),
      (
        def encode(:DEFERRABLE) do
          379
        end

        def encode("DEFERRABLE") do
          379
        end
      ),
      (
        def encode(:DEFERRED) do
          380
        end

        def encode("DEFERRED") do
          380
        end
      ),
      (
        def encode(:DEFINER) do
          381
        end

        def encode("DEFINER") do
          381
        end
      ),
      (
        def encode(:DELETE_P) do
          382
        end

        def encode("DELETE_P") do
          382
        end
      ),
      (
        def encode(:DELIMITER) do
          383
        end

        def encode("DELIMITER") do
          383
        end
      ),
      (
        def encode(:DELIMITERS) do
          384
        end

        def encode("DELIMITERS") do
          384
        end
      ),
      (
        def encode(:DEPENDS) do
          385
        end

        def encode("DEPENDS") do
          385
        end
      ),
      (
        def encode(:DEPTH) do
          386
        end

        def encode("DEPTH") do
          386
        end
      ),
      (
        def encode(:DESC) do
          387
        end

        def encode("DESC") do
          387
        end
      ),
      (
        def encode(:DETACH) do
          388
        end

        def encode("DETACH") do
          388
        end
      ),
      (
        def encode(:DICTIONARY) do
          389
        end

        def encode("DICTIONARY") do
          389
        end
      ),
      (
        def encode(:DISABLE_P) do
          390
        end

        def encode("DISABLE_P") do
          390
        end
      ),
      (
        def encode(:DISCARD) do
          391
        end

        def encode("DISCARD") do
          391
        end
      ),
      (
        def encode(:DISTINCT) do
          392
        end

        def encode("DISTINCT") do
          392
        end
      ),
      (
        def encode(:DO) do
          393
        end

        def encode("DO") do
          393
        end
      ),
      (
        def encode(:DOCUMENT_P) do
          394
        end

        def encode("DOCUMENT_P") do
          394
        end
      ),
      (
        def encode(:DOMAIN_P) do
          395
        end

        def encode("DOMAIN_P") do
          395
        end
      ),
      (
        def encode(:DOUBLE_P) do
          396
        end

        def encode("DOUBLE_P") do
          396
        end
      ),
      (
        def encode(:DROP) do
          397
        end

        def encode("DROP") do
          397
        end
      ),
      (
        def encode(:EACH) do
          398
        end

        def encode("EACH") do
          398
        end
      ),
      (
        def encode(:ELSE) do
          399
        end

        def encode("ELSE") do
          399
        end
      ),
      (
        def encode(:EMPTY_P) do
          400
        end

        def encode("EMPTY_P") do
          400
        end
      ),
      (
        def encode(:ENABLE_P) do
          401
        end

        def encode("ENABLE_P") do
          401
        end
      ),
      (
        def encode(:ENCODING) do
          402
        end

        def encode("ENCODING") do
          402
        end
      ),
      (
        def encode(:ENCRYPTED) do
          403
        end

        def encode("ENCRYPTED") do
          403
        end
      ),
      (
        def encode(:END_P) do
          404
        end

        def encode("END_P") do
          404
        end
      ),
      (
        def encode(:ENUM_P) do
          405
        end

        def encode("ENUM_P") do
          405
        end
      ),
      (
        def encode(:ERROR_P) do
          406
        end

        def encode("ERROR_P") do
          406
        end
      ),
      (
        def encode(:ESCAPE) do
          407
        end

        def encode("ESCAPE") do
          407
        end
      ),
      (
        def encode(:EVENT) do
          408
        end

        def encode("EVENT") do
          408
        end
      ),
      (
        def encode(:EXCEPT) do
          409
        end

        def encode("EXCEPT") do
          409
        end
      ),
      (
        def encode(:EXCLUDE) do
          410
        end

        def encode("EXCLUDE") do
          410
        end
      ),
      (
        def encode(:EXCLUDING) do
          411
        end

        def encode("EXCLUDING") do
          411
        end
      ),
      (
        def encode(:EXCLUSIVE) do
          412
        end

        def encode("EXCLUSIVE") do
          412
        end
      ),
      (
        def encode(:EXECUTE) do
          413
        end

        def encode("EXECUTE") do
          413
        end
      ),
      (
        def encode(:EXISTS) do
          414
        end

        def encode("EXISTS") do
          414
        end
      ),
      (
        def encode(:EXPLAIN) do
          415
        end

        def encode("EXPLAIN") do
          415
        end
      ),
      (
        def encode(:EXPRESSION) do
          416
        end

        def encode("EXPRESSION") do
          416
        end
      ),
      (
        def encode(:EXTENSION) do
          417
        end

        def encode("EXTENSION") do
          417
        end
      ),
      (
        def encode(:EXTERNAL) do
          418
        end

        def encode("EXTERNAL") do
          418
        end
      ),
      (
        def encode(:EXTRACT) do
          419
        end

        def encode("EXTRACT") do
          419
        end
      ),
      (
        def encode(:FALSE_P) do
          420
        end

        def encode("FALSE_P") do
          420
        end
      ),
      (
        def encode(:FAMILY) do
          421
        end

        def encode("FAMILY") do
          421
        end
      ),
      (
        def encode(:FETCH) do
          422
        end

        def encode("FETCH") do
          422
        end
      ),
      (
        def encode(:FILTER) do
          423
        end

        def encode("FILTER") do
          423
        end
      ),
      (
        def encode(:FINALIZE) do
          424
        end

        def encode("FINALIZE") do
          424
        end
      ),
      (
        def encode(:FIRST_P) do
          425
        end

        def encode("FIRST_P") do
          425
        end
      ),
      (
        def encode(:FLOAT_P) do
          426
        end

        def encode("FLOAT_P") do
          426
        end
      ),
      (
        def encode(:FOLLOWING) do
          427
        end

        def encode("FOLLOWING") do
          427
        end
      ),
      (
        def encode(:FOR) do
          428
        end

        def encode("FOR") do
          428
        end
      ),
      (
        def encode(:FORCE) do
          429
        end

        def encode("FORCE") do
          429
        end
      ),
      (
        def encode(:FOREIGN) do
          430
        end

        def encode("FOREIGN") do
          430
        end
      ),
      (
        def encode(:FORMAT) do
          431
        end

        def encode("FORMAT") do
          431
        end
      ),
      (
        def encode(:FORWARD) do
          432
        end

        def encode("FORWARD") do
          432
        end
      ),
      (
        def encode(:FREEZE) do
          433
        end

        def encode("FREEZE") do
          433
        end
      ),
      (
        def encode(:FROM) do
          434
        end

        def encode("FROM") do
          434
        end
      ),
      (
        def encode(:FULL) do
          435
        end

        def encode("FULL") do
          435
        end
      ),
      (
        def encode(:FUNCTION) do
          436
        end

        def encode("FUNCTION") do
          436
        end
      ),
      (
        def encode(:FUNCTIONS) do
          437
        end

        def encode("FUNCTIONS") do
          437
        end
      ),
      (
        def encode(:GENERATED) do
          438
        end

        def encode("GENERATED") do
          438
        end
      ),
      (
        def encode(:GLOBAL) do
          439
        end

        def encode("GLOBAL") do
          439
        end
      ),
      (
        def encode(:GRANT) do
          440
        end

        def encode("GRANT") do
          440
        end
      ),
      (
        def encode(:GRANTED) do
          441
        end

        def encode("GRANTED") do
          441
        end
      ),
      (
        def encode(:GREATEST) do
          442
        end

        def encode("GREATEST") do
          442
        end
      ),
      (
        def encode(:GROUP_P) do
          443
        end

        def encode("GROUP_P") do
          443
        end
      ),
      (
        def encode(:GROUPING) do
          444
        end

        def encode("GROUPING") do
          444
        end
      ),
      (
        def encode(:GROUPS) do
          445
        end

        def encode("GROUPS") do
          445
        end
      ),
      (
        def encode(:HANDLER) do
          446
        end

        def encode("HANDLER") do
          446
        end
      ),
      (
        def encode(:HAVING) do
          447
        end

        def encode("HAVING") do
          447
        end
      ),
      (
        def encode(:HEADER_P) do
          448
        end

        def encode("HEADER_P") do
          448
        end
      ),
      (
        def encode(:HOLD) do
          449
        end

        def encode("HOLD") do
          449
        end
      ),
      (
        def encode(:HOUR_P) do
          450
        end

        def encode("HOUR_P") do
          450
        end
      ),
      (
        def encode(:IDENTITY_P) do
          451
        end

        def encode("IDENTITY_P") do
          451
        end
      ),
      (
        def encode(:IF_P) do
          452
        end

        def encode("IF_P") do
          452
        end
      ),
      (
        def encode(:ILIKE) do
          453
        end

        def encode("ILIKE") do
          453
        end
      ),
      (
        def encode(:IMMEDIATE) do
          454
        end

        def encode("IMMEDIATE") do
          454
        end
      ),
      (
        def encode(:IMMUTABLE) do
          455
        end

        def encode("IMMUTABLE") do
          455
        end
      ),
      (
        def encode(:IMPLICIT_P) do
          456
        end

        def encode("IMPLICIT_P") do
          456
        end
      ),
      (
        def encode(:IMPORT_P) do
          457
        end

        def encode("IMPORT_P") do
          457
        end
      ),
      (
        def encode(:IN_P) do
          458
        end

        def encode("IN_P") do
          458
        end
      ),
      (
        def encode(:INCLUDE) do
          459
        end

        def encode("INCLUDE") do
          459
        end
      ),
      (
        def encode(:INCLUDING) do
          460
        end

        def encode("INCLUDING") do
          460
        end
      ),
      (
        def encode(:INCREMENT) do
          461
        end

        def encode("INCREMENT") do
          461
        end
      ),
      (
        def encode(:INDENT) do
          462
        end

        def encode("INDENT") do
          462
        end
      ),
      (
        def encode(:INDEX) do
          463
        end

        def encode("INDEX") do
          463
        end
      ),
      (
        def encode(:INDEXES) do
          464
        end

        def encode("INDEXES") do
          464
        end
      ),
      (
        def encode(:INHERIT) do
          465
        end

        def encode("INHERIT") do
          465
        end
      ),
      (
        def encode(:INHERITS) do
          466
        end

        def encode("INHERITS") do
          466
        end
      ),
      (
        def encode(:INITIALLY) do
          467
        end

        def encode("INITIALLY") do
          467
        end
      ),
      (
        def encode(:INLINE_P) do
          468
        end

        def encode("INLINE_P") do
          468
        end
      ),
      (
        def encode(:INNER_P) do
          469
        end

        def encode("INNER_P") do
          469
        end
      ),
      (
        def encode(:INOUT) do
          470
        end

        def encode("INOUT") do
          470
        end
      ),
      (
        def encode(:INPUT_P) do
          471
        end

        def encode("INPUT_P") do
          471
        end
      ),
      (
        def encode(:INSENSITIVE) do
          472
        end

        def encode("INSENSITIVE") do
          472
        end
      ),
      (
        def encode(:INSERT) do
          473
        end

        def encode("INSERT") do
          473
        end
      ),
      (
        def encode(:INSTEAD) do
          474
        end

        def encode("INSTEAD") do
          474
        end
      ),
      (
        def encode(:INT_P) do
          475
        end

        def encode("INT_P") do
          475
        end
      ),
      (
        def encode(:INTEGER) do
          476
        end

        def encode("INTEGER") do
          476
        end
      ),
      (
        def encode(:INTERSECT) do
          477
        end

        def encode("INTERSECT") do
          477
        end
      ),
      (
        def encode(:INTERVAL) do
          478
        end

        def encode("INTERVAL") do
          478
        end
      ),
      (
        def encode(:INTO) do
          479
        end

        def encode("INTO") do
          479
        end
      ),
      (
        def encode(:INVOKER) do
          480
        end

        def encode("INVOKER") do
          480
        end
      ),
      (
        def encode(:IS) do
          481
        end

        def encode("IS") do
          481
        end
      ),
      (
        def encode(:ISNULL) do
          482
        end

        def encode("ISNULL") do
          482
        end
      ),
      (
        def encode(:ISOLATION) do
          483
        end

        def encode("ISOLATION") do
          483
        end
      ),
      (
        def encode(:JOIN) do
          484
        end

        def encode("JOIN") do
          484
        end
      ),
      (
        def encode(:JSON) do
          485
        end

        def encode("JSON") do
          485
        end
      ),
      (
        def encode(:JSON_ARRAY) do
          486
        end

        def encode("JSON_ARRAY") do
          486
        end
      ),
      (
        def encode(:JSON_ARRAYAGG) do
          487
        end

        def encode("JSON_ARRAYAGG") do
          487
        end
      ),
      (
        def encode(:JSON_EXISTS) do
          488
        end

        def encode("JSON_EXISTS") do
          488
        end
      ),
      (
        def encode(:JSON_OBJECT) do
          489
        end

        def encode("JSON_OBJECT") do
          489
        end
      ),
      (
        def encode(:JSON_OBJECTAGG) do
          490
        end

        def encode("JSON_OBJECTAGG") do
          490
        end
      ),
      (
        def encode(:JSON_QUERY) do
          491
        end

        def encode("JSON_QUERY") do
          491
        end
      ),
      (
        def encode(:JSON_SCALAR) do
          492
        end

        def encode("JSON_SCALAR") do
          492
        end
      ),
      (
        def encode(:JSON_SERIALIZE) do
          493
        end

        def encode("JSON_SERIALIZE") do
          493
        end
      ),
      (
        def encode(:JSON_TABLE) do
          494
        end

        def encode("JSON_TABLE") do
          494
        end
      ),
      (
        def encode(:JSON_VALUE) do
          495
        end

        def encode("JSON_VALUE") do
          495
        end
      ),
      (
        def encode(:KEEP) do
          496
        end

        def encode("KEEP") do
          496
        end
      ),
      (
        def encode(:KEY) do
          497
        end

        def encode("KEY") do
          497
        end
      ),
      (
        def encode(:KEYS) do
          498
        end

        def encode("KEYS") do
          498
        end
      ),
      (
        def encode(:LABEL) do
          499
        end

        def encode("LABEL") do
          499
        end
      ),
      (
        def encode(:LANGUAGE) do
          500
        end

        def encode("LANGUAGE") do
          500
        end
      ),
      (
        def encode(:LARGE_P) do
          501
        end

        def encode("LARGE_P") do
          501
        end
      ),
      (
        def encode(:LAST_P) do
          502
        end

        def encode("LAST_P") do
          502
        end
      ),
      (
        def encode(:LATERAL_P) do
          503
        end

        def encode("LATERAL_P") do
          503
        end
      ),
      (
        def encode(:LEADING) do
          504
        end

        def encode("LEADING") do
          504
        end
      ),
      (
        def encode(:LEAKPROOF) do
          505
        end

        def encode("LEAKPROOF") do
          505
        end
      ),
      (
        def encode(:LEAST) do
          506
        end

        def encode("LEAST") do
          506
        end
      ),
      (
        def encode(:LEFT) do
          507
        end

        def encode("LEFT") do
          507
        end
      ),
      (
        def encode(:LEVEL) do
          508
        end

        def encode("LEVEL") do
          508
        end
      ),
      (
        def encode(:LIKE) do
          509
        end

        def encode("LIKE") do
          509
        end
      ),
      (
        def encode(:LIMIT) do
          510
        end

        def encode("LIMIT") do
          510
        end
      ),
      (
        def encode(:LISTEN) do
          511
        end

        def encode("LISTEN") do
          511
        end
      ),
      (
        def encode(:LOAD) do
          512
        end

        def encode("LOAD") do
          512
        end
      ),
      (
        def encode(:LOCAL) do
          513
        end

        def encode("LOCAL") do
          513
        end
      ),
      (
        def encode(:LOCALTIME) do
          514
        end

        def encode("LOCALTIME") do
          514
        end
      ),
      (
        def encode(:LOCALTIMESTAMP) do
          515
        end

        def encode("LOCALTIMESTAMP") do
          515
        end
      ),
      (
        def encode(:LOCATION) do
          516
        end

        def encode("LOCATION") do
          516
        end
      ),
      (
        def encode(:LOCK_P) do
          517
        end

        def encode("LOCK_P") do
          517
        end
      ),
      (
        def encode(:LOCKED) do
          518
        end

        def encode("LOCKED") do
          518
        end
      ),
      (
        def encode(:LOGGED) do
          519
        end

        def encode("LOGGED") do
          519
        end
      ),
      (
        def encode(:MAPPING) do
          520
        end

        def encode("MAPPING") do
          520
        end
      ),
      (
        def encode(:MATCH) do
          521
        end

        def encode("MATCH") do
          521
        end
      ),
      (
        def encode(:MATCHED) do
          522
        end

        def encode("MATCHED") do
          522
        end
      ),
      (
        def encode(:MATERIALIZED) do
          523
        end

        def encode("MATERIALIZED") do
          523
        end
      ),
      (
        def encode(:MAXVALUE) do
          524
        end

        def encode("MAXVALUE") do
          524
        end
      ),
      (
        def encode(:MERGE) do
          525
        end

        def encode("MERGE") do
          525
        end
      ),
      (
        def encode(:MERGE_ACTION) do
          526
        end

        def encode("MERGE_ACTION") do
          526
        end
      ),
      (
        def encode(:METHOD) do
          527
        end

        def encode("METHOD") do
          527
        end
      ),
      (
        def encode(:MINUTE_P) do
          528
        end

        def encode("MINUTE_P") do
          528
        end
      ),
      (
        def encode(:MINVALUE) do
          529
        end

        def encode("MINVALUE") do
          529
        end
      ),
      (
        def encode(:MODE) do
          530
        end

        def encode("MODE") do
          530
        end
      ),
      (
        def encode(:MONTH_P) do
          531
        end

        def encode("MONTH_P") do
          531
        end
      ),
      (
        def encode(:MOVE) do
          532
        end

        def encode("MOVE") do
          532
        end
      ),
      (
        def encode(:NAME_P) do
          533
        end

        def encode("NAME_P") do
          533
        end
      ),
      (
        def encode(:NAMES) do
          534
        end

        def encode("NAMES") do
          534
        end
      ),
      (
        def encode(:NATIONAL) do
          535
        end

        def encode("NATIONAL") do
          535
        end
      ),
      (
        def encode(:NATURAL) do
          536
        end

        def encode("NATURAL") do
          536
        end
      ),
      (
        def encode(:NCHAR) do
          537
        end

        def encode("NCHAR") do
          537
        end
      ),
      (
        def encode(:NESTED) do
          538
        end

        def encode("NESTED") do
          538
        end
      ),
      (
        def encode(:NEW) do
          539
        end

        def encode("NEW") do
          539
        end
      ),
      (
        def encode(:NEXT) do
          540
        end

        def encode("NEXT") do
          540
        end
      ),
      (
        def encode(:NFC) do
          541
        end

        def encode("NFC") do
          541
        end
      ),
      (
        def encode(:NFD) do
          542
        end

        def encode("NFD") do
          542
        end
      ),
      (
        def encode(:NFKC) do
          543
        end

        def encode("NFKC") do
          543
        end
      ),
      (
        def encode(:NFKD) do
          544
        end

        def encode("NFKD") do
          544
        end
      ),
      (
        def encode(:NO) do
          545
        end

        def encode("NO") do
          545
        end
      ),
      (
        def encode(:NONE) do
          546
        end

        def encode("NONE") do
          546
        end
      ),
      (
        def encode(:NORMALIZE) do
          547
        end

        def encode("NORMALIZE") do
          547
        end
      ),
      (
        def encode(:NORMALIZED) do
          548
        end

        def encode("NORMALIZED") do
          548
        end
      ),
      (
        def encode(:NOT) do
          549
        end

        def encode("NOT") do
          549
        end
      ),
      (
        def encode(:NOTHING) do
          550
        end

        def encode("NOTHING") do
          550
        end
      ),
      (
        def encode(:NOTIFY) do
          551
        end

        def encode("NOTIFY") do
          551
        end
      ),
      (
        def encode(:NOTNULL) do
          552
        end

        def encode("NOTNULL") do
          552
        end
      ),
      (
        def encode(:NOWAIT) do
          553
        end

        def encode("NOWAIT") do
          553
        end
      ),
      (
        def encode(:NULL_P) do
          554
        end

        def encode("NULL_P") do
          554
        end
      ),
      (
        def encode(:NULLIF) do
          555
        end

        def encode("NULLIF") do
          555
        end
      ),
      (
        def encode(:NULLS_P) do
          556
        end

        def encode("NULLS_P") do
          556
        end
      ),
      (
        def encode(:NUMERIC) do
          557
        end

        def encode("NUMERIC") do
          557
        end
      ),
      (
        def encode(:OBJECT_P) do
          558
        end

        def encode("OBJECT_P") do
          558
        end
      ),
      (
        def encode(:OF) do
          559
        end

        def encode("OF") do
          559
        end
      ),
      (
        def encode(:OFF) do
          560
        end

        def encode("OFF") do
          560
        end
      ),
      (
        def encode(:OFFSET) do
          561
        end

        def encode("OFFSET") do
          561
        end
      ),
      (
        def encode(:OIDS) do
          562
        end

        def encode("OIDS") do
          562
        end
      ),
      (
        def encode(:OLD) do
          563
        end

        def encode("OLD") do
          563
        end
      ),
      (
        def encode(:OMIT) do
          564
        end

        def encode("OMIT") do
          564
        end
      ),
      (
        def encode(:ON) do
          565
        end

        def encode("ON") do
          565
        end
      ),
      (
        def encode(:ONLY) do
          566
        end

        def encode("ONLY") do
          566
        end
      ),
      (
        def encode(:OPERATOR) do
          567
        end

        def encode("OPERATOR") do
          567
        end
      ),
      (
        def encode(:OPTION) do
          568
        end

        def encode("OPTION") do
          568
        end
      ),
      (
        def encode(:OPTIONS) do
          569
        end

        def encode("OPTIONS") do
          569
        end
      ),
      (
        def encode(:OR) do
          570
        end

        def encode("OR") do
          570
        end
      ),
      (
        def encode(:ORDER) do
          571
        end

        def encode("ORDER") do
          571
        end
      ),
      (
        def encode(:ORDINALITY) do
          572
        end

        def encode("ORDINALITY") do
          572
        end
      ),
      (
        def encode(:OTHERS) do
          573
        end

        def encode("OTHERS") do
          573
        end
      ),
      (
        def encode(:OUT_P) do
          574
        end

        def encode("OUT_P") do
          574
        end
      ),
      (
        def encode(:OUTER_P) do
          575
        end

        def encode("OUTER_P") do
          575
        end
      ),
      (
        def encode(:OVER) do
          576
        end

        def encode("OVER") do
          576
        end
      ),
      (
        def encode(:OVERLAPS) do
          577
        end

        def encode("OVERLAPS") do
          577
        end
      ),
      (
        def encode(:OVERLAY) do
          578
        end

        def encode("OVERLAY") do
          578
        end
      ),
      (
        def encode(:OVERRIDING) do
          579
        end

        def encode("OVERRIDING") do
          579
        end
      ),
      (
        def encode(:OWNED) do
          580
        end

        def encode("OWNED") do
          580
        end
      ),
      (
        def encode(:OWNER) do
          581
        end

        def encode("OWNER") do
          581
        end
      ),
      (
        def encode(:PARALLEL) do
          582
        end

        def encode("PARALLEL") do
          582
        end
      ),
      (
        def encode(:PARAMETER) do
          583
        end

        def encode("PARAMETER") do
          583
        end
      ),
      (
        def encode(:PARSER) do
          584
        end

        def encode("PARSER") do
          584
        end
      ),
      (
        def encode(:PARTIAL) do
          585
        end

        def encode("PARTIAL") do
          585
        end
      ),
      (
        def encode(:PARTITION) do
          586
        end

        def encode("PARTITION") do
          586
        end
      ),
      (
        def encode(:PASSING) do
          587
        end

        def encode("PASSING") do
          587
        end
      ),
      (
        def encode(:PASSWORD) do
          588
        end

        def encode("PASSWORD") do
          588
        end
      ),
      (
        def encode(:PATH) do
          589
        end

        def encode("PATH") do
          589
        end
      ),
      (
        def encode(:PLACING) do
          590
        end

        def encode("PLACING") do
          590
        end
      ),
      (
        def encode(:PLAN) do
          591
        end

        def encode("PLAN") do
          591
        end
      ),
      (
        def encode(:PLANS) do
          592
        end

        def encode("PLANS") do
          592
        end
      ),
      (
        def encode(:POLICY) do
          593
        end

        def encode("POLICY") do
          593
        end
      ),
      (
        def encode(:POSITION) do
          594
        end

        def encode("POSITION") do
          594
        end
      ),
      (
        def encode(:PRECEDING) do
          595
        end

        def encode("PRECEDING") do
          595
        end
      ),
      (
        def encode(:PRECISION) do
          596
        end

        def encode("PRECISION") do
          596
        end
      ),
      (
        def encode(:PRESERVE) do
          597
        end

        def encode("PRESERVE") do
          597
        end
      ),
      (
        def encode(:PREPARE) do
          598
        end

        def encode("PREPARE") do
          598
        end
      ),
      (
        def encode(:PREPARED) do
          599
        end

        def encode("PREPARED") do
          599
        end
      ),
      (
        def encode(:PRIMARY) do
          600
        end

        def encode("PRIMARY") do
          600
        end
      ),
      (
        def encode(:PRIOR) do
          601
        end

        def encode("PRIOR") do
          601
        end
      ),
      (
        def encode(:PRIVILEGES) do
          602
        end

        def encode("PRIVILEGES") do
          602
        end
      ),
      (
        def encode(:PROCEDURAL) do
          603
        end

        def encode("PROCEDURAL") do
          603
        end
      ),
      (
        def encode(:PROCEDURE) do
          604
        end

        def encode("PROCEDURE") do
          604
        end
      ),
      (
        def encode(:PROCEDURES) do
          605
        end

        def encode("PROCEDURES") do
          605
        end
      ),
      (
        def encode(:PROGRAM) do
          606
        end

        def encode("PROGRAM") do
          606
        end
      ),
      (
        def encode(:PUBLICATION) do
          607
        end

        def encode("PUBLICATION") do
          607
        end
      ),
      (
        def encode(:QUOTE) do
          608
        end

        def encode("QUOTE") do
          608
        end
      ),
      (
        def encode(:QUOTES) do
          609
        end

        def encode("QUOTES") do
          609
        end
      ),
      (
        def encode(:RANGE) do
          610
        end

        def encode("RANGE") do
          610
        end
      ),
      (
        def encode(:READ) do
          611
        end

        def encode("READ") do
          611
        end
      ),
      (
        def encode(:REAL) do
          612
        end

        def encode("REAL") do
          612
        end
      ),
      (
        def encode(:REASSIGN) do
          613
        end

        def encode("REASSIGN") do
          613
        end
      ),
      (
        def encode(:RECHECK) do
          614
        end

        def encode("RECHECK") do
          614
        end
      ),
      (
        def encode(:RECURSIVE) do
          615
        end

        def encode("RECURSIVE") do
          615
        end
      ),
      (
        def encode(:REF_P) do
          616
        end

        def encode("REF_P") do
          616
        end
      ),
      (
        def encode(:REFERENCES) do
          617
        end

        def encode("REFERENCES") do
          617
        end
      ),
      (
        def encode(:REFERENCING) do
          618
        end

        def encode("REFERENCING") do
          618
        end
      ),
      (
        def encode(:REFRESH) do
          619
        end

        def encode("REFRESH") do
          619
        end
      ),
      (
        def encode(:REINDEX) do
          620
        end

        def encode("REINDEX") do
          620
        end
      ),
      (
        def encode(:RELATIVE_P) do
          621
        end

        def encode("RELATIVE_P") do
          621
        end
      ),
      (
        def encode(:RELEASE) do
          622
        end

        def encode("RELEASE") do
          622
        end
      ),
      (
        def encode(:RENAME) do
          623
        end

        def encode("RENAME") do
          623
        end
      ),
      (
        def encode(:REPEATABLE) do
          624
        end

        def encode("REPEATABLE") do
          624
        end
      ),
      (
        def encode(:REPLACE) do
          625
        end

        def encode("REPLACE") do
          625
        end
      ),
      (
        def encode(:REPLICA) do
          626
        end

        def encode("REPLICA") do
          626
        end
      ),
      (
        def encode(:RESET) do
          627
        end

        def encode("RESET") do
          627
        end
      ),
      (
        def encode(:RESTART) do
          628
        end

        def encode("RESTART") do
          628
        end
      ),
      (
        def encode(:RESTRICT) do
          629
        end

        def encode("RESTRICT") do
          629
        end
      ),
      (
        def encode(:RETURN) do
          630
        end

        def encode("RETURN") do
          630
        end
      ),
      (
        def encode(:RETURNING) do
          631
        end

        def encode("RETURNING") do
          631
        end
      ),
      (
        def encode(:RETURNS) do
          632
        end

        def encode("RETURNS") do
          632
        end
      ),
      (
        def encode(:REVOKE) do
          633
        end

        def encode("REVOKE") do
          633
        end
      ),
      (
        def encode(:RIGHT) do
          634
        end

        def encode("RIGHT") do
          634
        end
      ),
      (
        def encode(:ROLE) do
          635
        end

        def encode("ROLE") do
          635
        end
      ),
      (
        def encode(:ROLLBACK) do
          636
        end

        def encode("ROLLBACK") do
          636
        end
      ),
      (
        def encode(:ROLLUP) do
          637
        end

        def encode("ROLLUP") do
          637
        end
      ),
      (
        def encode(:ROUTINE) do
          638
        end

        def encode("ROUTINE") do
          638
        end
      ),
      (
        def encode(:ROUTINES) do
          639
        end

        def encode("ROUTINES") do
          639
        end
      ),
      (
        def encode(:ROW) do
          640
        end

        def encode("ROW") do
          640
        end
      ),
      (
        def encode(:ROWS) do
          641
        end

        def encode("ROWS") do
          641
        end
      ),
      (
        def encode(:RULE) do
          642
        end

        def encode("RULE") do
          642
        end
      ),
      (
        def encode(:SAVEPOINT) do
          643
        end

        def encode("SAVEPOINT") do
          643
        end
      ),
      (
        def encode(:SCALAR) do
          644
        end

        def encode("SCALAR") do
          644
        end
      ),
      (
        def encode(:SCHEMA) do
          645
        end

        def encode("SCHEMA") do
          645
        end
      ),
      (
        def encode(:SCHEMAS) do
          646
        end

        def encode("SCHEMAS") do
          646
        end
      ),
      (
        def encode(:SCROLL) do
          647
        end

        def encode("SCROLL") do
          647
        end
      ),
      (
        def encode(:SEARCH) do
          648
        end

        def encode("SEARCH") do
          648
        end
      ),
      (
        def encode(:SECOND_P) do
          649
        end

        def encode("SECOND_P") do
          649
        end
      ),
      (
        def encode(:SECURITY) do
          650
        end

        def encode("SECURITY") do
          650
        end
      ),
      (
        def encode(:SELECT) do
          651
        end

        def encode("SELECT") do
          651
        end
      ),
      (
        def encode(:SEQUENCE) do
          652
        end

        def encode("SEQUENCE") do
          652
        end
      ),
      (
        def encode(:SEQUENCES) do
          653
        end

        def encode("SEQUENCES") do
          653
        end
      ),
      (
        def encode(:SERIALIZABLE) do
          654
        end

        def encode("SERIALIZABLE") do
          654
        end
      ),
      (
        def encode(:SERVER) do
          655
        end

        def encode("SERVER") do
          655
        end
      ),
      (
        def encode(:SESSION) do
          656
        end

        def encode("SESSION") do
          656
        end
      ),
      (
        def encode(:SESSION_USER) do
          657
        end

        def encode("SESSION_USER") do
          657
        end
      ),
      (
        def encode(:SET) do
          658
        end

        def encode("SET") do
          658
        end
      ),
      (
        def encode(:SETS) do
          659
        end

        def encode("SETS") do
          659
        end
      ),
      (
        def encode(:SETOF) do
          660
        end

        def encode("SETOF") do
          660
        end
      ),
      (
        def encode(:SHARE) do
          661
        end

        def encode("SHARE") do
          661
        end
      ),
      (
        def encode(:SHOW) do
          662
        end

        def encode("SHOW") do
          662
        end
      ),
      (
        def encode(:SIMILAR) do
          663
        end

        def encode("SIMILAR") do
          663
        end
      ),
      (
        def encode(:SIMPLE) do
          664
        end

        def encode("SIMPLE") do
          664
        end
      ),
      (
        def encode(:SKIP) do
          665
        end

        def encode("SKIP") do
          665
        end
      ),
      (
        def encode(:SMALLINT) do
          666
        end

        def encode("SMALLINT") do
          666
        end
      ),
      (
        def encode(:SNAPSHOT) do
          667
        end

        def encode("SNAPSHOT") do
          667
        end
      ),
      (
        def encode(:SOME) do
          668
        end

        def encode("SOME") do
          668
        end
      ),
      (
        def encode(:SOURCE) do
          669
        end

        def encode("SOURCE") do
          669
        end
      ),
      (
        def encode(:SQL_P) do
          670
        end

        def encode("SQL_P") do
          670
        end
      ),
      (
        def encode(:STABLE) do
          671
        end

        def encode("STABLE") do
          671
        end
      ),
      (
        def encode(:STANDALONE_P) do
          672
        end

        def encode("STANDALONE_P") do
          672
        end
      ),
      (
        def encode(:START) do
          673
        end

        def encode("START") do
          673
        end
      ),
      (
        def encode(:STATEMENT) do
          674
        end

        def encode("STATEMENT") do
          674
        end
      ),
      (
        def encode(:STATISTICS) do
          675
        end

        def encode("STATISTICS") do
          675
        end
      ),
      (
        def encode(:STDIN) do
          676
        end

        def encode("STDIN") do
          676
        end
      ),
      (
        def encode(:STDOUT) do
          677
        end

        def encode("STDOUT") do
          677
        end
      ),
      (
        def encode(:STORAGE) do
          678
        end

        def encode("STORAGE") do
          678
        end
      ),
      (
        def encode(:STORED) do
          679
        end

        def encode("STORED") do
          679
        end
      ),
      (
        def encode(:STRICT_P) do
          680
        end

        def encode("STRICT_P") do
          680
        end
      ),
      (
        def encode(:STRING_P) do
          681
        end

        def encode("STRING_P") do
          681
        end
      ),
      (
        def encode(:STRIP_P) do
          682
        end

        def encode("STRIP_P") do
          682
        end
      ),
      (
        def encode(:SUBSCRIPTION) do
          683
        end

        def encode("SUBSCRIPTION") do
          683
        end
      ),
      (
        def encode(:SUBSTRING) do
          684
        end

        def encode("SUBSTRING") do
          684
        end
      ),
      (
        def encode(:SUPPORT) do
          685
        end

        def encode("SUPPORT") do
          685
        end
      ),
      (
        def encode(:SYMMETRIC) do
          686
        end

        def encode("SYMMETRIC") do
          686
        end
      ),
      (
        def encode(:SYSID) do
          687
        end

        def encode("SYSID") do
          687
        end
      ),
      (
        def encode(:SYSTEM_P) do
          688
        end

        def encode("SYSTEM_P") do
          688
        end
      ),
      (
        def encode(:SYSTEM_USER) do
          689
        end

        def encode("SYSTEM_USER") do
          689
        end
      ),
      (
        def encode(:TABLE) do
          690
        end

        def encode("TABLE") do
          690
        end
      ),
      (
        def encode(:TABLES) do
          691
        end

        def encode("TABLES") do
          691
        end
      ),
      (
        def encode(:TABLESAMPLE) do
          692
        end

        def encode("TABLESAMPLE") do
          692
        end
      ),
      (
        def encode(:TABLESPACE) do
          693
        end

        def encode("TABLESPACE") do
          693
        end
      ),
      (
        def encode(:TARGET) do
          694
        end

        def encode("TARGET") do
          694
        end
      ),
      (
        def encode(:TEMP) do
          695
        end

        def encode("TEMP") do
          695
        end
      ),
      (
        def encode(:TEMPLATE) do
          696
        end

        def encode("TEMPLATE") do
          696
        end
      ),
      (
        def encode(:TEMPORARY) do
          697
        end

        def encode("TEMPORARY") do
          697
        end
      ),
      (
        def encode(:TEXT_P) do
          698
        end

        def encode("TEXT_P") do
          698
        end
      ),
      (
        def encode(:THEN) do
          699
        end

        def encode("THEN") do
          699
        end
      ),
      (
        def encode(:TIES) do
          700
        end

        def encode("TIES") do
          700
        end
      ),
      (
        def encode(:TIME) do
          701
        end

        def encode("TIME") do
          701
        end
      ),
      (
        def encode(:TIMESTAMP) do
          702
        end

        def encode("TIMESTAMP") do
          702
        end
      ),
      (
        def encode(:TO) do
          703
        end

        def encode("TO") do
          703
        end
      ),
      (
        def encode(:TRAILING) do
          704
        end

        def encode("TRAILING") do
          704
        end
      ),
      (
        def encode(:TRANSACTION) do
          705
        end

        def encode("TRANSACTION") do
          705
        end
      ),
      (
        def encode(:TRANSFORM) do
          706
        end

        def encode("TRANSFORM") do
          706
        end
      ),
      (
        def encode(:TREAT) do
          707
        end

        def encode("TREAT") do
          707
        end
      ),
      (
        def encode(:TRIGGER) do
          708
        end

        def encode("TRIGGER") do
          708
        end
      ),
      (
        def encode(:TRIM) do
          709
        end

        def encode("TRIM") do
          709
        end
      ),
      (
        def encode(:TRUE_P) do
          710
        end

        def encode("TRUE_P") do
          710
        end
      ),
      (
        def encode(:TRUNCATE) do
          711
        end

        def encode("TRUNCATE") do
          711
        end
      ),
      (
        def encode(:TRUSTED) do
          712
        end

        def encode("TRUSTED") do
          712
        end
      ),
      (
        def encode(:TYPE_P) do
          713
        end

        def encode("TYPE_P") do
          713
        end
      ),
      (
        def encode(:TYPES_P) do
          714
        end

        def encode("TYPES_P") do
          714
        end
      ),
      (
        def encode(:UESCAPE) do
          715
        end

        def encode("UESCAPE") do
          715
        end
      ),
      (
        def encode(:UNBOUNDED) do
          716
        end

        def encode("UNBOUNDED") do
          716
        end
      ),
      (
        def encode(:UNCONDITIONAL) do
          717
        end

        def encode("UNCONDITIONAL") do
          717
        end
      ),
      (
        def encode(:UNCOMMITTED) do
          718
        end

        def encode("UNCOMMITTED") do
          718
        end
      ),
      (
        def encode(:UNENCRYPTED) do
          719
        end

        def encode("UNENCRYPTED") do
          719
        end
      ),
      (
        def encode(:UNION) do
          720
        end

        def encode("UNION") do
          720
        end
      ),
      (
        def encode(:UNIQUE) do
          721
        end

        def encode("UNIQUE") do
          721
        end
      ),
      (
        def encode(:UNKNOWN) do
          722
        end

        def encode("UNKNOWN") do
          722
        end
      ),
      (
        def encode(:UNLISTEN) do
          723
        end

        def encode("UNLISTEN") do
          723
        end
      ),
      (
        def encode(:UNLOGGED) do
          724
        end

        def encode("UNLOGGED") do
          724
        end
      ),
      (
        def encode(:UNTIL) do
          725
        end

        def encode("UNTIL") do
          725
        end
      ),
      (
        def encode(:UPDATE) do
          726
        end

        def encode("UPDATE") do
          726
        end
      ),
      (
        def encode(:USER) do
          727
        end

        def encode("USER") do
          727
        end
      ),
      (
        def encode(:USING) do
          728
        end

        def encode("USING") do
          728
        end
      ),
      (
        def encode(:VACUUM) do
          729
        end

        def encode("VACUUM") do
          729
        end
      ),
      (
        def encode(:VALID) do
          730
        end

        def encode("VALID") do
          730
        end
      ),
      (
        def encode(:VALIDATE) do
          731
        end

        def encode("VALIDATE") do
          731
        end
      ),
      (
        def encode(:VALIDATOR) do
          732
        end

        def encode("VALIDATOR") do
          732
        end
      ),
      (
        def encode(:VALUE_P) do
          733
        end

        def encode("VALUE_P") do
          733
        end
      ),
      (
        def encode(:VALUES) do
          734
        end

        def encode("VALUES") do
          734
        end
      ),
      (
        def encode(:VARCHAR) do
          735
        end

        def encode("VARCHAR") do
          735
        end
      ),
      (
        def encode(:VARIADIC) do
          736
        end

        def encode("VARIADIC") do
          736
        end
      ),
      (
        def encode(:VARYING) do
          737
        end

        def encode("VARYING") do
          737
        end
      ),
      (
        def encode(:VERBOSE) do
          738
        end

        def encode("VERBOSE") do
          738
        end
      ),
      (
        def encode(:VERSION_P) do
          739
        end

        def encode("VERSION_P") do
          739
        end
      ),
      (
        def encode(:VIEW) do
          740
        end

        def encode("VIEW") do
          740
        end
      ),
      (
        def encode(:VIEWS) do
          741
        end

        def encode("VIEWS") do
          741
        end
      ),
      (
        def encode(:VOLATILE) do
          742
        end

        def encode("VOLATILE") do
          742
        end
      ),
      (
        def encode(:WHEN) do
          743
        end

        def encode("WHEN") do
          743
        end
      ),
      (
        def encode(:WHERE) do
          744
        end

        def encode("WHERE") do
          744
        end
      ),
      (
        def encode(:WHITESPACE_P) do
          745
        end

        def encode("WHITESPACE_P") do
          745
        end
      ),
      (
        def encode(:WINDOW) do
          746
        end

        def encode("WINDOW") do
          746
        end
      ),
      (
        def encode(:WITH) do
          747
        end

        def encode("WITH") do
          747
        end
      ),
      (
        def encode(:WITHIN) do
          748
        end

        def encode("WITHIN") do
          748
        end
      ),
      (
        def encode(:WITHOUT) do
          749
        end

        def encode("WITHOUT") do
          749
        end
      ),
      (
        def encode(:WORK) do
          750
        end

        def encode("WORK") do
          750
        end
      ),
      (
        def encode(:WRAPPER) do
          751
        end

        def encode("WRAPPER") do
          751
        end
      ),
      (
        def encode(:WRITE) do
          752
        end

        def encode("WRITE") do
          752
        end
      ),
      (
        def encode(:XML_P) do
          753
        end

        def encode("XML_P") do
          753
        end
      ),
      (
        def encode(:XMLATTRIBUTES) do
          754
        end

        def encode("XMLATTRIBUTES") do
          754
        end
      ),
      (
        def encode(:XMLCONCAT) do
          755
        end

        def encode("XMLCONCAT") do
          755
        end
      ),
      (
        def encode(:XMLELEMENT) do
          756
        end

        def encode("XMLELEMENT") do
          756
        end
      ),
      (
        def encode(:XMLEXISTS) do
          757
        end

        def encode("XMLEXISTS") do
          757
        end
      ),
      (
        def encode(:XMLFOREST) do
          758
        end

        def encode("XMLFOREST") do
          758
        end
      ),
      (
        def encode(:XMLNAMESPACES) do
          759
        end

        def encode("XMLNAMESPACES") do
          759
        end
      ),
      (
        def encode(:XMLPARSE) do
          760
        end

        def encode("XMLPARSE") do
          760
        end
      ),
      (
        def encode(:XMLPI) do
          761
        end

        def encode("XMLPI") do
          761
        end
      ),
      (
        def encode(:XMLROOT) do
          762
        end

        def encode("XMLROOT") do
          762
        end
      ),
      (
        def encode(:XMLSERIALIZE) do
          763
        end

        def encode("XMLSERIALIZE") do
          763
        end
      ),
      (
        def encode(:XMLTABLE) do
          764
        end

        def encode("XMLTABLE") do
          764
        end
      ),
      (
        def encode(:YEAR_P) do
          765
        end

        def encode("YEAR_P") do
          765
        end
      ),
      (
        def encode(:YES_P) do
          766
        end

        def encode("YES_P") do
          766
        end
      ),
      (
        def encode(:ZONE) do
          767
        end

        def encode("ZONE") do
          767
        end
      ),
      (
        def encode(:FORMAT_LA) do
          768
        end

        def encode("FORMAT_LA") do
          768
        end
      ),
      (
        def encode(:NOT_LA) do
          769
        end

        def encode("NOT_LA") do
          769
        end
      ),
      (
        def encode(:NULLS_LA) do
          770
        end

        def encode("NULLS_LA") do
          770
        end
      ),
      (
        def encode(:WITH_LA) do
          771
        end

        def encode("WITH_LA") do
          771
        end
      ),
      (
        def encode(:WITHOUT_LA) do
          772
        end

        def encode("WITHOUT_LA") do
          772
        end
      ),
      (
        def encode(:MODE_TYPE_NAME) do
          773
        end

        def encode("MODE_TYPE_NAME") do
          773
        end
      ),
      (
        def encode(:MODE_PLPGSQL_EXPR) do
          774
        end

        def encode("MODE_PLPGSQL_EXPR") do
          774
        end
      ),
      (
        def encode(:MODE_PLPGSQL_ASSIGN1) do
          775
        end

        def encode("MODE_PLPGSQL_ASSIGN1") do
          775
        end
      ),
      (
        def encode(:MODE_PLPGSQL_ASSIGN2) do
          776
        end

        def encode("MODE_PLPGSQL_ASSIGN2") do
          776
        end
      ),
      (
        def encode(:MODE_PLPGSQL_ASSIGN3) do
          777
        end

        def encode("MODE_PLPGSQL_ASSIGN3") do
          777
        end
      ),
      (
        def encode(:UMINUS) do
          778
        end

        def encode("UMINUS") do
          778
        end
      )
    ]

    def encode(x) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def decode(400) do
        :EMPTY_P
      end,
      def decode(449) do
        :HOLD
      end,
      def decode(774) do
        :MODE_PLPGSQL_EXPR
      end,
      def decode(432) do
        :FORWARD
      end,
      def decode(463) do
        :INDEX
      end,
      def decode(569) do
        :OPTIONS
      end,
      def decode(554) do
        :NULL_P
      end,
      def decode(660) do
        :SETOF
      end,
      def decode(700) do
        :TIES
      end,
      def decode(36) do
        :ASCII_36
      end,
      def decode(270) do
        :COLON_EQUALS
      end,
      def decode(433) do
        :FREEZE
      end,
      def decode(299) do
        :ASSIGNMENT
      end,
      def decode(552) do
        :NOTNULL
      end,
      def decode(549) do
        :NOT
      end,
      def decode(541) do
        :NFC
      end,
      def decode(424) do
        :FINALIZE
      end,
      def decode(757) do
        :XMLEXISTS
      end,
      def decode(322) do
        :CASE
      end,
      def decode(683) do
        :SUBSCRIPTION
      end,
      def decode(448) do
        :HEADER_P
      end,
      def decode(715) do
        :UESCAPE
      end,
      def decode(720) do
        :UNION
      end,
      def decode(331) do
        :CLASS
      end,
      def decode(325) do
        :CHAIN
      end,
      def decode(550) do
        :NOTHING
      end,
      def decode(303) do
        :ATTACH
      end,
      def decode(341) do
        :COMMIT
      end,
      def decode(623) do
        :RENAME
      end,
      def decode(680) do
        :STRICT_P
      end,
      def decode(709) do
        :TRIM
      end,
      def decode(572) do
        :ORDINALITY
      end,
      def decode(468) do
        :INLINE_P
      end,
      def decode(762) do
        :XMLROOT
      end,
      def decode(63) do
        :ASCII_63
      end,
      def decode(516) do
        :LOCATION
      end,
      def decode(722) do
        :UNKNOWN
      end,
      def decode(394) do
        :DOCUMENT_P
      end,
      def decode(418) do
        :EXTERNAL
      end,
      def decode(295) do
        :AS
      end,
      def decode(534) do
        :NAMES
      end,
      def decode(685) do
        :SUPPORT
      end,
      def decode(561) do
        :OFFSET
      end,
      def decode(477) do
        :INTERSECT
      end,
      def decode(376) do
        :DECLARE
      end,
      def decode(367) do
        :CURRENT_USER
      end,
      def decode(486) do
        :JSON_ARRAY
      end,
      def decode(332) do
        :CLOSE
      end,
      def decode(579) do
        :OVERRIDING
      end,
      def decode(291) do
        :ANALYZE
      end,
      def decode(395) do
        :DOMAIN_P
      end,
      def decode(701) do
        :TIME
      end,
      def decode(616) do
        :REF_P
      end,
      def decode(772) do
        :WITHOUT_LA
      end,
      def decode(416) do
        :EXPRESSION
      end,
      def decode(365) do
        :CURRENT_TIME
      end,
      def decode(460) do
        :INCLUDING
      end,
      def decode(744) do
        :WHERE
      end,
      def decode(548) do
        :NORMALIZED
      end,
      def decode(434) do
        :FROM
      end,
      def decode(363) do
        :CURRENT_ROLE
      end,
      def decode(487) do
        :JSON_ARRAYAGG
      end,
      def decode(292) do
        :AND
      end,
      def decode(612) do
        :REAL
      end,
      def decode(740) do
        :VIEW
      end,
      def decode(304) do
        :ATTRIBUTE
      end,
      def decode(407) do
        :ESCAPE
      end,
      def decode(476) do
        :INTEGER
      end,
      def decode(583) do
        :PARAMETER
      end,
      def decode(636) do
        :ROLLBACK
      end,
      def decode(62) do
        :ASCII_62
      end,
      def decode(478) do
        :INTERVAL
      end,
      def decode(311) do
        :BINARY
      end,
      def decode(723) do
        :UNLISTEN
      end,
      def decode(588) do
        :PASSWORD
      end,
      def decode(339) do
        :COMMENT
      end,
      def decode(718) do
        :UNCOMMITTED
      end,
      def decode(637) do
        :ROLLUP
      end,
      def decode(551) do
        :NOTIFY
      end,
      def decode(471) do
        :INPUT_P
      end,
      def decode(750) do
        :WORK
      end,
      def decode(43) do
        :ASCII_43
      end,
      def decode(481) do
        :IS
      end,
      def decode(601) do
        :PRIOR
      end,
      def decode(773) do
        :MODE_TYPE_NAME
      end,
      def decode(59) do
        :ASCII_59
      end,
      def decode(535) do
        :NATIONAL
      end,
      def decode(40) do
        :ASCII_40
      end,
      def decode(504) do
        :LEADING
      end,
      def decode(645) do
        :SCHEMA
      end,
      def decode(482) do
        :ISNULL
      end,
      def decode(402) do
        :ENCODING
      end,
      def decode(596) do
        :PRECISION
      end,
      def decode(665) do
        :SKIP
      end,
      def decode(280) do
        :ACCESS
      end,
      def decode(501) do
        :LARGE_P
      end,
      def decode(620) do
        :REINDEX
      end,
      def decode(274) do
        :NOT_EQUALS
      end,
      def decode(703) do
        :TO
      end,
      def decode(674) do
        :STATEMENT
      end,
      def decode(383) do
        :DELIMITER
      end,
      def decode(340) do
        :COMMENTS
      end,
      def decode(302) do
        :AT
      end,
      def decode(745) do
        :WHITESPACE_P
      end,
      def decode(731) do
        :VALIDATE
      end,
      def decode(508) do
        :LEVEL
      end,
      def decode(422) do
        :FETCH
      end,
      def decode(684) do
        :SUBSTRING
      end,
      def decode(528) do
        :MINUTE_P
      end,
      def decode(584) do
        :PARSER
      end,
      def decode(451) do
        :IDENTITY_P
      end,
      def decode(46) do
        :ASCII_46
      end,
      def decode(634) do
        :RIGHT
      end,
      def decode(386) do
        :DEPTH
      end,
      def decode(92) do
        :ASCII_92
      end,
      def decode(319) do
        :CALLED
      end,
      def decode(581) do
        :OWNER
      end,
      def decode(655) do
        :SERVER
      end,
      def decode(492) do
        :JSON_SCALAR
      end,
      def decode(566) do
        :ONLY
      end,
      def decode(690) do
        :TABLE
      end,
      def decode(546) do
        :NONE
      end,
      def decode(495) do
        :JSON_VALUE
      end,
      def decode(499) do
        :LABEL
      end,
      def decode(733) do
        :VALUE_P
      end,
      def decode(704) do
        :TRAILING
      end,
      def decode(713) do
        :TYPE_P
      end,
      def decode(267) do
        :PARAM
      end,
      def decode(301) do
        :ATOMIC
      end,
      def decode(617) do
        :REFERENCES
      end,
      def decode(558) do
        :OBJECT_P
      end,
      def decode(653) do
        :SEQUENCES
      end,
      def decode(739) do
        :VERSION_P
      end,
      def decode(297) do
        :ASENSITIVE
      end,
      def decode(385) do
        :DEPENDS
      end,
      def decode(329) do
        :CHECK
      end,
      def decode(421) do
        :FAMILY
      end,
      def decode(419) do
        :EXTRACT
      end,
      def decode(316) do
        :BY
      end,
      def decode(260) do
        :FCONST
      end,
      def decode(326) do
        :CHAR_P
      end,
      def decode(464) do
        :INDEXES
      end,
      def decode(354) do
        :COPY
      end,
      def decode(352) do
        :CONTINUE_P
      end,
      def decode(497) do
        :KEY
      end,
      def decode(425) do
        :FIRST_P
      end,
      def decode(751) do
        :WRAPPER
      end,
      def decode(272) do
        :LESS_EQUALS
      end,
      def decode(457) do
        :IMPORT_P
      end,
      def decode(342) do
        :COMMITTED
      end,
      def decode(456) do
        :IMPLICIT_P
      end,
      def decode(258) do
        :IDENT
      end,
      def decode(605) do
        :PROCEDURES
      end,
      def decode(475) do
        :INT_P
      end,
      def decode(525) do
        :MERGE
      end,
      def decode(343) do
        :COMPRESSION
      end,
      def decode(622) do
        :RELEASE
      end,
      def decode(658) do
        :SET
      end,
      def decode(593) do
        :POLICY
      end,
      def decode(296) do
        :ASC
      end,
      def decode(290) do
        :ANALYSE
      end,
      def decode(435) do
        :FULL
      end,
      def decode(755) do
        :XMLCONCAT
      end,
      def decode(753) do
        :XML_P
      end,
      def decode(506) do
        :LEAST
      end,
      def decode(635) do
        :ROLE
      end,
      def decode(47) do
        :ASCII_47
      end,
      def decode(613) do
        :REASSIGN
      end,
      def decode(443) do
        :GROUP_P
      end,
      def decode(333) do
        :CLUSTER
      end,
      def decode(741) do
        :VIEWS
      end,
      def decode(384) do
        :DELIMITERS
      end,
      def decode(527) do
        :METHOD
      end,
      def decode(754) do
        :XMLATTRIBUTES
      end,
      def decode(557) do
        :NUMERIC
      end,
      def decode(350) do
        :CONSTRAINTS
      end,
      def decode(694) do
        :TARGET
      end,
      def decode(368) do
        :CURSOR
      end,
      def decode(746) do
        :WINDOW
      end,
      def decode(388) do
        :DETACH
      end,
      def decode(469) do
        :INNER_P
      end,
      def decode(577) do
        :OVERLAPS
      end,
      def decode(582) do
        :PARALLEL
      end,
      def decode(330) do
        :CHECKPOINT
      end,
      def decode(544) do
        :NFKD
      end,
      def decode(719) do
        :UNENCRYPTED
      end,
      def decode(427) do
        :FOLLOWING
      end,
      def decode(642) do
        :RULE
      end,
      def decode(716) do
        :UNBOUNDED
      end,
      def decode(273) do
        :GREATER_EQUALS
      end,
      def decode(314) do
        :BOTH
      end,
      def decode(564) do
        :OMIT
      end,
      def decode(94) do
        :ASCII_94
      end,
      def decode(306) do
        :BACKWARD
      end,
      def decode(742) do
        :VOLATILE
      end,
      def decode(562) do
        :OIDS
      end,
      def decode(375) do
        :DECIMAL_P
      end,
      def decode(629) do
        :RESTRICT
      end,
      def decode(413) do
        :EXECUTE
      end,
      def decode(578) do
        :OVERLAY
      end,
      def decode(547) do
        :NORMALIZE
      end,
      def decode(600) do
        :PRIMARY
      end,
      def decode(377) do
        :DEFAULT
      end,
      def decode(409) do
        :EXCEPT
      end,
      def decode(399) do
        :ELSE
      end,
      def decode(681) do
        :STRING_P
      end,
      def decode(526) do
        :MERGE_ACTION
      end,
      def decode(307) do
        :BEFORE
      end,
      def decode(614) do
        :RECHECK
      end,
      def decode(289) do
        :ALWAYS
      end,
      def decode(403) do
        :ENCRYPTED
      end,
      def decode(559) do
        :OF
      end,
      def decode(611) do
        :READ
      end,
      def decode(415) do
        :EXPLAIN
      end,
      def decode(269) do
        :DOT_DOT
      end,
      def decode(608) do
        :QUOTE
      end,
      def decode(770) do
        :NULLS_LA
      end,
      def decode(488) do
        :JSON_EXISTS
      end,
      def decode(441) do
        :GRANTED
      end,
      def decode(768) do
        :FORMAT_LA
      end,
      def decode(553) do
        :NOWAIT
      end,
      def decode(697) do
        :TEMPORARY
      end,
      def decode(699) do
        :THEN
      end,
      def decode(663) do
        :SIMILAR
      end,
      def decode(411) do
        :EXCLUDING
      end,
      def decode(649) do
        :SECOND_P
      end,
      def decode(300) do
        :ASYMMETRIC
      end,
      def decode(594) do
        :POSITION
      end,
      def decode(589) do
        :PATH
      end,
      def decode(356) do
        :CREATE
      end,
      def decode(607) do
        :PUBLICATION
      end,
      def decode(677) do
        :STDOUT
      end,
      def decode(571) do
        :ORDER
      end,
      def decode(568) do
        :OPTION
      end,
      def decode(279) do
        :ABSOLUTE_P
      end,
      def decode(626) do
        :REPLICA
      end,
      def decode(590) do
        :PLACING
      end,
      def decode(405) do
        :ENUM_P
      end,
      def decode(728) do
        :USING
      end,
      def decode(313) do
        :BOOLEAN_P
      end,
      def decode(778) do
        :UMINUS
      end,
      def decode(639) do
        :ROUTINES
      end,
      def decode(606) do
        :PROGRAM
      end,
      def decode(414) do
        :EXISTS
      end,
      def decode(263) do
        :BCONST
      end,
      def decode(496) do
        :KEEP
      end,
      def decode(523) do
        :MATERIALIZED
      end,
      def decode(668) do
        :SOME
      end,
      def decode(442) do
        :GREATEST
      end,
      def decode(287) do
        :ALSO
      end,
      def decode(721) do
        :UNIQUE
      end,
      def decode(381) do
        :DEFINER
      end,
      def decode(555) do
        :NULLIF
      end,
      def decode(604) do
        :PROCEDURE
      end,
      def decode(766) do
        :YES_P
      end,
      def decode(362) do
        :CURRENT_DATE
      end,
      def decode(519) do
        :LOGGED
      end,
      def decode(298) do
        :ASSERTION
      end,
      def decode(390) do
        :DISABLE_P
      end,
      def decode(505) do
        :LEAKPROOF
      end,
      def decode(430) do
        :FOREIGN
      end,
      def decode(543) do
        :NFKC
      end,
      def decode(708) do
        :TRIGGER
      end,
      def decode(712) do
        :TRUSTED
      end,
      def decode(282) do
        :ADD_P
      end,
      def decode(706) do
        :TRANSFORM
      end,
      def decode(619) do
        :REFRESH
      end,
      def decode(353) do
        :CONVERSION_P
      end,
      def decode(678) do
        :STORAGE
      end,
      def decode(621) do
        :RELATIVE_P
      end,
      def decode(752) do
        :WRITE
      end,
      def decode(345) do
        :CONDITIONAL
      end,
      def decode(447) do
        :HAVING
      end,
      def decode(646) do
        :SCHEMAS
      end,
      def decode(42) do
        :ASCII_42
      end,
      def decode(758) do
        :XMLFOREST
      end,
      def decode(444) do
        :GROUPING
      end,
      def decode(440) do
        :GRANT
      end,
      def decode(717) do
        :UNCONDITIONAL
      end,
      def decode(392) do
        :DISTINCT
      end,
      def decode(396) do
        :DOUBLE_P
      end,
      def decode(602) do
        :PRIVILEGES
      end,
      def decode(538) do
        :NESTED
      end,
      def decode(315) do
        :BREADTH
      end,
      def decode(450) do
        :HOUR_P
      end,
      def decode(726) do
        :UPDATE
      end,
      def decode(364) do
        :CURRENT_SCHEMA
      end,
      def decode(698) do
        :TEXT_P
      end,
      def decode(598) do
        :PREPARE
      end,
      def decode(465) do
        :INHERIT
      end,
      def decode(603) do
        :PROCEDURAL
      end,
      def decode(630) do
        :RETURN
      end,
      def decode(335) do
        :COLLATE
      end,
      def decode(470) do
        :INOUT
      end,
      def decode(45) do
        :ASCII_45
      end,
      def decode(366) do
        :CURRENT_TIMESTAMP
      end,
      def decode(264) do
        :XCONST
      end,
      def decode(438) do
        :GENERATED
      end,
      def decode(540) do
        :NEXT
      end,
      def decode(669) do
        :SOURCE
      end,
      def decode(707) do
        :TREAT
      end,
      def decode(308) do
        :BEGIN_P
      end,
      def decode(507) do
        :LEFT
      end,
      def decode(293) do
        :ANY
      end,
      def decode(429) do
        :FORCE
      end,
      def decode(373) do
        :DEALLOCATE
      end,
      def decode(285) do
        :AGGREGATE
      end,
      def decode(652) do
        :SEQUENCE
      end,
      def decode(530) do
        :MODE
      end,
      def decode(556) do
        :NULLS_P
      end,
      def decode(661) do
        :SHARE
      end,
      def decode(586) do
        :PARTITION
      end,
      def decode(532) do
        :MOVE
      end,
      def decode(359) do
        :CUBE
      end,
      def decode(431) do
        :FORMAT
      end,
      def decode(467) do
        :INITIALLY
      end,
      def decode(573) do
        :OTHERS
      end,
      def decode(276) do
        :C_COMMENT
      end,
      def decode(686) do
        :SYMMETRIC
      end,
      def decode(408) do
        :EVENT
      end,
      def decode(502) do
        :LAST_P
      end,
      def decode(729) do
        :VACUUM
      end,
      def decode(466) do
        :INHERITS
      end,
      def decode(500) do
        :LANGUAGE
      end,
      def decode(618) do
        :REFERENCING
      end,
      def decode(670) do
        :SQL_P
      end,
      def decode(615) do
        :RECURSIVE
      end,
      def decode(763) do
        :XMLSERIALIZE
      end,
      def decode(445) do
        :GROUPS
      end,
      def decode(735) do
        :VARCHAR
      end,
      def decode(537) do
        :NCHAR
      end,
      def decode(575) do
        :OUTER_P
      end,
      def decode(624) do
        :REPEATABLE
      end,
      def decode(756) do
        :XMLELEMENT
      end,
      def decode(44) do
        :ASCII_44
      end,
      def decode(462) do
        :INDENT
      end,
      def decode(777) do
        :MODE_PLPGSQL_ASSIGN3
      end,
      def decode(305) do
        :AUTHORIZATION
      end,
      def decode(309) do
        :BETWEEN
      end,
      def decode(518) do
        :LOCKED
      end,
      def decode(695) do
        :TEMP
      end,
      def decode(595) do
        :PRECEDING
      end,
      def decode(512) do
        :LOAD
      end,
      def decode(336) do
        :COLLATION
      end,
      def decode(369) do
        :CYCLE
      end,
      def decode(0) do
        :NUL
      end,
      def decode(533) do
        :NAME_P
      end,
      def decode(348) do
        :CONNECTION
      end,
      def decode(560) do
        :OFF
      end,
      def decode(736) do
        :VARIADIC
      end,
      def decode(743) do
        :WHEN
      end,
      def decode(760) do
        :XMLPARSE
      end,
      def decode(659) do
        :SETS
      end,
      def decode(60) do
        :ASCII_60
      end,
      def decode(406) do
        :ERROR_P
      end,
      def decode(599) do
        :PREPARED
      end,
      def decode(372) do
        :DAY_P
      end,
      def decode(370) do
        :DATA_P
      end,
      def decode(738) do
        :VERBOSE
      end,
      def decode(643) do
        :SAVEPOINT
      end,
      def decode(638) do
        :ROUTINE
      end,
      def decode(494) do
        :JSON_TABLE
      end,
      def decode(524) do
        :MAXVALUE
      end,
      def decode(597) do
        :PRESERVE
      end,
      def decode(410) do
        :EXCLUDE
      end,
      def decode(775) do
        :MODE_PLPGSQL_ASSIGN1
      end,
      def decode(776) do
        :MODE_PLPGSQL_ASSIGN2
      end,
      def decode(732) do
        :VALIDATOR
      end,
      def decode(361) do
        :CURRENT_CATALOG
      end,
      def decode(767) do
        :ZONE
      end,
      def decode(648) do
        :SEARCH
      end,
      def decode(358) do
        :CSV
      end,
      def decode(404) do
        :END_P
      end,
      def decode(576) do
        :OVER
      end,
      def decode(380) do
        :DEFERRED
      end,
      def decode(346) do
        :CONFIGURATION
      end,
      def decode(437) do
        :FUNCTIONS
      end,
      def decode(389) do
        :DICTIONARY
      end,
      def decode(654) do
        :SERIALIZABLE
      end,
      def decode(632) do
        :RETURNS
      end,
      def decode(459) do
        :INCLUDE
      end,
      def decode(693) do
        :TABLESPACE
      end,
      def decode(640) do
        :ROW
      end,
      def decode(284) do
        :AFTER
      end,
      def decode(317) do
        :CACHE
      end,
      def decode(454) do
        :IMMEDIATE
      end,
      def decode(262) do
        :USCONST
      end,
      def decode(545) do
        :NO
      end,
      def decode(281) do
        :ACTION
      end,
      def decode(480) do
        :INVOKER
      end,
      def decode(58) do
        :ASCII_58
      end,
      def decode(565) do
        :ON
      end,
      def decode(625) do
        :REPLACE
      end,
      def decode(412) do
        :EXCLUSIVE
      end,
      def decode(725) do
        :UNTIL
      end,
      def decode(323) do
        :CAST
      end,
      def decode(682) do
        :STRIP_P
      end,
      def decode(511) do
        :LISTEN
      end,
      def decode(344) do
        :CONCURRENTLY
      end,
      def decode(574) do
        :OUT_P
      end,
      def decode(514) do
        :LOCALTIME
      end,
      def decode(310) do
        :BIGINT
      end,
      def decode(423) do
        :FILTER
      end,
      def decode(656) do
        :SESSION
      end,
      def decode(587) do
        :PASSING
      end,
      def decode(382) do
        :DELETE_P
      end,
      def decode(472) do
        :INSENSITIVE
      end,
      def decode(360) do
        :CURRENT_P
      end,
      def decode(452) do
        :IF_P
      end,
      def decode(265) do
        :Op
      end,
      def decode(420) do
        :FALSE_P
      end,
      def decode(436) do
        :FUNCTION
      end,
      def decode(591) do
        :PLAN
      end,
      def decode(705) do
        :TRANSACTION
      end,
      def decode(473) do
        :INSERT
      end,
      def decode(570) do
        :OR
      end,
      def decode(641) do
        :ROWS
      end,
      def decode(453) do
        :ILIKE
      end,
      def decode(491) do
        :JSON_QUERY
      end,
      def decode(324) do
        :CATALOG_P
      end,
      def decode(259) do
        :UIDENT
      end,
      def decode(509) do
        :LIKE
      end,
      def decode(283) do
        :ADMIN
      end,
      def decode(503) do
        :LATERAL_P
      end,
      def decode(349) do
        :CONSTRAINT
      end,
      def decode(318) do
        :CALL
      end,
      def decode(398) do
        :EACH
      end,
      def decode(529) do
        :MINVALUE
      end,
      def decode(609) do
        :QUOTES
      end,
      def decode(275) do
        :SQL_COMMENT
      end,
      def decode(337) do
        :COLUMN
      end,
      def decode(765) do
        :YEAR_P
      end,
      def decode(727) do
        :USER
      end,
      def decode(585) do
        :PARTIAL
      end,
      def decode(321) do
        :CASCADED
      end,
      def decode(759) do
        :XMLNAMESPACES
      end,
      def decode(320) do
        :CASCADE
      end,
      def decode(371) do
        :DATABASE
      end,
      def decode(675) do
        :STATISTICS
      end,
      def decode(702) do
        :TIMESTAMP
      end,
      def decode(351) do
        :CONTENT_P
      end,
      def decode(426) do
        :FLOAT_P
      end,
      def decode(631) do
        :RETURNING
      end,
      def decode(687) do
        :SYSID
      end,
      def decode(510) do
        :LIMIT
      end,
      def decode(610) do
        :RANGE
      end,
      def decode(644) do
        :SCALAR
      end,
      def decode(474) do
        :INSTEAD
      end,
      def decode(91) do
        :ASCII_91
      end,
      def decode(61) do
        :ASCII_61
      end,
      def decode(771) do
        :WITH_LA
      end,
      def decode(761) do
        :XMLPI
      end,
      def decode(691) do
        :TABLES
      end,
      def decode(517) do
        :LOCK_P
      end,
      def decode(489) do
        :JSON_OBJECT
      end,
      def decode(730) do
        :VALID
      end,
      def decode(664) do
        :SIMPLE
      end,
      def decode(580) do
        :OWNED
      end,
      def decode(493) do
        :JSON_SERIALIZE
      end,
      def decode(483) do
        :ISOLATION
      end,
      def decode(387) do
        :DESC
      end,
      def decode(278) do
        :ABSENT
      end,
      def decode(334) do
        :COALESCE
      end,
      def decode(536) do
        :NATURAL
      end,
      def decode(748) do
        :WITHIN
      end,
      def decode(490) do
        :JSON_OBJECTAGG
      end,
      def decode(679) do
        :STORED
      end,
      def decode(347) do
        :CONFLICT
      end,
      def decode(397) do
        :DROP
      end,
      def decode(355) do
        :COST
      end,
      def decode(401) do
        :ENABLE_P
      end,
      def decode(277) do
        :ABORT_P
      end,
      def decode(628) do
        :RESTART
      end,
      def decode(41) do
        :ASCII_41
      end,
      def decode(37) do
        :ASCII_37
      end,
      def decode(458) do
        :IN_P
      end,
      def decode(374) do
        :DEC
      end,
      def decode(378) do
        :DEFAULTS
      end,
      def decode(271) do
        :EQUALS_GREATER
      end,
      def decode(485) do
        :JSON
      end,
      def decode(357) do
        :CROSS
      end,
      def decode(520) do
        :MAPPING
      end,
      def decode(327) do
        :CHARACTER
      end,
      def decode(651) do
        :SELECT
      end,
      def decode(338) do
        :COLUMNS
      end,
      def decode(567) do
        :OPERATOR
      end,
      def decode(563) do
        :OLD
      end,
      def decode(522) do
        :MATCHED
      end,
      def decode(662) do
        :SHOW
      end,
      def decode(531) do
        :MONTH_P
      end,
      def decode(261) do
        :SCONST
      end,
      def decode(689) do
        :SYSTEM_USER
      end,
      def decode(633) do
        :REVOKE
      end,
      def decode(428) do
        :FOR
      end,
      def decode(657) do
        :SESSION_USER
      end,
      def decode(513) do
        :LOCAL
      end,
      def decode(391) do
        :DISCARD
      end,
      def decode(417) do
        :EXTENSION
      end,
      def decode(461) do
        :INCREMENT
      end,
      def decode(294) do
        :ARRAY
      end,
      def decode(539) do
        :NEW
      end,
      def decode(647) do
        :SCROLL
      end,
      def decode(676) do
        :STDIN
      end,
      def decode(288) do
        :ALTER
      end,
      def decode(498) do
        :KEYS
      end,
      def decode(521) do
        :MATCH
      end,
      def decode(266) do
        :ICONST
      end,
      def decode(688) do
        :SYSTEM_P
      end,
      def decode(379) do
        :DEFERRABLE
      end,
      def decode(312) do
        :BIT
      end,
      def decode(724) do
        :UNLOGGED
      end,
      def decode(446) do
        :HANDLER
      end,
      def decode(749) do
        :WITHOUT
      end,
      def decode(542) do
        :NFD
      end,
      def decode(393) do
        :DO
      end,
      def decode(455) do
        :IMMUTABLE
      end,
      def decode(769) do
        :NOT_LA
      end,
      def decode(515) do
        :LOCALTIMESTAMP
      end,
      def decode(479) do
        :INTO
      end,
      def decode(764) do
        :XMLTABLE
      end,
      def decode(734) do
        :VALUES
      end,
      def decode(696) do
        :TEMPLATE
      end,
      def decode(673) do
        :START
      end,
      def decode(667) do
        :SNAPSHOT
      end,
      def decode(592) do
        :PLANS
      end,
      def decode(711) do
        :TRUNCATE
      end,
      def decode(737) do
        :VARYING
      end,
      def decode(439) do
        :GLOBAL
      end,
      def decode(93) do
        :ASCII_93
      end,
      def decode(268) do
        :TYPECAST
      end,
      def decode(484) do
        :JOIN
      end,
      def decode(672) do
        :STANDALONE_P
      end,
      def decode(328) do
        :CHARACTERISTICS
      end,
      def decode(666) do
        :SMALLINT
      end,
      def decode(627) do
        :RESET
      end,
      def decode(714) do
        :TYPES_P
      end,
      def decode(692) do
        :TABLESAMPLE
      end,
      def decode(650) do
        :SECURITY
      end,
      def decode(286) do
        :ALL
      end,
      def decode(747) do
        :WITH
      end,
      def decode(710) do
        :TRUE_P
      end,
      def decode(671) do
        :STABLE
      end
    ]

    def decode(x) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def constants() do
      [
        {0, :NUL},
        {36, :ASCII_36},
        {37, :ASCII_37},
        {40, :ASCII_40},
        {41, :ASCII_41},
        {42, :ASCII_42},
        {43, :ASCII_43},
        {44, :ASCII_44},
        {45, :ASCII_45},
        {46, :ASCII_46},
        {47, :ASCII_47},
        {58, :ASCII_58},
        {59, :ASCII_59},
        {60, :ASCII_60},
        {61, :ASCII_61},
        {62, :ASCII_62},
        {63, :ASCII_63},
        {91, :ASCII_91},
        {92, :ASCII_92},
        {93, :ASCII_93},
        {94, :ASCII_94},
        {258, :IDENT},
        {259, :UIDENT},
        {260, :FCONST},
        {261, :SCONST},
        {262, :USCONST},
        {263, :BCONST},
        {264, :XCONST},
        {265, :Op},
        {266, :ICONST},
        {267, :PARAM},
        {268, :TYPECAST},
        {269, :DOT_DOT},
        {270, :COLON_EQUALS},
        {271, :EQUALS_GREATER},
        {272, :LESS_EQUALS},
        {273, :GREATER_EQUALS},
        {274, :NOT_EQUALS},
        {275, :SQL_COMMENT},
        {276, :C_COMMENT},
        {277, :ABORT_P},
        {278, :ABSENT},
        {279, :ABSOLUTE_P},
        {280, :ACCESS},
        {281, :ACTION},
        {282, :ADD_P},
        {283, :ADMIN},
        {284, :AFTER},
        {285, :AGGREGATE},
        {286, :ALL},
        {287, :ALSO},
        {288, :ALTER},
        {289, :ALWAYS},
        {290, :ANALYSE},
        {291, :ANALYZE},
        {292, :AND},
        {293, :ANY},
        {294, :ARRAY},
        {295, :AS},
        {296, :ASC},
        {297, :ASENSITIVE},
        {298, :ASSERTION},
        {299, :ASSIGNMENT},
        {300, :ASYMMETRIC},
        {301, :ATOMIC},
        {302, :AT},
        {303, :ATTACH},
        {304, :ATTRIBUTE},
        {305, :AUTHORIZATION},
        {306, :BACKWARD},
        {307, :BEFORE},
        {308, :BEGIN_P},
        {309, :BETWEEN},
        {310, :BIGINT},
        {311, :BINARY},
        {312, :BIT},
        {313, :BOOLEAN_P},
        {314, :BOTH},
        {315, :BREADTH},
        {316, :BY},
        {317, :CACHE},
        {318, :CALL},
        {319, :CALLED},
        {320, :CASCADE},
        {321, :CASCADED},
        {322, :CASE},
        {323, :CAST},
        {324, :CATALOG_P},
        {325, :CHAIN},
        {326, :CHAR_P},
        {327, :CHARACTER},
        {328, :CHARACTERISTICS},
        {329, :CHECK},
        {330, :CHECKPOINT},
        {331, :CLASS},
        {332, :CLOSE},
        {333, :CLUSTER},
        {334, :COALESCE},
        {335, :COLLATE},
        {336, :COLLATION},
        {337, :COLUMN},
        {338, :COLUMNS},
        {339, :COMMENT},
        {340, :COMMENTS},
        {341, :COMMIT},
        {342, :COMMITTED},
        {343, :COMPRESSION},
        {344, :CONCURRENTLY},
        {345, :CONDITIONAL},
        {346, :CONFIGURATION},
        {347, :CONFLICT},
        {348, :CONNECTION},
        {349, :CONSTRAINT},
        {350, :CONSTRAINTS},
        {351, :CONTENT_P},
        {352, :CONTINUE_P},
        {353, :CONVERSION_P},
        {354, :COPY},
        {355, :COST},
        {356, :CREATE},
        {357, :CROSS},
        {358, :CSV},
        {359, :CUBE},
        {360, :CURRENT_P},
        {361, :CURRENT_CATALOG},
        {362, :CURRENT_DATE},
        {363, :CURRENT_ROLE},
        {364, :CURRENT_SCHEMA},
        {365, :CURRENT_TIME},
        {366, :CURRENT_TIMESTAMP},
        {367, :CURRENT_USER},
        {368, :CURSOR},
        {369, :CYCLE},
        {370, :DATA_P},
        {371, :DATABASE},
        {372, :DAY_P},
        {373, :DEALLOCATE},
        {374, :DEC},
        {375, :DECIMAL_P},
        {376, :DECLARE},
        {377, :DEFAULT},
        {378, :DEFAULTS},
        {379, :DEFERRABLE},
        {380, :DEFERRED},
        {381, :DEFINER},
        {382, :DELETE_P},
        {383, :DELIMITER},
        {384, :DELIMITERS},
        {385, :DEPENDS},
        {386, :DEPTH},
        {387, :DESC},
        {388, :DETACH},
        {389, :DICTIONARY},
        {390, :DISABLE_P},
        {391, :DISCARD},
        {392, :DISTINCT},
        {393, :DO},
        {394, :DOCUMENT_P},
        {395, :DOMAIN_P},
        {396, :DOUBLE_P},
        {397, :DROP},
        {398, :EACH},
        {399, :ELSE},
        {400, :EMPTY_P},
        {401, :ENABLE_P},
        {402, :ENCODING},
        {403, :ENCRYPTED},
        {404, :END_P},
        {405, :ENUM_P},
        {406, :ERROR_P},
        {407, :ESCAPE},
        {408, :EVENT},
        {409, :EXCEPT},
        {410, :EXCLUDE},
        {411, :EXCLUDING},
        {412, :EXCLUSIVE},
        {413, :EXECUTE},
        {414, :EXISTS},
        {415, :EXPLAIN},
        {416, :EXPRESSION},
        {417, :EXTENSION},
        {418, :EXTERNAL},
        {419, :EXTRACT},
        {420, :FALSE_P},
        {421, :FAMILY},
        {422, :FETCH},
        {423, :FILTER},
        {424, :FINALIZE},
        {425, :FIRST_P},
        {426, :FLOAT_P},
        {427, :FOLLOWING},
        {428, :FOR},
        {429, :FORCE},
        {430, :FOREIGN},
        {431, :FORMAT},
        {432, :FORWARD},
        {433, :FREEZE},
        {434, :FROM},
        {435, :FULL},
        {436, :FUNCTION},
        {437, :FUNCTIONS},
        {438, :GENERATED},
        {439, :GLOBAL},
        {440, :GRANT},
        {441, :GRANTED},
        {442, :GREATEST},
        {443, :GROUP_P},
        {444, :GROUPING},
        {445, :GROUPS},
        {446, :HANDLER},
        {447, :HAVING},
        {448, :HEADER_P},
        {449, :HOLD},
        {450, :HOUR_P},
        {451, :IDENTITY_P},
        {452, :IF_P},
        {453, :ILIKE},
        {454, :IMMEDIATE},
        {455, :IMMUTABLE},
        {456, :IMPLICIT_P},
        {457, :IMPORT_P},
        {458, :IN_P},
        {459, :INCLUDE},
        {460, :INCLUDING},
        {461, :INCREMENT},
        {462, :INDENT},
        {463, :INDEX},
        {464, :INDEXES},
        {465, :INHERIT},
        {466, :INHERITS},
        {467, :INITIALLY},
        {468, :INLINE_P},
        {469, :INNER_P},
        {470, :INOUT},
        {471, :INPUT_P},
        {472, :INSENSITIVE},
        {473, :INSERT},
        {474, :INSTEAD},
        {475, :INT_P},
        {476, :INTEGER},
        {477, :INTERSECT},
        {478, :INTERVAL},
        {479, :INTO},
        {480, :INVOKER},
        {481, :IS},
        {482, :ISNULL},
        {483, :ISOLATION},
        {484, :JOIN},
        {485, :JSON},
        {486, :JSON_ARRAY},
        {487, :JSON_ARRAYAGG},
        {488, :JSON_EXISTS},
        {489, :JSON_OBJECT},
        {490, :JSON_OBJECTAGG},
        {491, :JSON_QUERY},
        {492, :JSON_SCALAR},
        {493, :JSON_SERIALIZE},
        {494, :JSON_TABLE},
        {495, :JSON_VALUE},
        {496, :KEEP},
        {497, :KEY},
        {498, :KEYS},
        {499, :LABEL},
        {500, :LANGUAGE},
        {501, :LARGE_P},
        {502, :LAST_P},
        {503, :LATERAL_P},
        {504, :LEADING},
        {505, :LEAKPROOF},
        {506, :LEAST},
        {507, :LEFT},
        {508, :LEVEL},
        {509, :LIKE},
        {510, :LIMIT},
        {511, :LISTEN},
        {512, :LOAD},
        {513, :LOCAL},
        {514, :LOCALTIME},
        {515, :LOCALTIMESTAMP},
        {516, :LOCATION},
        {517, :LOCK_P},
        {518, :LOCKED},
        {519, :LOGGED},
        {520, :MAPPING},
        {521, :MATCH},
        {522, :MATCHED},
        {523, :MATERIALIZED},
        {524, :MAXVALUE},
        {525, :MERGE},
        {526, :MERGE_ACTION},
        {527, :METHOD},
        {528, :MINUTE_P},
        {529, :MINVALUE},
        {530, :MODE},
        {531, :MONTH_P},
        {532, :MOVE},
        {533, :NAME_P},
        {534, :NAMES},
        {535, :NATIONAL},
        {536, :NATURAL},
        {537, :NCHAR},
        {538, :NESTED},
        {539, :NEW},
        {540, :NEXT},
        {541, :NFC},
        {542, :NFD},
        {543, :NFKC},
        {544, :NFKD},
        {545, :NO},
        {546, :NONE},
        {547, :NORMALIZE},
        {548, :NORMALIZED},
        {549, :NOT},
        {550, :NOTHING},
        {551, :NOTIFY},
        {552, :NOTNULL},
        {553, :NOWAIT},
        {554, :NULL_P},
        {555, :NULLIF},
        {556, :NULLS_P},
        {557, :NUMERIC},
        {558, :OBJECT_P},
        {559, :OF},
        {560, :OFF},
        {561, :OFFSET},
        {562, :OIDS},
        {563, :OLD},
        {564, :OMIT},
        {565, :ON},
        {566, :ONLY},
        {567, :OPERATOR},
        {568, :OPTION},
        {569, :OPTIONS},
        {570, :OR},
        {571, :ORDER},
        {572, :ORDINALITY},
        {573, :OTHERS},
        {574, :OUT_P},
        {575, :OUTER_P},
        {576, :OVER},
        {577, :OVERLAPS},
        {578, :OVERLAY},
        {579, :OVERRIDING},
        {580, :OWNED},
        {581, :OWNER},
        {582, :PARALLEL},
        {583, :PARAMETER},
        {584, :PARSER},
        {585, :PARTIAL},
        {586, :PARTITION},
        {587, :PASSING},
        {588, :PASSWORD},
        {589, :PATH},
        {590, :PLACING},
        {591, :PLAN},
        {592, :PLANS},
        {593, :POLICY},
        {594, :POSITION},
        {595, :PRECEDING},
        {596, :PRECISION},
        {597, :PRESERVE},
        {598, :PREPARE},
        {599, :PREPARED},
        {600, :PRIMARY},
        {601, :PRIOR},
        {602, :PRIVILEGES},
        {603, :PROCEDURAL},
        {604, :PROCEDURE},
        {605, :PROCEDURES},
        {606, :PROGRAM},
        {607, :PUBLICATION},
        {608, :QUOTE},
        {609, :QUOTES},
        {610, :RANGE},
        {611, :READ},
        {612, :REAL},
        {613, :REASSIGN},
        {614, :RECHECK},
        {615, :RECURSIVE},
        {616, :REF_P},
        {617, :REFERENCES},
        {618, :REFERENCING},
        {619, :REFRESH},
        {620, :REINDEX},
        {621, :RELATIVE_P},
        {622, :RELEASE},
        {623, :RENAME},
        {624, :REPEATABLE},
        {625, :REPLACE},
        {626, :REPLICA},
        {627, :RESET},
        {628, :RESTART},
        {629, :RESTRICT},
        {630, :RETURN},
        {631, :RETURNING},
        {632, :RETURNS},
        {633, :REVOKE},
        {634, :RIGHT},
        {635, :ROLE},
        {636, :ROLLBACK},
        {637, :ROLLUP},
        {638, :ROUTINE},
        {639, :ROUTINES},
        {640, :ROW},
        {641, :ROWS},
        {642, :RULE},
        {643, :SAVEPOINT},
        {644, :SCALAR},
        {645, :SCHEMA},
        {646, :SCHEMAS},
        {647, :SCROLL},
        {648, :SEARCH},
        {649, :SECOND_P},
        {650, :SECURITY},
        {651, :SELECT},
        {652, :SEQUENCE},
        {653, :SEQUENCES},
        {654, :SERIALIZABLE},
        {655, :SERVER},
        {656, :SESSION},
        {657, :SESSION_USER},
        {658, :SET},
        {659, :SETS},
        {660, :SETOF},
        {661, :SHARE},
        {662, :SHOW},
        {663, :SIMILAR},
        {664, :SIMPLE},
        {665, :SKIP},
        {666, :SMALLINT},
        {667, :SNAPSHOT},
        {668, :SOME},
        {669, :SOURCE},
        {670, :SQL_P},
        {671, :STABLE},
        {672, :STANDALONE_P},
        {673, :START},
        {674, :STATEMENT},
        {675, :STATISTICS},
        {676, :STDIN},
        {677, :STDOUT},
        {678, :STORAGE},
        {679, :STORED},
        {680, :STRICT_P},
        {681, :STRING_P},
        {682, :STRIP_P},
        {683, :SUBSCRIPTION},
        {684, :SUBSTRING},
        {685, :SUPPORT},
        {686, :SYMMETRIC},
        {687, :SYSID},
        {688, :SYSTEM_P},
        {689, :SYSTEM_USER},
        {690, :TABLE},
        {691, :TABLES},
        {692, :TABLESAMPLE},
        {693, :TABLESPACE},
        {694, :TARGET},
        {695, :TEMP},
        {696, :TEMPLATE},
        {697, :TEMPORARY},
        {698, :TEXT_P},
        {699, :THEN},
        {700, :TIES},
        {701, :TIME},
        {702, :TIMESTAMP},
        {703, :TO},
        {704, :TRAILING},
        {705, :TRANSACTION},
        {706, :TRANSFORM},
        {707, :TREAT},
        {708, :TRIGGER},
        {709, :TRIM},
        {710, :TRUE_P},
        {711, :TRUNCATE},
        {712, :TRUSTED},
        {713, :TYPE_P},
        {714, :TYPES_P},
        {715, :UESCAPE},
        {716, :UNBOUNDED},
        {717, :UNCONDITIONAL},
        {718, :UNCOMMITTED},
        {719, :UNENCRYPTED},
        {720, :UNION},
        {721, :UNIQUE},
        {722, :UNKNOWN},
        {723, :UNLISTEN},
        {724, :UNLOGGED},
        {725, :UNTIL},
        {726, :UPDATE},
        {727, :USER},
        {728, :USING},
        {729, :VACUUM},
        {730, :VALID},
        {731, :VALIDATE},
        {732, :VALIDATOR},
        {733, :VALUE_P},
        {734, :VALUES},
        {735, :VARCHAR},
        {736, :VARIADIC},
        {737, :VARYING},
        {738, :VERBOSE},
        {739, :VERSION_P},
        {740, :VIEW},
        {741, :VIEWS},
        {742, :VOLATILE},
        {743, :WHEN},
        {744, :WHERE},
        {745, :WHITESPACE_P},
        {746, :WINDOW},
        {747, :WITH},
        {748, :WITHIN},
        {749, :WITHOUT},
        {750, :WORK},
        {751, :WRAPPER},
        {752, :WRITE},
        {753, :XML_P},
        {754, :XMLATTRIBUTES},
        {755, :XMLCONCAT},
        {756, :XMLELEMENT},
        {757, :XMLEXISTS},
        {758, :XMLFOREST},
        {759, :XMLNAMESPACES},
        {760, :XMLPARSE},
        {761, :XMLPI},
        {762, :XMLROOT},
        {763, :XMLSERIALIZE},
        {764, :XMLTABLE},
        {765, :YEAR_P},
        {766, :YES_P},
        {767, :ZONE},
        {768, :FORMAT_LA},
        {769, :NOT_LA},
        {770, :NULLS_LA},
        {771, :WITH_LA},
        {772, :WITHOUT_LA},
        {773, :MODE_TYPE_NAME},
        {774, :MODE_PLPGSQL_EXPR},
        {775, :MODE_PLPGSQL_ASSIGN1},
        {776, :MODE_PLPGSQL_ASSIGN2},
        {777, :MODE_PLPGSQL_ASSIGN3},
        {778, :UMINUS}
      ]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def has_constant?(:NUL) do
          true
        end,
        def has_constant?(:ASCII_36) do
          true
        end,
        def has_constant?(:ASCII_37) do
          true
        end,
        def has_constant?(:ASCII_40) do
          true
        end,
        def has_constant?(:ASCII_41) do
          true
        end,
        def has_constant?(:ASCII_42) do
          true
        end,
        def has_constant?(:ASCII_43) do
          true
        end,
        def has_constant?(:ASCII_44) do
          true
        end,
        def has_constant?(:ASCII_45) do
          true
        end,
        def has_constant?(:ASCII_46) do
          true
        end,
        def has_constant?(:ASCII_47) do
          true
        end,
        def has_constant?(:ASCII_58) do
          true
        end,
        def has_constant?(:ASCII_59) do
          true
        end,
        def has_constant?(:ASCII_60) do
          true
        end,
        def has_constant?(:ASCII_61) do
          true
        end,
        def has_constant?(:ASCII_62) do
          true
        end,
        def has_constant?(:ASCII_63) do
          true
        end,
        def has_constant?(:ASCII_91) do
          true
        end,
        def has_constant?(:ASCII_92) do
          true
        end,
        def has_constant?(:ASCII_93) do
          true
        end,
        def has_constant?(:ASCII_94) do
          true
        end,
        def has_constant?(:IDENT) do
          true
        end,
        def has_constant?(:UIDENT) do
          true
        end,
        def has_constant?(:FCONST) do
          true
        end,
        def has_constant?(:SCONST) do
          true
        end,
        def has_constant?(:USCONST) do
          true
        end,
        def has_constant?(:BCONST) do
          true
        end,
        def has_constant?(:XCONST) do
          true
        end,
        def has_constant?(:Op) do
          true
        end,
        def has_constant?(:ICONST) do
          true
        end,
        def has_constant?(:PARAM) do
          true
        end,
        def has_constant?(:TYPECAST) do
          true
        end,
        def has_constant?(:DOT_DOT) do
          true
        end,
        def has_constant?(:COLON_EQUALS) do
          true
        end,
        def has_constant?(:EQUALS_GREATER) do
          true
        end,
        def has_constant?(:LESS_EQUALS) do
          true
        end,
        def has_constant?(:GREATER_EQUALS) do
          true
        end,
        def has_constant?(:NOT_EQUALS) do
          true
        end,
        def has_constant?(:SQL_COMMENT) do
          true
        end,
        def has_constant?(:C_COMMENT) do
          true
        end,
        def has_constant?(:ABORT_P) do
          true
        end,
        def has_constant?(:ABSENT) do
          true
        end,
        def has_constant?(:ABSOLUTE_P) do
          true
        end,
        def has_constant?(:ACCESS) do
          true
        end,
        def has_constant?(:ACTION) do
          true
        end,
        def has_constant?(:ADD_P) do
          true
        end,
        def has_constant?(:ADMIN) do
          true
        end,
        def has_constant?(:AFTER) do
          true
        end,
        def has_constant?(:AGGREGATE) do
          true
        end,
        def has_constant?(:ALL) do
          true
        end,
        def has_constant?(:ALSO) do
          true
        end,
        def has_constant?(:ALTER) do
          true
        end,
        def has_constant?(:ALWAYS) do
          true
        end,
        def has_constant?(:ANALYSE) do
          true
        end,
        def has_constant?(:ANALYZE) do
          true
        end,
        def has_constant?(:AND) do
          true
        end,
        def has_constant?(:ANY) do
          true
        end,
        def has_constant?(:ARRAY) do
          true
        end,
        def has_constant?(:AS) do
          true
        end,
        def has_constant?(:ASC) do
          true
        end,
        def has_constant?(:ASENSITIVE) do
          true
        end,
        def has_constant?(:ASSERTION) do
          true
        end,
        def has_constant?(:ASSIGNMENT) do
          true
        end,
        def has_constant?(:ASYMMETRIC) do
          true
        end,
        def has_constant?(:ATOMIC) do
          true
        end,
        def has_constant?(:AT) do
          true
        end,
        def has_constant?(:ATTACH) do
          true
        end,
        def has_constant?(:ATTRIBUTE) do
          true
        end,
        def has_constant?(:AUTHORIZATION) do
          true
        end,
        def has_constant?(:BACKWARD) do
          true
        end,
        def has_constant?(:BEFORE) do
          true
        end,
        def has_constant?(:BEGIN_P) do
          true
        end,
        def has_constant?(:BETWEEN) do
          true
        end,
        def has_constant?(:BIGINT) do
          true
        end,
        def has_constant?(:BINARY) do
          true
        end,
        def has_constant?(:BIT) do
          true
        end,
        def has_constant?(:BOOLEAN_P) do
          true
        end,
        def has_constant?(:BOTH) do
          true
        end,
        def has_constant?(:BREADTH) do
          true
        end,
        def has_constant?(:BY) do
          true
        end,
        def has_constant?(:CACHE) do
          true
        end,
        def has_constant?(:CALL) do
          true
        end,
        def has_constant?(:CALLED) do
          true
        end,
        def has_constant?(:CASCADE) do
          true
        end,
        def has_constant?(:CASCADED) do
          true
        end,
        def has_constant?(:CASE) do
          true
        end,
        def has_constant?(:CAST) do
          true
        end,
        def has_constant?(:CATALOG_P) do
          true
        end,
        def has_constant?(:CHAIN) do
          true
        end,
        def has_constant?(:CHAR_P) do
          true
        end,
        def has_constant?(:CHARACTER) do
          true
        end,
        def has_constant?(:CHARACTERISTICS) do
          true
        end,
        def has_constant?(:CHECK) do
          true
        end,
        def has_constant?(:CHECKPOINT) do
          true
        end,
        def has_constant?(:CLASS) do
          true
        end,
        def has_constant?(:CLOSE) do
          true
        end,
        def has_constant?(:CLUSTER) do
          true
        end,
        def has_constant?(:COALESCE) do
          true
        end,
        def has_constant?(:COLLATE) do
          true
        end,
        def has_constant?(:COLLATION) do
          true
        end,
        def has_constant?(:COLUMN) do
          true
        end,
        def has_constant?(:COLUMNS) do
          true
        end,
        def has_constant?(:COMMENT) do
          true
        end,
        def has_constant?(:COMMENTS) do
          true
        end,
        def has_constant?(:COMMIT) do
          true
        end,
        def has_constant?(:COMMITTED) do
          true
        end,
        def has_constant?(:COMPRESSION) do
          true
        end,
        def has_constant?(:CONCURRENTLY) do
          true
        end,
        def has_constant?(:CONDITIONAL) do
          true
        end,
        def has_constant?(:CONFIGURATION) do
          true
        end,
        def has_constant?(:CONFLICT) do
          true
        end,
        def has_constant?(:CONNECTION) do
          true
        end,
        def has_constant?(:CONSTRAINT) do
          true
        end,
        def has_constant?(:CONSTRAINTS) do
          true
        end,
        def has_constant?(:CONTENT_P) do
          true
        end,
        def has_constant?(:CONTINUE_P) do
          true
        end,
        def has_constant?(:CONVERSION_P) do
          true
        end,
        def has_constant?(:COPY) do
          true
        end,
        def has_constant?(:COST) do
          true
        end,
        def has_constant?(:CREATE) do
          true
        end,
        def has_constant?(:CROSS) do
          true
        end,
        def has_constant?(:CSV) do
          true
        end,
        def has_constant?(:CUBE) do
          true
        end,
        def has_constant?(:CURRENT_P) do
          true
        end,
        def has_constant?(:CURRENT_CATALOG) do
          true
        end,
        def has_constant?(:CURRENT_DATE) do
          true
        end,
        def has_constant?(:CURRENT_ROLE) do
          true
        end,
        def has_constant?(:CURRENT_SCHEMA) do
          true
        end,
        def has_constant?(:CURRENT_TIME) do
          true
        end,
        def has_constant?(:CURRENT_TIMESTAMP) do
          true
        end,
        def has_constant?(:CURRENT_USER) do
          true
        end,
        def has_constant?(:CURSOR) do
          true
        end,
        def has_constant?(:CYCLE) do
          true
        end,
        def has_constant?(:DATA_P) do
          true
        end,
        def has_constant?(:DATABASE) do
          true
        end,
        def has_constant?(:DAY_P) do
          true
        end,
        def has_constant?(:DEALLOCATE) do
          true
        end,
        def has_constant?(:DEC) do
          true
        end,
        def has_constant?(:DECIMAL_P) do
          true
        end,
        def has_constant?(:DECLARE) do
          true
        end,
        def has_constant?(:DEFAULT) do
          true
        end,
        def has_constant?(:DEFAULTS) do
          true
        end,
        def has_constant?(:DEFERRABLE) do
          true
        end,
        def has_constant?(:DEFERRED) do
          true
        end,
        def has_constant?(:DEFINER) do
          true
        end,
        def has_constant?(:DELETE_P) do
          true
        end,
        def has_constant?(:DELIMITER) do
          true
        end,
        def has_constant?(:DELIMITERS) do
          true
        end,
        def has_constant?(:DEPENDS) do
          true
        end,
        def has_constant?(:DEPTH) do
          true
        end,
        def has_constant?(:DESC) do
          true
        end,
        def has_constant?(:DETACH) do
          true
        end,
        def has_constant?(:DICTIONARY) do
          true
        end,
        def has_constant?(:DISABLE_P) do
          true
        end,
        def has_constant?(:DISCARD) do
          true
        end,
        def has_constant?(:DISTINCT) do
          true
        end,
        def has_constant?(:DO) do
          true
        end,
        def has_constant?(:DOCUMENT_P) do
          true
        end,
        def has_constant?(:DOMAIN_P) do
          true
        end,
        def has_constant?(:DOUBLE_P) do
          true
        end,
        def has_constant?(:DROP) do
          true
        end,
        def has_constant?(:EACH) do
          true
        end,
        def has_constant?(:ELSE) do
          true
        end,
        def has_constant?(:EMPTY_P) do
          true
        end,
        def has_constant?(:ENABLE_P) do
          true
        end,
        def has_constant?(:ENCODING) do
          true
        end,
        def has_constant?(:ENCRYPTED) do
          true
        end,
        def has_constant?(:END_P) do
          true
        end,
        def has_constant?(:ENUM_P) do
          true
        end,
        def has_constant?(:ERROR_P) do
          true
        end,
        def has_constant?(:ESCAPE) do
          true
        end,
        def has_constant?(:EVENT) do
          true
        end,
        def has_constant?(:EXCEPT) do
          true
        end,
        def has_constant?(:EXCLUDE) do
          true
        end,
        def has_constant?(:EXCLUDING) do
          true
        end,
        def has_constant?(:EXCLUSIVE) do
          true
        end,
        def has_constant?(:EXECUTE) do
          true
        end,
        def has_constant?(:EXISTS) do
          true
        end,
        def has_constant?(:EXPLAIN) do
          true
        end,
        def has_constant?(:EXPRESSION) do
          true
        end,
        def has_constant?(:EXTENSION) do
          true
        end,
        def has_constant?(:EXTERNAL) do
          true
        end,
        def has_constant?(:EXTRACT) do
          true
        end,
        def has_constant?(:FALSE_P) do
          true
        end,
        def has_constant?(:FAMILY) do
          true
        end,
        def has_constant?(:FETCH) do
          true
        end,
        def has_constant?(:FILTER) do
          true
        end,
        def has_constant?(:FINALIZE) do
          true
        end,
        def has_constant?(:FIRST_P) do
          true
        end,
        def has_constant?(:FLOAT_P) do
          true
        end,
        def has_constant?(:FOLLOWING) do
          true
        end,
        def has_constant?(:FOR) do
          true
        end,
        def has_constant?(:FORCE) do
          true
        end,
        def has_constant?(:FOREIGN) do
          true
        end,
        def has_constant?(:FORMAT) do
          true
        end,
        def has_constant?(:FORWARD) do
          true
        end,
        def has_constant?(:FREEZE) do
          true
        end,
        def has_constant?(:FROM) do
          true
        end,
        def has_constant?(:FULL) do
          true
        end,
        def has_constant?(:FUNCTION) do
          true
        end,
        def has_constant?(:FUNCTIONS) do
          true
        end,
        def has_constant?(:GENERATED) do
          true
        end,
        def has_constant?(:GLOBAL) do
          true
        end,
        def has_constant?(:GRANT) do
          true
        end,
        def has_constant?(:GRANTED) do
          true
        end,
        def has_constant?(:GREATEST) do
          true
        end,
        def has_constant?(:GROUP_P) do
          true
        end,
        def has_constant?(:GROUPING) do
          true
        end,
        def has_constant?(:GROUPS) do
          true
        end,
        def has_constant?(:HANDLER) do
          true
        end,
        def has_constant?(:HAVING) do
          true
        end,
        def has_constant?(:HEADER_P) do
          true
        end,
        def has_constant?(:HOLD) do
          true
        end,
        def has_constant?(:HOUR_P) do
          true
        end,
        def has_constant?(:IDENTITY_P) do
          true
        end,
        def has_constant?(:IF_P) do
          true
        end,
        def has_constant?(:ILIKE) do
          true
        end,
        def has_constant?(:IMMEDIATE) do
          true
        end,
        def has_constant?(:IMMUTABLE) do
          true
        end,
        def has_constant?(:IMPLICIT_P) do
          true
        end,
        def has_constant?(:IMPORT_P) do
          true
        end,
        def has_constant?(:IN_P) do
          true
        end,
        def has_constant?(:INCLUDE) do
          true
        end,
        def has_constant?(:INCLUDING) do
          true
        end,
        def has_constant?(:INCREMENT) do
          true
        end,
        def has_constant?(:INDENT) do
          true
        end,
        def has_constant?(:INDEX) do
          true
        end,
        def has_constant?(:INDEXES) do
          true
        end,
        def has_constant?(:INHERIT) do
          true
        end,
        def has_constant?(:INHERITS) do
          true
        end,
        def has_constant?(:INITIALLY) do
          true
        end,
        def has_constant?(:INLINE_P) do
          true
        end,
        def has_constant?(:INNER_P) do
          true
        end,
        def has_constant?(:INOUT) do
          true
        end,
        def has_constant?(:INPUT_P) do
          true
        end,
        def has_constant?(:INSENSITIVE) do
          true
        end,
        def has_constant?(:INSERT) do
          true
        end,
        def has_constant?(:INSTEAD) do
          true
        end,
        def has_constant?(:INT_P) do
          true
        end,
        def has_constant?(:INTEGER) do
          true
        end,
        def has_constant?(:INTERSECT) do
          true
        end,
        def has_constant?(:INTERVAL) do
          true
        end,
        def has_constant?(:INTO) do
          true
        end,
        def has_constant?(:INVOKER) do
          true
        end,
        def has_constant?(:IS) do
          true
        end,
        def has_constant?(:ISNULL) do
          true
        end,
        def has_constant?(:ISOLATION) do
          true
        end,
        def has_constant?(:JOIN) do
          true
        end,
        def has_constant?(:JSON) do
          true
        end,
        def has_constant?(:JSON_ARRAY) do
          true
        end,
        def has_constant?(:JSON_ARRAYAGG) do
          true
        end,
        def has_constant?(:JSON_EXISTS) do
          true
        end,
        def has_constant?(:JSON_OBJECT) do
          true
        end,
        def has_constant?(:JSON_OBJECTAGG) do
          true
        end,
        def has_constant?(:JSON_QUERY) do
          true
        end,
        def has_constant?(:JSON_SCALAR) do
          true
        end,
        def has_constant?(:JSON_SERIALIZE) do
          true
        end,
        def has_constant?(:JSON_TABLE) do
          true
        end,
        def has_constant?(:JSON_VALUE) do
          true
        end,
        def has_constant?(:KEEP) do
          true
        end,
        def has_constant?(:KEY) do
          true
        end,
        def has_constant?(:KEYS) do
          true
        end,
        def has_constant?(:LABEL) do
          true
        end,
        def has_constant?(:LANGUAGE) do
          true
        end,
        def has_constant?(:LARGE_P) do
          true
        end,
        def has_constant?(:LAST_P) do
          true
        end,
        def has_constant?(:LATERAL_P) do
          true
        end,
        def has_constant?(:LEADING) do
          true
        end,
        def has_constant?(:LEAKPROOF) do
          true
        end,
        def has_constant?(:LEAST) do
          true
        end,
        def has_constant?(:LEFT) do
          true
        end,
        def has_constant?(:LEVEL) do
          true
        end,
        def has_constant?(:LIKE) do
          true
        end,
        def has_constant?(:LIMIT) do
          true
        end,
        def has_constant?(:LISTEN) do
          true
        end,
        def has_constant?(:LOAD) do
          true
        end,
        def has_constant?(:LOCAL) do
          true
        end,
        def has_constant?(:LOCALTIME) do
          true
        end,
        def has_constant?(:LOCALTIMESTAMP) do
          true
        end,
        def has_constant?(:LOCATION) do
          true
        end,
        def has_constant?(:LOCK_P) do
          true
        end,
        def has_constant?(:LOCKED) do
          true
        end,
        def has_constant?(:LOGGED) do
          true
        end,
        def has_constant?(:MAPPING) do
          true
        end,
        def has_constant?(:MATCH) do
          true
        end,
        def has_constant?(:MATCHED) do
          true
        end,
        def has_constant?(:MATERIALIZED) do
          true
        end,
        def has_constant?(:MAXVALUE) do
          true
        end,
        def has_constant?(:MERGE) do
          true
        end,
        def has_constant?(:MERGE_ACTION) do
          true
        end,
        def has_constant?(:METHOD) do
          true
        end,
        def has_constant?(:MINUTE_P) do
          true
        end,
        def has_constant?(:MINVALUE) do
          true
        end,
        def has_constant?(:MODE) do
          true
        end,
        def has_constant?(:MONTH_P) do
          true
        end,
        def has_constant?(:MOVE) do
          true
        end,
        def has_constant?(:NAME_P) do
          true
        end,
        def has_constant?(:NAMES) do
          true
        end,
        def has_constant?(:NATIONAL) do
          true
        end,
        def has_constant?(:NATURAL) do
          true
        end,
        def has_constant?(:NCHAR) do
          true
        end,
        def has_constant?(:NESTED) do
          true
        end,
        def has_constant?(:NEW) do
          true
        end,
        def has_constant?(:NEXT) do
          true
        end,
        def has_constant?(:NFC) do
          true
        end,
        def has_constant?(:NFD) do
          true
        end,
        def has_constant?(:NFKC) do
          true
        end,
        def has_constant?(:NFKD) do
          true
        end,
        def has_constant?(:NO) do
          true
        end,
        def has_constant?(:NONE) do
          true
        end,
        def has_constant?(:NORMALIZE) do
          true
        end,
        def has_constant?(:NORMALIZED) do
          true
        end,
        def has_constant?(:NOT) do
          true
        end,
        def has_constant?(:NOTHING) do
          true
        end,
        def has_constant?(:NOTIFY) do
          true
        end,
        def has_constant?(:NOTNULL) do
          true
        end,
        def has_constant?(:NOWAIT) do
          true
        end,
        def has_constant?(:NULL_P) do
          true
        end,
        def has_constant?(:NULLIF) do
          true
        end,
        def has_constant?(:NULLS_P) do
          true
        end,
        def has_constant?(:NUMERIC) do
          true
        end,
        def has_constant?(:OBJECT_P) do
          true
        end,
        def has_constant?(:OF) do
          true
        end,
        def has_constant?(:OFF) do
          true
        end,
        def has_constant?(:OFFSET) do
          true
        end,
        def has_constant?(:OIDS) do
          true
        end,
        def has_constant?(:OLD) do
          true
        end,
        def has_constant?(:OMIT) do
          true
        end,
        def has_constant?(:ON) do
          true
        end,
        def has_constant?(:ONLY) do
          true
        end,
        def has_constant?(:OPERATOR) do
          true
        end,
        def has_constant?(:OPTION) do
          true
        end,
        def has_constant?(:OPTIONS) do
          true
        end,
        def has_constant?(:OR) do
          true
        end,
        def has_constant?(:ORDER) do
          true
        end,
        def has_constant?(:ORDINALITY) do
          true
        end,
        def has_constant?(:OTHERS) do
          true
        end,
        def has_constant?(:OUT_P) do
          true
        end,
        def has_constant?(:OUTER_P) do
          true
        end,
        def has_constant?(:OVER) do
          true
        end,
        def has_constant?(:OVERLAPS) do
          true
        end,
        def has_constant?(:OVERLAY) do
          true
        end,
        def has_constant?(:OVERRIDING) do
          true
        end,
        def has_constant?(:OWNED) do
          true
        end,
        def has_constant?(:OWNER) do
          true
        end,
        def has_constant?(:PARALLEL) do
          true
        end,
        def has_constant?(:PARAMETER) do
          true
        end,
        def has_constant?(:PARSER) do
          true
        end,
        def has_constant?(:PARTIAL) do
          true
        end,
        def has_constant?(:PARTITION) do
          true
        end,
        def has_constant?(:PASSING) do
          true
        end,
        def has_constant?(:PASSWORD) do
          true
        end,
        def has_constant?(:PATH) do
          true
        end,
        def has_constant?(:PLACING) do
          true
        end,
        def has_constant?(:PLAN) do
          true
        end,
        def has_constant?(:PLANS) do
          true
        end,
        def has_constant?(:POLICY) do
          true
        end,
        def has_constant?(:POSITION) do
          true
        end,
        def has_constant?(:PRECEDING) do
          true
        end,
        def has_constant?(:PRECISION) do
          true
        end,
        def has_constant?(:PRESERVE) do
          true
        end,
        def has_constant?(:PREPARE) do
          true
        end,
        def has_constant?(:PREPARED) do
          true
        end,
        def has_constant?(:PRIMARY) do
          true
        end,
        def has_constant?(:PRIOR) do
          true
        end,
        def has_constant?(:PRIVILEGES) do
          true
        end,
        def has_constant?(:PROCEDURAL) do
          true
        end,
        def has_constant?(:PROCEDURE) do
          true
        end,
        def has_constant?(:PROCEDURES) do
          true
        end,
        def has_constant?(:PROGRAM) do
          true
        end,
        def has_constant?(:PUBLICATION) do
          true
        end,
        def has_constant?(:QUOTE) do
          true
        end,
        def has_constant?(:QUOTES) do
          true
        end,
        def has_constant?(:RANGE) do
          true
        end,
        def has_constant?(:READ) do
          true
        end,
        def has_constant?(:REAL) do
          true
        end,
        def has_constant?(:REASSIGN) do
          true
        end,
        def has_constant?(:RECHECK) do
          true
        end,
        def has_constant?(:RECURSIVE) do
          true
        end,
        def has_constant?(:REF_P) do
          true
        end,
        def has_constant?(:REFERENCES) do
          true
        end,
        def has_constant?(:REFERENCING) do
          true
        end,
        def has_constant?(:REFRESH) do
          true
        end,
        def has_constant?(:REINDEX) do
          true
        end,
        def has_constant?(:RELATIVE_P) do
          true
        end,
        def has_constant?(:RELEASE) do
          true
        end,
        def has_constant?(:RENAME) do
          true
        end,
        def has_constant?(:REPEATABLE) do
          true
        end,
        def has_constant?(:REPLACE) do
          true
        end,
        def has_constant?(:REPLICA) do
          true
        end,
        def has_constant?(:RESET) do
          true
        end,
        def has_constant?(:RESTART) do
          true
        end,
        def has_constant?(:RESTRICT) do
          true
        end,
        def has_constant?(:RETURN) do
          true
        end,
        def has_constant?(:RETURNING) do
          true
        end,
        def has_constant?(:RETURNS) do
          true
        end,
        def has_constant?(:REVOKE) do
          true
        end,
        def has_constant?(:RIGHT) do
          true
        end,
        def has_constant?(:ROLE) do
          true
        end,
        def has_constant?(:ROLLBACK) do
          true
        end,
        def has_constant?(:ROLLUP) do
          true
        end,
        def has_constant?(:ROUTINE) do
          true
        end,
        def has_constant?(:ROUTINES) do
          true
        end,
        def has_constant?(:ROW) do
          true
        end,
        def has_constant?(:ROWS) do
          true
        end,
        def has_constant?(:RULE) do
          true
        end,
        def has_constant?(:SAVEPOINT) do
          true
        end,
        def has_constant?(:SCALAR) do
          true
        end,
        def has_constant?(:SCHEMA) do
          true
        end,
        def has_constant?(:SCHEMAS) do
          true
        end,
        def has_constant?(:SCROLL) do
          true
        end,
        def has_constant?(:SEARCH) do
          true
        end,
        def has_constant?(:SECOND_P) do
          true
        end,
        def has_constant?(:SECURITY) do
          true
        end,
        def has_constant?(:SELECT) do
          true
        end,
        def has_constant?(:SEQUENCE) do
          true
        end,
        def has_constant?(:SEQUENCES) do
          true
        end,
        def has_constant?(:SERIALIZABLE) do
          true
        end,
        def has_constant?(:SERVER) do
          true
        end,
        def has_constant?(:SESSION) do
          true
        end,
        def has_constant?(:SESSION_USER) do
          true
        end,
        def has_constant?(:SET) do
          true
        end,
        def has_constant?(:SETS) do
          true
        end,
        def has_constant?(:SETOF) do
          true
        end,
        def has_constant?(:SHARE) do
          true
        end,
        def has_constant?(:SHOW) do
          true
        end,
        def has_constant?(:SIMILAR) do
          true
        end,
        def has_constant?(:SIMPLE) do
          true
        end,
        def has_constant?(:SKIP) do
          true
        end,
        def has_constant?(:SMALLINT) do
          true
        end,
        def has_constant?(:SNAPSHOT) do
          true
        end,
        def has_constant?(:SOME) do
          true
        end,
        def has_constant?(:SOURCE) do
          true
        end,
        def has_constant?(:SQL_P) do
          true
        end,
        def has_constant?(:STABLE) do
          true
        end,
        def has_constant?(:STANDALONE_P) do
          true
        end,
        def has_constant?(:START) do
          true
        end,
        def has_constant?(:STATEMENT) do
          true
        end,
        def has_constant?(:STATISTICS) do
          true
        end,
        def has_constant?(:STDIN) do
          true
        end,
        def has_constant?(:STDOUT) do
          true
        end,
        def has_constant?(:STORAGE) do
          true
        end,
        def has_constant?(:STORED) do
          true
        end,
        def has_constant?(:STRICT_P) do
          true
        end,
        def has_constant?(:STRING_P) do
          true
        end,
        def has_constant?(:STRIP_P) do
          true
        end,
        def has_constant?(:SUBSCRIPTION) do
          true
        end,
        def has_constant?(:SUBSTRING) do
          true
        end,
        def has_constant?(:SUPPORT) do
          true
        end,
        def has_constant?(:SYMMETRIC) do
          true
        end,
        def has_constant?(:SYSID) do
          true
        end,
        def has_constant?(:SYSTEM_P) do
          true
        end,
        def has_constant?(:SYSTEM_USER) do
          true
        end,
        def has_constant?(:TABLE) do
          true
        end,
        def has_constant?(:TABLES) do
          true
        end,
        def has_constant?(:TABLESAMPLE) do
          true
        end,
        def has_constant?(:TABLESPACE) do
          true
        end,
        def has_constant?(:TARGET) do
          true
        end,
        def has_constant?(:TEMP) do
          true
        end,
        def has_constant?(:TEMPLATE) do
          true
        end,
        def has_constant?(:TEMPORARY) do
          true
        end,
        def has_constant?(:TEXT_P) do
          true
        end,
        def has_constant?(:THEN) do
          true
        end,
        def has_constant?(:TIES) do
          true
        end,
        def has_constant?(:TIME) do
          true
        end,
        def has_constant?(:TIMESTAMP) do
          true
        end,
        def has_constant?(:TO) do
          true
        end,
        def has_constant?(:TRAILING) do
          true
        end,
        def has_constant?(:TRANSACTION) do
          true
        end,
        def has_constant?(:TRANSFORM) do
          true
        end,
        def has_constant?(:TREAT) do
          true
        end,
        def has_constant?(:TRIGGER) do
          true
        end,
        def has_constant?(:TRIM) do
          true
        end,
        def has_constant?(:TRUE_P) do
          true
        end,
        def has_constant?(:TRUNCATE) do
          true
        end,
        def has_constant?(:TRUSTED) do
          true
        end,
        def has_constant?(:TYPE_P) do
          true
        end,
        def has_constant?(:TYPES_P) do
          true
        end,
        def has_constant?(:UESCAPE) do
          true
        end,
        def has_constant?(:UNBOUNDED) do
          true
        end,
        def has_constant?(:UNCONDITIONAL) do
          true
        end,
        def has_constant?(:UNCOMMITTED) do
          true
        end,
        def has_constant?(:UNENCRYPTED) do
          true
        end,
        def has_constant?(:UNION) do
          true
        end,
        def has_constant?(:UNIQUE) do
          true
        end,
        def has_constant?(:UNKNOWN) do
          true
        end,
        def has_constant?(:UNLISTEN) do
          true
        end,
        def has_constant?(:UNLOGGED) do
          true
        end,
        def has_constant?(:UNTIL) do
          true
        end,
        def has_constant?(:UPDATE) do
          true
        end,
        def has_constant?(:USER) do
          true
        end,
        def has_constant?(:USING) do
          true
        end,
        def has_constant?(:VACUUM) do
          true
        end,
        def has_constant?(:VALID) do
          true
        end,
        def has_constant?(:VALIDATE) do
          true
        end,
        def has_constant?(:VALIDATOR) do
          true
        end,
        def has_constant?(:VALUE_P) do
          true
        end,
        def has_constant?(:VALUES) do
          true
        end,
        def has_constant?(:VARCHAR) do
          true
        end,
        def has_constant?(:VARIADIC) do
          true
        end,
        def has_constant?(:VARYING) do
          true
        end,
        def has_constant?(:VERBOSE) do
          true
        end,
        def has_constant?(:VERSION_P) do
          true
        end,
        def has_constant?(:VIEW) do
          true
        end,
        def has_constant?(:VIEWS) do
          true
        end,
        def has_constant?(:VOLATILE) do
          true
        end,
        def has_constant?(:WHEN) do
          true
        end,
        def has_constant?(:WHERE) do
          true
        end,
        def has_constant?(:WHITESPACE_P) do
          true
        end,
        def has_constant?(:WINDOW) do
          true
        end,
        def has_constant?(:WITH) do
          true
        end,
        def has_constant?(:WITHIN) do
          true
        end,
        def has_constant?(:WITHOUT) do
          true
        end,
        def has_constant?(:WORK) do
          true
        end,
        def has_constant?(:WRAPPER) do
          true
        end,
        def has_constant?(:WRITE) do
          true
        end,
        def has_constant?(:XML_P) do
          true
        end,
        def has_constant?(:XMLATTRIBUTES) do
          true
        end,
        def has_constant?(:XMLCONCAT) do
          true
        end,
        def has_constant?(:XMLELEMENT) do
          true
        end,
        def has_constant?(:XMLEXISTS) do
          true
        end,
        def has_constant?(:XMLFOREST) do
          true
        end,
        def has_constant?(:XMLNAMESPACES) do
          true
        end,
        def has_constant?(:XMLPARSE) do
          true
        end,
        def has_constant?(:XMLPI) do
          true
        end,
        def has_constant?(:XMLROOT) do
          true
        end,
        def has_constant?(:XMLSERIALIZE) do
          true
        end,
        def has_constant?(:XMLTABLE) do
          true
        end,
        def has_constant?(:YEAR_P) do
          true
        end,
        def has_constant?(:YES_P) do
          true
        end,
        def has_constant?(:ZONE) do
          true
        end,
        def has_constant?(:FORMAT_LA) do
          true
        end,
        def has_constant?(:NOT_LA) do
          true
        end,
        def has_constant?(:NULLS_LA) do
          true
        end,
        def has_constant?(:WITH_LA) do
          true
        end,
        def has_constant?(:WITHOUT_LA) do
          true
        end,
        def has_constant?(:MODE_TYPE_NAME) do
          true
        end,
        def has_constant?(:MODE_PLPGSQL_EXPR) do
          true
        end,
        def has_constant?(:MODE_PLPGSQL_ASSIGN1) do
          true
        end,
        def has_constant?(:MODE_PLPGSQL_ASSIGN2) do
          true
        end,
        def has_constant?(:MODE_PLPGSQL_ASSIGN3) do
          true
        end,
        def has_constant?(:UMINUS) do
          true
        end
      ]

      def has_constant?(_) do
        false
      end
    )
  )
end
