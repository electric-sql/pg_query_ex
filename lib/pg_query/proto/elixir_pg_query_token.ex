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
        def encode(:ABSOLUTE_P) do
          278
        end

        def encode("ABSOLUTE_P") do
          278
        end
      ),
      (
        def encode(:ACCESS) do
          279
        end

        def encode("ACCESS") do
          279
        end
      ),
      (
        def encode(:ACTION) do
          280
        end

        def encode("ACTION") do
          280
        end
      ),
      (
        def encode(:ADD_P) do
          281
        end

        def encode("ADD_P") do
          281
        end
      ),
      (
        def encode(:ADMIN) do
          282
        end

        def encode("ADMIN") do
          282
        end
      ),
      (
        def encode(:AFTER) do
          283
        end

        def encode("AFTER") do
          283
        end
      ),
      (
        def encode(:AGGREGATE) do
          284
        end

        def encode("AGGREGATE") do
          284
        end
      ),
      (
        def encode(:ALL) do
          285
        end

        def encode("ALL") do
          285
        end
      ),
      (
        def encode(:ALSO) do
          286
        end

        def encode("ALSO") do
          286
        end
      ),
      (
        def encode(:ALTER) do
          287
        end

        def encode("ALTER") do
          287
        end
      ),
      (
        def encode(:ALWAYS) do
          288
        end

        def encode("ALWAYS") do
          288
        end
      ),
      (
        def encode(:ANALYSE) do
          289
        end

        def encode("ANALYSE") do
          289
        end
      ),
      (
        def encode(:ANALYZE) do
          290
        end

        def encode("ANALYZE") do
          290
        end
      ),
      (
        def encode(:AND) do
          291
        end

        def encode("AND") do
          291
        end
      ),
      (
        def encode(:ANY) do
          292
        end

        def encode("ANY") do
          292
        end
      ),
      (
        def encode(:ARRAY) do
          293
        end

        def encode("ARRAY") do
          293
        end
      ),
      (
        def encode(:AS) do
          294
        end

        def encode("AS") do
          294
        end
      ),
      (
        def encode(:ASC) do
          295
        end

        def encode("ASC") do
          295
        end
      ),
      (
        def encode(:ASENSITIVE) do
          296
        end

        def encode("ASENSITIVE") do
          296
        end
      ),
      (
        def encode(:ASSERTION) do
          297
        end

        def encode("ASSERTION") do
          297
        end
      ),
      (
        def encode(:ASSIGNMENT) do
          298
        end

        def encode("ASSIGNMENT") do
          298
        end
      ),
      (
        def encode(:ASYMMETRIC) do
          299
        end

        def encode("ASYMMETRIC") do
          299
        end
      ),
      (
        def encode(:ATOMIC) do
          300
        end

        def encode("ATOMIC") do
          300
        end
      ),
      (
        def encode(:AT) do
          301
        end

        def encode("AT") do
          301
        end
      ),
      (
        def encode(:ATTACH) do
          302
        end

        def encode("ATTACH") do
          302
        end
      ),
      (
        def encode(:ATTRIBUTE) do
          303
        end

        def encode("ATTRIBUTE") do
          303
        end
      ),
      (
        def encode(:AUTHORIZATION) do
          304
        end

        def encode("AUTHORIZATION") do
          304
        end
      ),
      (
        def encode(:BACKWARD) do
          305
        end

        def encode("BACKWARD") do
          305
        end
      ),
      (
        def encode(:BEFORE) do
          306
        end

        def encode("BEFORE") do
          306
        end
      ),
      (
        def encode(:BEGIN_P) do
          307
        end

        def encode("BEGIN_P") do
          307
        end
      ),
      (
        def encode(:BETWEEN) do
          308
        end

        def encode("BETWEEN") do
          308
        end
      ),
      (
        def encode(:BIGINT) do
          309
        end

        def encode("BIGINT") do
          309
        end
      ),
      (
        def encode(:BINARY) do
          310
        end

        def encode("BINARY") do
          310
        end
      ),
      (
        def encode(:BIT) do
          311
        end

        def encode("BIT") do
          311
        end
      ),
      (
        def encode(:BOOLEAN_P) do
          312
        end

        def encode("BOOLEAN_P") do
          312
        end
      ),
      (
        def encode(:BOTH) do
          313
        end

        def encode("BOTH") do
          313
        end
      ),
      (
        def encode(:BREADTH) do
          314
        end

        def encode("BREADTH") do
          314
        end
      ),
      (
        def encode(:BY) do
          315
        end

        def encode("BY") do
          315
        end
      ),
      (
        def encode(:CACHE) do
          316
        end

        def encode("CACHE") do
          316
        end
      ),
      (
        def encode(:CALL) do
          317
        end

        def encode("CALL") do
          317
        end
      ),
      (
        def encode(:CALLED) do
          318
        end

        def encode("CALLED") do
          318
        end
      ),
      (
        def encode(:CASCADE) do
          319
        end

        def encode("CASCADE") do
          319
        end
      ),
      (
        def encode(:CASCADED) do
          320
        end

        def encode("CASCADED") do
          320
        end
      ),
      (
        def encode(:CASE) do
          321
        end

        def encode("CASE") do
          321
        end
      ),
      (
        def encode(:CAST) do
          322
        end

        def encode("CAST") do
          322
        end
      ),
      (
        def encode(:CATALOG_P) do
          323
        end

        def encode("CATALOG_P") do
          323
        end
      ),
      (
        def encode(:CHAIN) do
          324
        end

        def encode("CHAIN") do
          324
        end
      ),
      (
        def encode(:CHAR_P) do
          325
        end

        def encode("CHAR_P") do
          325
        end
      ),
      (
        def encode(:CHARACTER) do
          326
        end

        def encode("CHARACTER") do
          326
        end
      ),
      (
        def encode(:CHARACTERISTICS) do
          327
        end

        def encode("CHARACTERISTICS") do
          327
        end
      ),
      (
        def encode(:CHECK) do
          328
        end

        def encode("CHECK") do
          328
        end
      ),
      (
        def encode(:CHECKPOINT) do
          329
        end

        def encode("CHECKPOINT") do
          329
        end
      ),
      (
        def encode(:CLASS) do
          330
        end

        def encode("CLASS") do
          330
        end
      ),
      (
        def encode(:CLOSE) do
          331
        end

        def encode("CLOSE") do
          331
        end
      ),
      (
        def encode(:CLUSTER) do
          332
        end

        def encode("CLUSTER") do
          332
        end
      ),
      (
        def encode(:COALESCE) do
          333
        end

        def encode("COALESCE") do
          333
        end
      ),
      (
        def encode(:COLLATE) do
          334
        end

        def encode("COLLATE") do
          334
        end
      ),
      (
        def encode(:COLLATION) do
          335
        end

        def encode("COLLATION") do
          335
        end
      ),
      (
        def encode(:COLUMN) do
          336
        end

        def encode("COLUMN") do
          336
        end
      ),
      (
        def encode(:COLUMNS) do
          337
        end

        def encode("COLUMNS") do
          337
        end
      ),
      (
        def encode(:COMMENT) do
          338
        end

        def encode("COMMENT") do
          338
        end
      ),
      (
        def encode(:COMMENTS) do
          339
        end

        def encode("COMMENTS") do
          339
        end
      ),
      (
        def encode(:COMMIT) do
          340
        end

        def encode("COMMIT") do
          340
        end
      ),
      (
        def encode(:COMMITTED) do
          341
        end

        def encode("COMMITTED") do
          341
        end
      ),
      (
        def encode(:COMPRESSION) do
          342
        end

        def encode("COMPRESSION") do
          342
        end
      ),
      (
        def encode(:CONCURRENTLY) do
          343
        end

        def encode("CONCURRENTLY") do
          343
        end
      ),
      (
        def encode(:CONFIGURATION) do
          344
        end

        def encode("CONFIGURATION") do
          344
        end
      ),
      (
        def encode(:CONFLICT) do
          345
        end

        def encode("CONFLICT") do
          345
        end
      ),
      (
        def encode(:CONNECTION) do
          346
        end

        def encode("CONNECTION") do
          346
        end
      ),
      (
        def encode(:CONSTRAINT) do
          347
        end

        def encode("CONSTRAINT") do
          347
        end
      ),
      (
        def encode(:CONSTRAINTS) do
          348
        end

        def encode("CONSTRAINTS") do
          348
        end
      ),
      (
        def encode(:CONTENT_P) do
          349
        end

        def encode("CONTENT_P") do
          349
        end
      ),
      (
        def encode(:CONTINUE_P) do
          350
        end

        def encode("CONTINUE_P") do
          350
        end
      ),
      (
        def encode(:CONVERSION_P) do
          351
        end

        def encode("CONVERSION_P") do
          351
        end
      ),
      (
        def encode(:COPY) do
          352
        end

        def encode("COPY") do
          352
        end
      ),
      (
        def encode(:COST) do
          353
        end

        def encode("COST") do
          353
        end
      ),
      (
        def encode(:CREATE) do
          354
        end

        def encode("CREATE") do
          354
        end
      ),
      (
        def encode(:CROSS) do
          355
        end

        def encode("CROSS") do
          355
        end
      ),
      (
        def encode(:CSV) do
          356
        end

        def encode("CSV") do
          356
        end
      ),
      (
        def encode(:CUBE) do
          357
        end

        def encode("CUBE") do
          357
        end
      ),
      (
        def encode(:CURRENT_P) do
          358
        end

        def encode("CURRENT_P") do
          358
        end
      ),
      (
        def encode(:CURRENT_CATALOG) do
          359
        end

        def encode("CURRENT_CATALOG") do
          359
        end
      ),
      (
        def encode(:CURRENT_DATE) do
          360
        end

        def encode("CURRENT_DATE") do
          360
        end
      ),
      (
        def encode(:CURRENT_ROLE) do
          361
        end

        def encode("CURRENT_ROLE") do
          361
        end
      ),
      (
        def encode(:CURRENT_SCHEMA) do
          362
        end

        def encode("CURRENT_SCHEMA") do
          362
        end
      ),
      (
        def encode(:CURRENT_TIME) do
          363
        end

        def encode("CURRENT_TIME") do
          363
        end
      ),
      (
        def encode(:CURRENT_TIMESTAMP) do
          364
        end

        def encode("CURRENT_TIMESTAMP") do
          364
        end
      ),
      (
        def encode(:CURRENT_USER) do
          365
        end

        def encode("CURRENT_USER") do
          365
        end
      ),
      (
        def encode(:CURSOR) do
          366
        end

        def encode("CURSOR") do
          366
        end
      ),
      (
        def encode(:CYCLE) do
          367
        end

        def encode("CYCLE") do
          367
        end
      ),
      (
        def encode(:DATA_P) do
          368
        end

        def encode("DATA_P") do
          368
        end
      ),
      (
        def encode(:DATABASE) do
          369
        end

        def encode("DATABASE") do
          369
        end
      ),
      (
        def encode(:DAY_P) do
          370
        end

        def encode("DAY_P") do
          370
        end
      ),
      (
        def encode(:DEALLOCATE) do
          371
        end

        def encode("DEALLOCATE") do
          371
        end
      ),
      (
        def encode(:DEC) do
          372
        end

        def encode("DEC") do
          372
        end
      ),
      (
        def encode(:DECIMAL_P) do
          373
        end

        def encode("DECIMAL_P") do
          373
        end
      ),
      (
        def encode(:DECLARE) do
          374
        end

        def encode("DECLARE") do
          374
        end
      ),
      (
        def encode(:DEFAULT) do
          375
        end

        def encode("DEFAULT") do
          375
        end
      ),
      (
        def encode(:DEFAULTS) do
          376
        end

        def encode("DEFAULTS") do
          376
        end
      ),
      (
        def encode(:DEFERRABLE) do
          377
        end

        def encode("DEFERRABLE") do
          377
        end
      ),
      (
        def encode(:DEFERRED) do
          378
        end

        def encode("DEFERRED") do
          378
        end
      ),
      (
        def encode(:DEFINER) do
          379
        end

        def encode("DEFINER") do
          379
        end
      ),
      (
        def encode(:DELETE_P) do
          380
        end

        def encode("DELETE_P") do
          380
        end
      ),
      (
        def encode(:DELIMITER) do
          381
        end

        def encode("DELIMITER") do
          381
        end
      ),
      (
        def encode(:DELIMITERS) do
          382
        end

        def encode("DELIMITERS") do
          382
        end
      ),
      (
        def encode(:DEPENDS) do
          383
        end

        def encode("DEPENDS") do
          383
        end
      ),
      (
        def encode(:DEPTH) do
          384
        end

        def encode("DEPTH") do
          384
        end
      ),
      (
        def encode(:DESC) do
          385
        end

        def encode("DESC") do
          385
        end
      ),
      (
        def encode(:DETACH) do
          386
        end

        def encode("DETACH") do
          386
        end
      ),
      (
        def encode(:DICTIONARY) do
          387
        end

        def encode("DICTIONARY") do
          387
        end
      ),
      (
        def encode(:DISABLE_P) do
          388
        end

        def encode("DISABLE_P") do
          388
        end
      ),
      (
        def encode(:DISCARD) do
          389
        end

        def encode("DISCARD") do
          389
        end
      ),
      (
        def encode(:DISTINCT) do
          390
        end

        def encode("DISTINCT") do
          390
        end
      ),
      (
        def encode(:DO) do
          391
        end

        def encode("DO") do
          391
        end
      ),
      (
        def encode(:DOCUMENT_P) do
          392
        end

        def encode("DOCUMENT_P") do
          392
        end
      ),
      (
        def encode(:DOMAIN_P) do
          393
        end

        def encode("DOMAIN_P") do
          393
        end
      ),
      (
        def encode(:DOUBLE_P) do
          394
        end

        def encode("DOUBLE_P") do
          394
        end
      ),
      (
        def encode(:DROP) do
          395
        end

        def encode("DROP") do
          395
        end
      ),
      (
        def encode(:EACH) do
          396
        end

        def encode("EACH") do
          396
        end
      ),
      (
        def encode(:ELSE) do
          397
        end

        def encode("ELSE") do
          397
        end
      ),
      (
        def encode(:ENABLE_P) do
          398
        end

        def encode("ENABLE_P") do
          398
        end
      ),
      (
        def encode(:ENCODING) do
          399
        end

        def encode("ENCODING") do
          399
        end
      ),
      (
        def encode(:ENCRYPTED) do
          400
        end

        def encode("ENCRYPTED") do
          400
        end
      ),
      (
        def encode(:END_P) do
          401
        end

        def encode("END_P") do
          401
        end
      ),
      (
        def encode(:ENUM_P) do
          402
        end

        def encode("ENUM_P") do
          402
        end
      ),
      (
        def encode(:ESCAPE) do
          403
        end

        def encode("ESCAPE") do
          403
        end
      ),
      (
        def encode(:EVENT) do
          404
        end

        def encode("EVENT") do
          404
        end
      ),
      (
        def encode(:EXCEPT) do
          405
        end

        def encode("EXCEPT") do
          405
        end
      ),
      (
        def encode(:EXCLUDE) do
          406
        end

        def encode("EXCLUDE") do
          406
        end
      ),
      (
        def encode(:EXCLUDING) do
          407
        end

        def encode("EXCLUDING") do
          407
        end
      ),
      (
        def encode(:EXCLUSIVE) do
          408
        end

        def encode("EXCLUSIVE") do
          408
        end
      ),
      (
        def encode(:EXECUTE) do
          409
        end

        def encode("EXECUTE") do
          409
        end
      ),
      (
        def encode(:EXISTS) do
          410
        end

        def encode("EXISTS") do
          410
        end
      ),
      (
        def encode(:EXPLAIN) do
          411
        end

        def encode("EXPLAIN") do
          411
        end
      ),
      (
        def encode(:EXPRESSION) do
          412
        end

        def encode("EXPRESSION") do
          412
        end
      ),
      (
        def encode(:EXTENSION) do
          413
        end

        def encode("EXTENSION") do
          413
        end
      ),
      (
        def encode(:EXTERNAL) do
          414
        end

        def encode("EXTERNAL") do
          414
        end
      ),
      (
        def encode(:EXTRACT) do
          415
        end

        def encode("EXTRACT") do
          415
        end
      ),
      (
        def encode(:FALSE_P) do
          416
        end

        def encode("FALSE_P") do
          416
        end
      ),
      (
        def encode(:FAMILY) do
          417
        end

        def encode("FAMILY") do
          417
        end
      ),
      (
        def encode(:FETCH) do
          418
        end

        def encode("FETCH") do
          418
        end
      ),
      (
        def encode(:FILTER) do
          419
        end

        def encode("FILTER") do
          419
        end
      ),
      (
        def encode(:FINALIZE) do
          420
        end

        def encode("FINALIZE") do
          420
        end
      ),
      (
        def encode(:FIRST_P) do
          421
        end

        def encode("FIRST_P") do
          421
        end
      ),
      (
        def encode(:FLOAT_P) do
          422
        end

        def encode("FLOAT_P") do
          422
        end
      ),
      (
        def encode(:FOLLOWING) do
          423
        end

        def encode("FOLLOWING") do
          423
        end
      ),
      (
        def encode(:FOR) do
          424
        end

        def encode("FOR") do
          424
        end
      ),
      (
        def encode(:FORCE) do
          425
        end

        def encode("FORCE") do
          425
        end
      ),
      (
        def encode(:FOREIGN) do
          426
        end

        def encode("FOREIGN") do
          426
        end
      ),
      (
        def encode(:FORWARD) do
          427
        end

        def encode("FORWARD") do
          427
        end
      ),
      (
        def encode(:FREEZE) do
          428
        end

        def encode("FREEZE") do
          428
        end
      ),
      (
        def encode(:FROM) do
          429
        end

        def encode("FROM") do
          429
        end
      ),
      (
        def encode(:FULL) do
          430
        end

        def encode("FULL") do
          430
        end
      ),
      (
        def encode(:FUNCTION) do
          431
        end

        def encode("FUNCTION") do
          431
        end
      ),
      (
        def encode(:FUNCTIONS) do
          432
        end

        def encode("FUNCTIONS") do
          432
        end
      ),
      (
        def encode(:GENERATED) do
          433
        end

        def encode("GENERATED") do
          433
        end
      ),
      (
        def encode(:GLOBAL) do
          434
        end

        def encode("GLOBAL") do
          434
        end
      ),
      (
        def encode(:GRANT) do
          435
        end

        def encode("GRANT") do
          435
        end
      ),
      (
        def encode(:GRANTED) do
          436
        end

        def encode("GRANTED") do
          436
        end
      ),
      (
        def encode(:GREATEST) do
          437
        end

        def encode("GREATEST") do
          437
        end
      ),
      (
        def encode(:GROUP_P) do
          438
        end

        def encode("GROUP_P") do
          438
        end
      ),
      (
        def encode(:GROUPING) do
          439
        end

        def encode("GROUPING") do
          439
        end
      ),
      (
        def encode(:GROUPS) do
          440
        end

        def encode("GROUPS") do
          440
        end
      ),
      (
        def encode(:HANDLER) do
          441
        end

        def encode("HANDLER") do
          441
        end
      ),
      (
        def encode(:HAVING) do
          442
        end

        def encode("HAVING") do
          442
        end
      ),
      (
        def encode(:HEADER_P) do
          443
        end

        def encode("HEADER_P") do
          443
        end
      ),
      (
        def encode(:HOLD) do
          444
        end

        def encode("HOLD") do
          444
        end
      ),
      (
        def encode(:HOUR_P) do
          445
        end

        def encode("HOUR_P") do
          445
        end
      ),
      (
        def encode(:IDENTITY_P) do
          446
        end

        def encode("IDENTITY_P") do
          446
        end
      ),
      (
        def encode(:IF_P) do
          447
        end

        def encode("IF_P") do
          447
        end
      ),
      (
        def encode(:ILIKE) do
          448
        end

        def encode("ILIKE") do
          448
        end
      ),
      (
        def encode(:IMMEDIATE) do
          449
        end

        def encode("IMMEDIATE") do
          449
        end
      ),
      (
        def encode(:IMMUTABLE) do
          450
        end

        def encode("IMMUTABLE") do
          450
        end
      ),
      (
        def encode(:IMPLICIT_P) do
          451
        end

        def encode("IMPLICIT_P") do
          451
        end
      ),
      (
        def encode(:IMPORT_P) do
          452
        end

        def encode("IMPORT_P") do
          452
        end
      ),
      (
        def encode(:IN_P) do
          453
        end

        def encode("IN_P") do
          453
        end
      ),
      (
        def encode(:INCLUDE) do
          454
        end

        def encode("INCLUDE") do
          454
        end
      ),
      (
        def encode(:INCLUDING) do
          455
        end

        def encode("INCLUDING") do
          455
        end
      ),
      (
        def encode(:INCREMENT) do
          456
        end

        def encode("INCREMENT") do
          456
        end
      ),
      (
        def encode(:INDEX) do
          457
        end

        def encode("INDEX") do
          457
        end
      ),
      (
        def encode(:INDEXES) do
          458
        end

        def encode("INDEXES") do
          458
        end
      ),
      (
        def encode(:INHERIT) do
          459
        end

        def encode("INHERIT") do
          459
        end
      ),
      (
        def encode(:INHERITS) do
          460
        end

        def encode("INHERITS") do
          460
        end
      ),
      (
        def encode(:INITIALLY) do
          461
        end

        def encode("INITIALLY") do
          461
        end
      ),
      (
        def encode(:INLINE_P) do
          462
        end

        def encode("INLINE_P") do
          462
        end
      ),
      (
        def encode(:INNER_P) do
          463
        end

        def encode("INNER_P") do
          463
        end
      ),
      (
        def encode(:INOUT) do
          464
        end

        def encode("INOUT") do
          464
        end
      ),
      (
        def encode(:INPUT_P) do
          465
        end

        def encode("INPUT_P") do
          465
        end
      ),
      (
        def encode(:INSENSITIVE) do
          466
        end

        def encode("INSENSITIVE") do
          466
        end
      ),
      (
        def encode(:INSERT) do
          467
        end

        def encode("INSERT") do
          467
        end
      ),
      (
        def encode(:INSTEAD) do
          468
        end

        def encode("INSTEAD") do
          468
        end
      ),
      (
        def encode(:INT_P) do
          469
        end

        def encode("INT_P") do
          469
        end
      ),
      (
        def encode(:INTEGER) do
          470
        end

        def encode("INTEGER") do
          470
        end
      ),
      (
        def encode(:INTERSECT) do
          471
        end

        def encode("INTERSECT") do
          471
        end
      ),
      (
        def encode(:INTERVAL) do
          472
        end

        def encode("INTERVAL") do
          472
        end
      ),
      (
        def encode(:INTO) do
          473
        end

        def encode("INTO") do
          473
        end
      ),
      (
        def encode(:INVOKER) do
          474
        end

        def encode("INVOKER") do
          474
        end
      ),
      (
        def encode(:IS) do
          475
        end

        def encode("IS") do
          475
        end
      ),
      (
        def encode(:ISNULL) do
          476
        end

        def encode("ISNULL") do
          476
        end
      ),
      (
        def encode(:ISOLATION) do
          477
        end

        def encode("ISOLATION") do
          477
        end
      ),
      (
        def encode(:JOIN) do
          478
        end

        def encode("JOIN") do
          478
        end
      ),
      (
        def encode(:KEY) do
          479
        end

        def encode("KEY") do
          479
        end
      ),
      (
        def encode(:LABEL) do
          480
        end

        def encode("LABEL") do
          480
        end
      ),
      (
        def encode(:LANGUAGE) do
          481
        end

        def encode("LANGUAGE") do
          481
        end
      ),
      (
        def encode(:LARGE_P) do
          482
        end

        def encode("LARGE_P") do
          482
        end
      ),
      (
        def encode(:LAST_P) do
          483
        end

        def encode("LAST_P") do
          483
        end
      ),
      (
        def encode(:LATERAL_P) do
          484
        end

        def encode("LATERAL_P") do
          484
        end
      ),
      (
        def encode(:LEADING) do
          485
        end

        def encode("LEADING") do
          485
        end
      ),
      (
        def encode(:LEAKPROOF) do
          486
        end

        def encode("LEAKPROOF") do
          486
        end
      ),
      (
        def encode(:LEAST) do
          487
        end

        def encode("LEAST") do
          487
        end
      ),
      (
        def encode(:LEFT) do
          488
        end

        def encode("LEFT") do
          488
        end
      ),
      (
        def encode(:LEVEL) do
          489
        end

        def encode("LEVEL") do
          489
        end
      ),
      (
        def encode(:LIKE) do
          490
        end

        def encode("LIKE") do
          490
        end
      ),
      (
        def encode(:LIMIT) do
          491
        end

        def encode("LIMIT") do
          491
        end
      ),
      (
        def encode(:LISTEN) do
          492
        end

        def encode("LISTEN") do
          492
        end
      ),
      (
        def encode(:LOAD) do
          493
        end

        def encode("LOAD") do
          493
        end
      ),
      (
        def encode(:LOCAL) do
          494
        end

        def encode("LOCAL") do
          494
        end
      ),
      (
        def encode(:LOCALTIME) do
          495
        end

        def encode("LOCALTIME") do
          495
        end
      ),
      (
        def encode(:LOCALTIMESTAMP) do
          496
        end

        def encode("LOCALTIMESTAMP") do
          496
        end
      ),
      (
        def encode(:LOCATION) do
          497
        end

        def encode("LOCATION") do
          497
        end
      ),
      (
        def encode(:LOCK_P) do
          498
        end

        def encode("LOCK_P") do
          498
        end
      ),
      (
        def encode(:LOCKED) do
          499
        end

        def encode("LOCKED") do
          499
        end
      ),
      (
        def encode(:LOGGED) do
          500
        end

        def encode("LOGGED") do
          500
        end
      ),
      (
        def encode(:MAPPING) do
          501
        end

        def encode("MAPPING") do
          501
        end
      ),
      (
        def encode(:MATCH) do
          502
        end

        def encode("MATCH") do
          502
        end
      ),
      (
        def encode(:MATCHED) do
          503
        end

        def encode("MATCHED") do
          503
        end
      ),
      (
        def encode(:MATERIALIZED) do
          504
        end

        def encode("MATERIALIZED") do
          504
        end
      ),
      (
        def encode(:MAXVALUE) do
          505
        end

        def encode("MAXVALUE") do
          505
        end
      ),
      (
        def encode(:MERGE) do
          506
        end

        def encode("MERGE") do
          506
        end
      ),
      (
        def encode(:METHOD) do
          507
        end

        def encode("METHOD") do
          507
        end
      ),
      (
        def encode(:MINUTE_P) do
          508
        end

        def encode("MINUTE_P") do
          508
        end
      ),
      (
        def encode(:MINVALUE) do
          509
        end

        def encode("MINVALUE") do
          509
        end
      ),
      (
        def encode(:MODE) do
          510
        end

        def encode("MODE") do
          510
        end
      ),
      (
        def encode(:MONTH_P) do
          511
        end

        def encode("MONTH_P") do
          511
        end
      ),
      (
        def encode(:MOVE) do
          512
        end

        def encode("MOVE") do
          512
        end
      ),
      (
        def encode(:NAME_P) do
          513
        end

        def encode("NAME_P") do
          513
        end
      ),
      (
        def encode(:NAMES) do
          514
        end

        def encode("NAMES") do
          514
        end
      ),
      (
        def encode(:NATIONAL) do
          515
        end

        def encode("NATIONAL") do
          515
        end
      ),
      (
        def encode(:NATURAL) do
          516
        end

        def encode("NATURAL") do
          516
        end
      ),
      (
        def encode(:NCHAR) do
          517
        end

        def encode("NCHAR") do
          517
        end
      ),
      (
        def encode(:NEW) do
          518
        end

        def encode("NEW") do
          518
        end
      ),
      (
        def encode(:NEXT) do
          519
        end

        def encode("NEXT") do
          519
        end
      ),
      (
        def encode(:NFC) do
          520
        end

        def encode("NFC") do
          520
        end
      ),
      (
        def encode(:NFD) do
          521
        end

        def encode("NFD") do
          521
        end
      ),
      (
        def encode(:NFKC) do
          522
        end

        def encode("NFKC") do
          522
        end
      ),
      (
        def encode(:NFKD) do
          523
        end

        def encode("NFKD") do
          523
        end
      ),
      (
        def encode(:NO) do
          524
        end

        def encode("NO") do
          524
        end
      ),
      (
        def encode(:NONE) do
          525
        end

        def encode("NONE") do
          525
        end
      ),
      (
        def encode(:NORMALIZE) do
          526
        end

        def encode("NORMALIZE") do
          526
        end
      ),
      (
        def encode(:NORMALIZED) do
          527
        end

        def encode("NORMALIZED") do
          527
        end
      ),
      (
        def encode(:NOT) do
          528
        end

        def encode("NOT") do
          528
        end
      ),
      (
        def encode(:NOTHING) do
          529
        end

        def encode("NOTHING") do
          529
        end
      ),
      (
        def encode(:NOTIFY) do
          530
        end

        def encode("NOTIFY") do
          530
        end
      ),
      (
        def encode(:NOTNULL) do
          531
        end

        def encode("NOTNULL") do
          531
        end
      ),
      (
        def encode(:NOWAIT) do
          532
        end

        def encode("NOWAIT") do
          532
        end
      ),
      (
        def encode(:NULL_P) do
          533
        end

        def encode("NULL_P") do
          533
        end
      ),
      (
        def encode(:NULLIF) do
          534
        end

        def encode("NULLIF") do
          534
        end
      ),
      (
        def encode(:NULLS_P) do
          535
        end

        def encode("NULLS_P") do
          535
        end
      ),
      (
        def encode(:NUMERIC) do
          536
        end

        def encode("NUMERIC") do
          536
        end
      ),
      (
        def encode(:OBJECT_P) do
          537
        end

        def encode("OBJECT_P") do
          537
        end
      ),
      (
        def encode(:OF) do
          538
        end

        def encode("OF") do
          538
        end
      ),
      (
        def encode(:OFF) do
          539
        end

        def encode("OFF") do
          539
        end
      ),
      (
        def encode(:OFFSET) do
          540
        end

        def encode("OFFSET") do
          540
        end
      ),
      (
        def encode(:OIDS) do
          541
        end

        def encode("OIDS") do
          541
        end
      ),
      (
        def encode(:OLD) do
          542
        end

        def encode("OLD") do
          542
        end
      ),
      (
        def encode(:ON) do
          543
        end

        def encode("ON") do
          543
        end
      ),
      (
        def encode(:ONLY) do
          544
        end

        def encode("ONLY") do
          544
        end
      ),
      (
        def encode(:OPERATOR) do
          545
        end

        def encode("OPERATOR") do
          545
        end
      ),
      (
        def encode(:OPTION) do
          546
        end

        def encode("OPTION") do
          546
        end
      ),
      (
        def encode(:OPTIONS) do
          547
        end

        def encode("OPTIONS") do
          547
        end
      ),
      (
        def encode(:OR) do
          548
        end

        def encode("OR") do
          548
        end
      ),
      (
        def encode(:ORDER) do
          549
        end

        def encode("ORDER") do
          549
        end
      ),
      (
        def encode(:ORDINALITY) do
          550
        end

        def encode("ORDINALITY") do
          550
        end
      ),
      (
        def encode(:OTHERS) do
          551
        end

        def encode("OTHERS") do
          551
        end
      ),
      (
        def encode(:OUT_P) do
          552
        end

        def encode("OUT_P") do
          552
        end
      ),
      (
        def encode(:OUTER_P) do
          553
        end

        def encode("OUTER_P") do
          553
        end
      ),
      (
        def encode(:OVER) do
          554
        end

        def encode("OVER") do
          554
        end
      ),
      (
        def encode(:OVERLAPS) do
          555
        end

        def encode("OVERLAPS") do
          555
        end
      ),
      (
        def encode(:OVERLAY) do
          556
        end

        def encode("OVERLAY") do
          556
        end
      ),
      (
        def encode(:OVERRIDING) do
          557
        end

        def encode("OVERRIDING") do
          557
        end
      ),
      (
        def encode(:OWNED) do
          558
        end

        def encode("OWNED") do
          558
        end
      ),
      (
        def encode(:OWNER) do
          559
        end

        def encode("OWNER") do
          559
        end
      ),
      (
        def encode(:PARALLEL) do
          560
        end

        def encode("PARALLEL") do
          560
        end
      ),
      (
        def encode(:PARAMETER) do
          561
        end

        def encode("PARAMETER") do
          561
        end
      ),
      (
        def encode(:PARSER) do
          562
        end

        def encode("PARSER") do
          562
        end
      ),
      (
        def encode(:PARTIAL) do
          563
        end

        def encode("PARTIAL") do
          563
        end
      ),
      (
        def encode(:PARTITION) do
          564
        end

        def encode("PARTITION") do
          564
        end
      ),
      (
        def encode(:PASSING) do
          565
        end

        def encode("PASSING") do
          565
        end
      ),
      (
        def encode(:PASSWORD) do
          566
        end

        def encode("PASSWORD") do
          566
        end
      ),
      (
        def encode(:PLACING) do
          567
        end

        def encode("PLACING") do
          567
        end
      ),
      (
        def encode(:PLANS) do
          568
        end

        def encode("PLANS") do
          568
        end
      ),
      (
        def encode(:POLICY) do
          569
        end

        def encode("POLICY") do
          569
        end
      ),
      (
        def encode(:POSITION) do
          570
        end

        def encode("POSITION") do
          570
        end
      ),
      (
        def encode(:PRECEDING) do
          571
        end

        def encode("PRECEDING") do
          571
        end
      ),
      (
        def encode(:PRECISION) do
          572
        end

        def encode("PRECISION") do
          572
        end
      ),
      (
        def encode(:PRESERVE) do
          573
        end

        def encode("PRESERVE") do
          573
        end
      ),
      (
        def encode(:PREPARE) do
          574
        end

        def encode("PREPARE") do
          574
        end
      ),
      (
        def encode(:PREPARED) do
          575
        end

        def encode("PREPARED") do
          575
        end
      ),
      (
        def encode(:PRIMARY) do
          576
        end

        def encode("PRIMARY") do
          576
        end
      ),
      (
        def encode(:PRIOR) do
          577
        end

        def encode("PRIOR") do
          577
        end
      ),
      (
        def encode(:PRIVILEGES) do
          578
        end

        def encode("PRIVILEGES") do
          578
        end
      ),
      (
        def encode(:PROCEDURAL) do
          579
        end

        def encode("PROCEDURAL") do
          579
        end
      ),
      (
        def encode(:PROCEDURE) do
          580
        end

        def encode("PROCEDURE") do
          580
        end
      ),
      (
        def encode(:PROCEDURES) do
          581
        end

        def encode("PROCEDURES") do
          581
        end
      ),
      (
        def encode(:PROGRAM) do
          582
        end

        def encode("PROGRAM") do
          582
        end
      ),
      (
        def encode(:PUBLICATION) do
          583
        end

        def encode("PUBLICATION") do
          583
        end
      ),
      (
        def encode(:QUOTE) do
          584
        end

        def encode("QUOTE") do
          584
        end
      ),
      (
        def encode(:RANGE) do
          585
        end

        def encode("RANGE") do
          585
        end
      ),
      (
        def encode(:READ) do
          586
        end

        def encode("READ") do
          586
        end
      ),
      (
        def encode(:REAL) do
          587
        end

        def encode("REAL") do
          587
        end
      ),
      (
        def encode(:REASSIGN) do
          588
        end

        def encode("REASSIGN") do
          588
        end
      ),
      (
        def encode(:RECHECK) do
          589
        end

        def encode("RECHECK") do
          589
        end
      ),
      (
        def encode(:RECURSIVE) do
          590
        end

        def encode("RECURSIVE") do
          590
        end
      ),
      (
        def encode(:REF_P) do
          591
        end

        def encode("REF_P") do
          591
        end
      ),
      (
        def encode(:REFERENCES) do
          592
        end

        def encode("REFERENCES") do
          592
        end
      ),
      (
        def encode(:REFERENCING) do
          593
        end

        def encode("REFERENCING") do
          593
        end
      ),
      (
        def encode(:REFRESH) do
          594
        end

        def encode("REFRESH") do
          594
        end
      ),
      (
        def encode(:REINDEX) do
          595
        end

        def encode("REINDEX") do
          595
        end
      ),
      (
        def encode(:RELATIVE_P) do
          596
        end

        def encode("RELATIVE_P") do
          596
        end
      ),
      (
        def encode(:RELEASE) do
          597
        end

        def encode("RELEASE") do
          597
        end
      ),
      (
        def encode(:RENAME) do
          598
        end

        def encode("RENAME") do
          598
        end
      ),
      (
        def encode(:REPEATABLE) do
          599
        end

        def encode("REPEATABLE") do
          599
        end
      ),
      (
        def encode(:REPLACE) do
          600
        end

        def encode("REPLACE") do
          600
        end
      ),
      (
        def encode(:REPLICA) do
          601
        end

        def encode("REPLICA") do
          601
        end
      ),
      (
        def encode(:RESET) do
          602
        end

        def encode("RESET") do
          602
        end
      ),
      (
        def encode(:RESTART) do
          603
        end

        def encode("RESTART") do
          603
        end
      ),
      (
        def encode(:RESTRICT) do
          604
        end

        def encode("RESTRICT") do
          604
        end
      ),
      (
        def encode(:RETURN) do
          605
        end

        def encode("RETURN") do
          605
        end
      ),
      (
        def encode(:RETURNING) do
          606
        end

        def encode("RETURNING") do
          606
        end
      ),
      (
        def encode(:RETURNS) do
          607
        end

        def encode("RETURNS") do
          607
        end
      ),
      (
        def encode(:REVOKE) do
          608
        end

        def encode("REVOKE") do
          608
        end
      ),
      (
        def encode(:RIGHT) do
          609
        end

        def encode("RIGHT") do
          609
        end
      ),
      (
        def encode(:ROLE) do
          610
        end

        def encode("ROLE") do
          610
        end
      ),
      (
        def encode(:ROLLBACK) do
          611
        end

        def encode("ROLLBACK") do
          611
        end
      ),
      (
        def encode(:ROLLUP) do
          612
        end

        def encode("ROLLUP") do
          612
        end
      ),
      (
        def encode(:ROUTINE) do
          613
        end

        def encode("ROUTINE") do
          613
        end
      ),
      (
        def encode(:ROUTINES) do
          614
        end

        def encode("ROUTINES") do
          614
        end
      ),
      (
        def encode(:ROW) do
          615
        end

        def encode("ROW") do
          615
        end
      ),
      (
        def encode(:ROWS) do
          616
        end

        def encode("ROWS") do
          616
        end
      ),
      (
        def encode(:RULE) do
          617
        end

        def encode("RULE") do
          617
        end
      ),
      (
        def encode(:SAVEPOINT) do
          618
        end

        def encode("SAVEPOINT") do
          618
        end
      ),
      (
        def encode(:SCHEMA) do
          619
        end

        def encode("SCHEMA") do
          619
        end
      ),
      (
        def encode(:SCHEMAS) do
          620
        end

        def encode("SCHEMAS") do
          620
        end
      ),
      (
        def encode(:SCROLL) do
          621
        end

        def encode("SCROLL") do
          621
        end
      ),
      (
        def encode(:SEARCH) do
          622
        end

        def encode("SEARCH") do
          622
        end
      ),
      (
        def encode(:SECOND_P) do
          623
        end

        def encode("SECOND_P") do
          623
        end
      ),
      (
        def encode(:SECURITY) do
          624
        end

        def encode("SECURITY") do
          624
        end
      ),
      (
        def encode(:SELECT) do
          625
        end

        def encode("SELECT") do
          625
        end
      ),
      (
        def encode(:SEQUENCE) do
          626
        end

        def encode("SEQUENCE") do
          626
        end
      ),
      (
        def encode(:SEQUENCES) do
          627
        end

        def encode("SEQUENCES") do
          627
        end
      ),
      (
        def encode(:SERIALIZABLE) do
          628
        end

        def encode("SERIALIZABLE") do
          628
        end
      ),
      (
        def encode(:SERVER) do
          629
        end

        def encode("SERVER") do
          629
        end
      ),
      (
        def encode(:SESSION) do
          630
        end

        def encode("SESSION") do
          630
        end
      ),
      (
        def encode(:SESSION_USER) do
          631
        end

        def encode("SESSION_USER") do
          631
        end
      ),
      (
        def encode(:SET) do
          632
        end

        def encode("SET") do
          632
        end
      ),
      (
        def encode(:SETS) do
          633
        end

        def encode("SETS") do
          633
        end
      ),
      (
        def encode(:SETOF) do
          634
        end

        def encode("SETOF") do
          634
        end
      ),
      (
        def encode(:SHARE) do
          635
        end

        def encode("SHARE") do
          635
        end
      ),
      (
        def encode(:SHOW) do
          636
        end

        def encode("SHOW") do
          636
        end
      ),
      (
        def encode(:SIMILAR) do
          637
        end

        def encode("SIMILAR") do
          637
        end
      ),
      (
        def encode(:SIMPLE) do
          638
        end

        def encode("SIMPLE") do
          638
        end
      ),
      (
        def encode(:SKIP) do
          639
        end

        def encode("SKIP") do
          639
        end
      ),
      (
        def encode(:SMALLINT) do
          640
        end

        def encode("SMALLINT") do
          640
        end
      ),
      (
        def encode(:SNAPSHOT) do
          641
        end

        def encode("SNAPSHOT") do
          641
        end
      ),
      (
        def encode(:SOME) do
          642
        end

        def encode("SOME") do
          642
        end
      ),
      (
        def encode(:SQL_P) do
          643
        end

        def encode("SQL_P") do
          643
        end
      ),
      (
        def encode(:STABLE) do
          644
        end

        def encode("STABLE") do
          644
        end
      ),
      (
        def encode(:STANDALONE_P) do
          645
        end

        def encode("STANDALONE_P") do
          645
        end
      ),
      (
        def encode(:START) do
          646
        end

        def encode("START") do
          646
        end
      ),
      (
        def encode(:STATEMENT) do
          647
        end

        def encode("STATEMENT") do
          647
        end
      ),
      (
        def encode(:STATISTICS) do
          648
        end

        def encode("STATISTICS") do
          648
        end
      ),
      (
        def encode(:STDIN) do
          649
        end

        def encode("STDIN") do
          649
        end
      ),
      (
        def encode(:STDOUT) do
          650
        end

        def encode("STDOUT") do
          650
        end
      ),
      (
        def encode(:STORAGE) do
          651
        end

        def encode("STORAGE") do
          651
        end
      ),
      (
        def encode(:STORED) do
          652
        end

        def encode("STORED") do
          652
        end
      ),
      (
        def encode(:STRICT_P) do
          653
        end

        def encode("STRICT_P") do
          653
        end
      ),
      (
        def encode(:STRIP_P) do
          654
        end

        def encode("STRIP_P") do
          654
        end
      ),
      (
        def encode(:SUBSCRIPTION) do
          655
        end

        def encode("SUBSCRIPTION") do
          655
        end
      ),
      (
        def encode(:SUBSTRING) do
          656
        end

        def encode("SUBSTRING") do
          656
        end
      ),
      (
        def encode(:SUPPORT) do
          657
        end

        def encode("SUPPORT") do
          657
        end
      ),
      (
        def encode(:SYMMETRIC) do
          658
        end

        def encode("SYMMETRIC") do
          658
        end
      ),
      (
        def encode(:SYSID) do
          659
        end

        def encode("SYSID") do
          659
        end
      ),
      (
        def encode(:SYSTEM_P) do
          660
        end

        def encode("SYSTEM_P") do
          660
        end
      ),
      (
        def encode(:TABLE) do
          661
        end

        def encode("TABLE") do
          661
        end
      ),
      (
        def encode(:TABLES) do
          662
        end

        def encode("TABLES") do
          662
        end
      ),
      (
        def encode(:TABLESAMPLE) do
          663
        end

        def encode("TABLESAMPLE") do
          663
        end
      ),
      (
        def encode(:TABLESPACE) do
          664
        end

        def encode("TABLESPACE") do
          664
        end
      ),
      (
        def encode(:TEMP) do
          665
        end

        def encode("TEMP") do
          665
        end
      ),
      (
        def encode(:TEMPLATE) do
          666
        end

        def encode("TEMPLATE") do
          666
        end
      ),
      (
        def encode(:TEMPORARY) do
          667
        end

        def encode("TEMPORARY") do
          667
        end
      ),
      (
        def encode(:TEXT_P) do
          668
        end

        def encode("TEXT_P") do
          668
        end
      ),
      (
        def encode(:THEN) do
          669
        end

        def encode("THEN") do
          669
        end
      ),
      (
        def encode(:TIES) do
          670
        end

        def encode("TIES") do
          670
        end
      ),
      (
        def encode(:TIME) do
          671
        end

        def encode("TIME") do
          671
        end
      ),
      (
        def encode(:TIMESTAMP) do
          672
        end

        def encode("TIMESTAMP") do
          672
        end
      ),
      (
        def encode(:TO) do
          673
        end

        def encode("TO") do
          673
        end
      ),
      (
        def encode(:TRAILING) do
          674
        end

        def encode("TRAILING") do
          674
        end
      ),
      (
        def encode(:TRANSACTION) do
          675
        end

        def encode("TRANSACTION") do
          675
        end
      ),
      (
        def encode(:TRANSFORM) do
          676
        end

        def encode("TRANSFORM") do
          676
        end
      ),
      (
        def encode(:TREAT) do
          677
        end

        def encode("TREAT") do
          677
        end
      ),
      (
        def encode(:TRIGGER) do
          678
        end

        def encode("TRIGGER") do
          678
        end
      ),
      (
        def encode(:TRIM) do
          679
        end

        def encode("TRIM") do
          679
        end
      ),
      (
        def encode(:TRUE_P) do
          680
        end

        def encode("TRUE_P") do
          680
        end
      ),
      (
        def encode(:TRUNCATE) do
          681
        end

        def encode("TRUNCATE") do
          681
        end
      ),
      (
        def encode(:TRUSTED) do
          682
        end

        def encode("TRUSTED") do
          682
        end
      ),
      (
        def encode(:TYPE_P) do
          683
        end

        def encode("TYPE_P") do
          683
        end
      ),
      (
        def encode(:TYPES_P) do
          684
        end

        def encode("TYPES_P") do
          684
        end
      ),
      (
        def encode(:UESCAPE) do
          685
        end

        def encode("UESCAPE") do
          685
        end
      ),
      (
        def encode(:UNBOUNDED) do
          686
        end

        def encode("UNBOUNDED") do
          686
        end
      ),
      (
        def encode(:UNCOMMITTED) do
          687
        end

        def encode("UNCOMMITTED") do
          687
        end
      ),
      (
        def encode(:UNENCRYPTED) do
          688
        end

        def encode("UNENCRYPTED") do
          688
        end
      ),
      (
        def encode(:UNION) do
          689
        end

        def encode("UNION") do
          689
        end
      ),
      (
        def encode(:UNIQUE) do
          690
        end

        def encode("UNIQUE") do
          690
        end
      ),
      (
        def encode(:UNKNOWN) do
          691
        end

        def encode("UNKNOWN") do
          691
        end
      ),
      (
        def encode(:UNLISTEN) do
          692
        end

        def encode("UNLISTEN") do
          692
        end
      ),
      (
        def encode(:UNLOGGED) do
          693
        end

        def encode("UNLOGGED") do
          693
        end
      ),
      (
        def encode(:UNTIL) do
          694
        end

        def encode("UNTIL") do
          694
        end
      ),
      (
        def encode(:UPDATE) do
          695
        end

        def encode("UPDATE") do
          695
        end
      ),
      (
        def encode(:USER) do
          696
        end

        def encode("USER") do
          696
        end
      ),
      (
        def encode(:USING) do
          697
        end

        def encode("USING") do
          697
        end
      ),
      (
        def encode(:VACUUM) do
          698
        end

        def encode("VACUUM") do
          698
        end
      ),
      (
        def encode(:VALID) do
          699
        end

        def encode("VALID") do
          699
        end
      ),
      (
        def encode(:VALIDATE) do
          700
        end

        def encode("VALIDATE") do
          700
        end
      ),
      (
        def encode(:VALIDATOR) do
          701
        end

        def encode("VALIDATOR") do
          701
        end
      ),
      (
        def encode(:VALUE_P) do
          702
        end

        def encode("VALUE_P") do
          702
        end
      ),
      (
        def encode(:VALUES) do
          703
        end

        def encode("VALUES") do
          703
        end
      ),
      (
        def encode(:VARCHAR) do
          704
        end

        def encode("VARCHAR") do
          704
        end
      ),
      (
        def encode(:VARIADIC) do
          705
        end

        def encode("VARIADIC") do
          705
        end
      ),
      (
        def encode(:VARYING) do
          706
        end

        def encode("VARYING") do
          706
        end
      ),
      (
        def encode(:VERBOSE) do
          707
        end

        def encode("VERBOSE") do
          707
        end
      ),
      (
        def encode(:VERSION_P) do
          708
        end

        def encode("VERSION_P") do
          708
        end
      ),
      (
        def encode(:VIEW) do
          709
        end

        def encode("VIEW") do
          709
        end
      ),
      (
        def encode(:VIEWS) do
          710
        end

        def encode("VIEWS") do
          710
        end
      ),
      (
        def encode(:VOLATILE) do
          711
        end

        def encode("VOLATILE") do
          711
        end
      ),
      (
        def encode(:WHEN) do
          712
        end

        def encode("WHEN") do
          712
        end
      ),
      (
        def encode(:WHERE) do
          713
        end

        def encode("WHERE") do
          713
        end
      ),
      (
        def encode(:WHITESPACE_P) do
          714
        end

        def encode("WHITESPACE_P") do
          714
        end
      ),
      (
        def encode(:WINDOW) do
          715
        end

        def encode("WINDOW") do
          715
        end
      ),
      (
        def encode(:WITH) do
          716
        end

        def encode("WITH") do
          716
        end
      ),
      (
        def encode(:WITHIN) do
          717
        end

        def encode("WITHIN") do
          717
        end
      ),
      (
        def encode(:WITHOUT) do
          718
        end

        def encode("WITHOUT") do
          718
        end
      ),
      (
        def encode(:WORK) do
          719
        end

        def encode("WORK") do
          719
        end
      ),
      (
        def encode(:WRAPPER) do
          720
        end

        def encode("WRAPPER") do
          720
        end
      ),
      (
        def encode(:WRITE) do
          721
        end

        def encode("WRITE") do
          721
        end
      ),
      (
        def encode(:XML_P) do
          722
        end

        def encode("XML_P") do
          722
        end
      ),
      (
        def encode(:XMLATTRIBUTES) do
          723
        end

        def encode("XMLATTRIBUTES") do
          723
        end
      ),
      (
        def encode(:XMLCONCAT) do
          724
        end

        def encode("XMLCONCAT") do
          724
        end
      ),
      (
        def encode(:XMLELEMENT) do
          725
        end

        def encode("XMLELEMENT") do
          725
        end
      ),
      (
        def encode(:XMLEXISTS) do
          726
        end

        def encode("XMLEXISTS") do
          726
        end
      ),
      (
        def encode(:XMLFOREST) do
          727
        end

        def encode("XMLFOREST") do
          727
        end
      ),
      (
        def encode(:XMLNAMESPACES) do
          728
        end

        def encode("XMLNAMESPACES") do
          728
        end
      ),
      (
        def encode(:XMLPARSE) do
          729
        end

        def encode("XMLPARSE") do
          729
        end
      ),
      (
        def encode(:XMLPI) do
          730
        end

        def encode("XMLPI") do
          730
        end
      ),
      (
        def encode(:XMLROOT) do
          731
        end

        def encode("XMLROOT") do
          731
        end
      ),
      (
        def encode(:XMLSERIALIZE) do
          732
        end

        def encode("XMLSERIALIZE") do
          732
        end
      ),
      (
        def encode(:XMLTABLE) do
          733
        end

        def encode("XMLTABLE") do
          733
        end
      ),
      (
        def encode(:YEAR_P) do
          734
        end

        def encode("YEAR_P") do
          734
        end
      ),
      (
        def encode(:YES_P) do
          735
        end

        def encode("YES_P") do
          735
        end
      ),
      (
        def encode(:ZONE) do
          736
        end

        def encode("ZONE") do
          736
        end
      ),
      (
        def encode(:NOT_LA) do
          737
        end

        def encode("NOT_LA") do
          737
        end
      ),
      (
        def encode(:NULLS_LA) do
          738
        end

        def encode("NULLS_LA") do
          738
        end
      ),
      (
        def encode(:WITH_LA) do
          739
        end

        def encode("WITH_LA") do
          739
        end
      ),
      (
        def encode(:MODE_TYPE_NAME) do
          740
        end

        def encode("MODE_TYPE_NAME") do
          740
        end
      ),
      (
        def encode(:MODE_PLPGSQL_EXPR) do
          741
        end

        def encode("MODE_PLPGSQL_EXPR") do
          741
        end
      ),
      (
        def encode(:MODE_PLPGSQL_ASSIGN1) do
          742
        end

        def encode("MODE_PLPGSQL_ASSIGN1") do
          742
        end
      ),
      (
        def encode(:MODE_PLPGSQL_ASSIGN2) do
          743
        end

        def encode("MODE_PLPGSQL_ASSIGN2") do
          743
        end
      ),
      (
        def encode(:MODE_PLPGSQL_ASSIGN3) do
          744
        end

        def encode("MODE_PLPGSQL_ASSIGN3") do
          744
        end
      ),
      (
        def encode(:UMINUS) do
          745
        end

        def encode("UMINUS") do
          745
        end
      )
    ]

    def encode(x) do
      x
    end

    @spec decode(integer()) :: atom() | integer()
    [
      def decode(697) do
        :USING
      end,
      def decode(733) do
        :XMLTABLE
      end,
      def decode(601) do
        :REPLICA
      end,
      def decode(447) do
        :IF_P
      end,
      def decode(294) do
        :AS
      end,
      def decode(267) do
        :PARAM
      end,
      def decode(630) do
        :SESSION
      end,
      def decode(315) do
        :BY
      end,
      def decode(525) do
        :NONE
      end,
      def decode(258) do
        :IDENT
      end,
      def decode(501) do
        :MAPPING
      end,
      def decode(445) do
        :HOUR_P
      end,
      def decode(736) do
        :ZONE
      end,
      def decode(524) do
        :NO
      end,
      def decode(304) do
        :AUTHORIZATION
      end,
      def decode(558) do
        :OWNED
      end,
      def decode(415) do
        :EXTRACT
      end,
      def decode(403) do
        :ESCAPE
      end,
      def decode(407) do
        :EXCLUDING
      end,
      def decode(742) do
        :MODE_PLPGSQL_ASSIGN1
      end,
      def decode(730) do
        :XMLPI
      end,
      def decode(316) do
        :CACHE
      end,
      def decode(481) do
        :LANGUAGE
      end,
      def decode(671) do
        :TIME
      end,
      def decode(307) do
        :BEGIN_P
      end,
      def decode(333) do
        :COALESCE
      end,
      def decode(565) do
        :PASSING
      end,
      def decode(398) do
        :ENABLE_P
      end,
      def decode(496) do
        :LOCALTIMESTAMP
      end,
      def decode(487) do
        :LEAST
      end,
      def decode(314) do
        :BREADTH
      end,
      def decode(651) do
        :STORAGE
      end,
      def decode(729) do
        :XMLPARSE
      end,
      def decode(741) do
        :MODE_PLPGSQL_EXPR
      end,
      def decode(301) do
        :AT
      end,
      def decode(368) do
        :DATA_P
      end,
      def decode(297) do
        :ASSERTION
      end,
      def decode(561) do
        :PARAMETER
      end,
      def decode(298) do
        :ASSIGNMENT
      end,
      def decode(318) do
        :CALLED
      end,
      def decode(459) do
        :INHERIT
      end,
      def decode(570) do
        :POSITION
      end,
      def decode(261) do
        :SCONST
      end,
      def decode(422) do
        :FLOAT_P
      end,
      def decode(440) do
        :GROUPS
      end,
      def decode(93) do
        :ASCII_93
      end,
      def decode(279) do
        :ACCESS
      end,
      def decode(589) do
        :RECHECK
      end,
      def decode(411) do
        :EXPLAIN
      end,
      def decode(611) do
        :ROLLBACK
      end,
      def decode(42) do
        :ASCII_42
      end,
      def decode(92) do
        :ASCII_92
      end,
      def decode(94) do
        :ASCII_94
      end,
      def decode(299) do
        :ASYMMETRIC
      end,
      def decode(484) do
        :LATERAL_P
      end,
      def decode(702) do
        :VALUE_P
      end,
      def decode(281) do
        :ADD_P
      end,
      def decode(515) do
        :NATIONAL
      end,
      def decode(490) do
        :LIKE
      end,
      def decode(300) do
        :ATOMIC
      end,
      def decode(725) do
        :XMLELEMENT
      end,
      def decode(684) do
        :TYPES_P
      end,
      def decode(432) do
        :FUNCTIONS
      end,
      def decode(577) do
        :PRIOR
      end,
      def decode(359) do
        :CURRENT_CATALOG
      end,
      def decode(455) do
        :INCLUDING
      end,
      def decode(711) do
        :VOLATILE
      end,
      def decode(616) do
        :ROWS
      end,
      def decode(600) do
        :REPLACE
      end,
      def decode(683) do
        :TYPE_P
      end,
      def decode(375) do
        :DEFAULT
      end,
      def decode(262) do
        :USCONST
      end,
      def decode(713) do
        :WHERE
      end,
      def decode(353) do
        :COST
      end,
      def decode(680) do
        :TRUE_P
      end,
      def decode(438) do
        :GROUP_P
      end,
      def decode(643) do
        :SQL_P
      end,
      def decode(626) do
        :SEQUENCE
      end,
      def decode(62) do
        :ASCII_62
      end,
      def decode(700) do
        :VALIDATE
      end,
      def decode(363) do
        :CURRENT_TIME
      end,
      def decode(381) do
        :DELIMITER
      end,
      def decode(396) do
        :EACH
      end,
      def decode(293) do
        :ARRAY
      end,
      def decode(464) do
        :INOUT
      end,
      def decode(715) do
        :WINDOW
      end,
      def decode(582) do
        :PROGRAM
      end,
      def decode(284) do
        :AGGREGATE
      end,
      def decode(553) do
        :OUTER_P
      end,
      def decode(365) do
        :CURRENT_USER
      end,
      def decode(657) do
        :SUPPORT
      end,
      def decode(471) do
        :INTERSECT
      end,
      def decode(591) do
        :REF_P
      end,
      def decode(494) do
        :LOCAL
      end,
      def decode(639) do
        :SKIP
      end,
      def decode(356) do
        :CSV
      end,
      def decode(323) do
        :CATALOG_P
      end,
      def decode(659) do
        :SYSID
      end,
      def decode(322) do
        :CAST
      end,
      def decode(430) do
        :FULL
      end,
      def decode(632) do
        :SET
      end,
      def decode(698) do
        :VACUUM
      end,
      def decode(310) do
        :BINARY
      end,
      def decode(597) do
        :RELEASE
      end,
      def decode(703) do
        :VALUES
      end,
      def decode(473) do
        :INTO
      end,
      def decode(260) do
        :FCONST
      end,
      def decode(664) do
        :TABLESPACE
      end,
      def decode(527) do
        :NORMALIZED
      end,
      def decode(443) do
        :HEADER_P
      end,
      def decode(287) do
        :ALTER
      end,
      def decode(557) do
        :OVERRIDING
      end,
      def decode(520) do
        :NFC
      end,
      def decode(674) do
        :TRAILING
      end,
      def decode(688) do
        :UNENCRYPTED
      end,
      def decode(633) do
        :SETS
      end,
      def decode(317) do
        :CALL
      end,
      def decode(650) do
        :STDOUT
      end,
      def decode(416) do
        :FALSE_P
      end,
      def decode(709) do
        :VIEW
      end,
      def decode(519) do
        :NEXT
      end,
      def decode(612) do
        :ROLLUP
      end,
      def decode(474) do
        :INVOKER
      end,
      def decode(712) do
        :WHEN
      end,
      def decode(275) do
        :SQL_COMMENT
      end,
      def decode(667) do
        :TEMPORARY
      end,
      def decode(428) do
        :FREEZE
      end,
      def decode(575) do
        :PREPARED
      end,
      def decode(371) do
        :DEALLOCATE
      end,
      def decode(480) do
        :LABEL
      end,
      def decode(439) do
        :GROUPING
      end,
      def decode(687) do
        :UNCOMMITTED
      end,
      def decode(424) do
        :FOR
      end,
      def decode(295) do
        :ASC
      end,
      def decode(259) do
        :UIDENT
      end,
      def decode(596) do
        :RELATIVE_P
      end,
      def decode(303) do
        :ATTRIBUTE
      end,
      def decode(412) do
        :EXPRESSION
      end,
      def decode(457) do
        :INDEX
      end,
      def decode(285) do
        :ALL
      end,
      def decode(592) do
        :REFERENCES
      end,
      def decode(467) do
        :INSERT
      end,
      def decode(648) do
        :STATISTICS
      end,
      def decode(436) do
        :GRANTED
      end,
      def decode(529) do
        :NOTHING
      end,
      def decode(628) do
        :SERIALIZABLE
      end,
      def decode(358) do
        :CURRENT_P
      end,
      def decode(364) do
        :CURRENT_TIMESTAMP
      end,
      def decode(727) do
        :XMLFOREST
      end,
      def decode(387) do
        :DICTIONARY
      end,
      def decode(376) do
        :DEFAULTS
      end,
      def decode(605) do
        :RETURN
      end,
      def decode(429) do
        :FROM
      end,
      def decode(623) do
        :SECOND_P
      end,
      def decode(372) do
        :DEC
      end,
      def decode(532) do
        :NOWAIT
      end,
      def decode(330) do
        :CLASS
      end,
      def decode(302) do
        :ATTACH
      end,
      def decode(321) do
        :CASE
      end,
      def decode(668) do
        :TEXT_P
      end,
      def decode(556) do
        :OVERLAY
      end,
      def decode(641) do
        :SNAPSHOT
      end,
      def decode(536) do
        :NUMERIC
      end,
      def decode(613) do
        :ROUTINE
      end,
      def decode(566) do
        :PASSWORD
      end,
      def decode(486) do
        :LEAKPROOF
      end,
      def decode(569) do
        :POLICY
      end,
      def decode(537) do
        :OBJECT_P
      end,
      def decode(607) do
        :RETURNS
      end,
      def decode(347) do
        :CONSTRAINT
      end,
      def decode(735) do
        :YES_P
      end,
      def decode(340) do
        :COMMIT
      end,
      def decode(383) do
        :DEPENDS
      end,
      def decode(313) do
        :BOTH
      end,
      def decode(672) do
        :TIMESTAMP
      end,
      def decode(721) do
        :WRITE
      end,
      def decode(551) do
        :OTHERS
      end,
      def decode(622) do
        :SEARCH
      end,
      def decode(666) do
        :TEMPLATE
      end,
      def decode(291) do
        :AND
      end,
      def decode(726) do
        :XMLEXISTS
      end,
      def decode(629) do
        :SERVER
      end,
      def decode(446) do
        :IDENTITY_P
      end,
      def decode(655) do
        :SUBSCRIPTION
      end,
      def decode(653) do
        :STRICT_P
      end,
      def decode(562) do
        :PARSER
      end,
      def decode(345) do
        :CONFLICT
      end,
      def decode(719) do
        :WORK
      end,
      def decode(357) do
        :CUBE
      end,
      def decode(282) do
        :ADMIN
      end,
      def decode(273) do
        :GREATER_EQUALS
      end,
      def decode(441) do
        :HANDLER
      end,
      def decode(58) do
        :ASCII_58
      end,
      def decode(511) do
        :MONTH_P
      end,
      def decode(615) do
        :ROW
      end,
      def decode(350) do
        :CONTINUE_P
      end,
      def decode(378) do
        :DEFERRED
      end,
      def decode(325) do
        :CHAR_P
      end,
      def decode(542) do
        :OLD
      end,
      def decode(460) do
        :INHERITS
      end,
      def decode(717) do
        :WITHIN
      end,
      def decode(420) do
        :FINALIZE
      end,
      def decode(732) do
        :XMLSERIALIZE
      end,
      def decode(271) do
        :EQUALS_GREATER
      end,
      def decode(604) do
        :RESTRICT
      end,
      def decode(418) do
        :FETCH
      end,
      def decode(489) do
        :LEVEL
      end,
      def decode(685) do
        :UESCAPE
      end,
      def decode(512) do
        :MOVE
      end,
      def decode(355) do
        :CROSS
      end,
      def decode(673) do
        :TO
      end,
      def decode(547) do
        :OPTIONS
      end,
      def decode(452) do
        :IMPORT_P
      end,
      def decode(707) do
        :VERBOSE
      end,
      def decode(450) do
        :IMMUTABLE
      end,
      def decode(341) do
        :COMMITTED
      end,
      def decode(583) do
        :PUBLICATION
      end,
      def decode(338) do
        :COMMENT
      end,
      def decode(324) do
        :CHAIN
      end,
      def decode(649) do
        :STDIN
      end,
      def decode(449) do
        :IMMEDIATE
      end,
      def decode(661) do
        :TABLE
      end,
      def decode(482) do
        :LARGE_P
      end,
      def decode(472) do
        :INTERVAL
      end,
      def decode(60) do
        :ASCII_60
      end,
      def decode(662) do
        :TABLES
      end,
      def decode(555) do
        :OVERLAPS
      end,
      def decode(498) do
        :LOCK_P
      end,
      def decode(691) do
        :UNKNOWN
      end,
      def decode(393) do
        :DOMAIN_P
      end,
      def decode(500) do
        :LOGGED
      end,
      def decode(603) do
        :RESTART
      end,
      def decode(678) do
        :TRIGGER
      end,
      def decode(354) do
        :CREATE
      end,
      def decode(395) do
        :DROP
      end,
      def decode(491) do
        :LIMIT
      end,
      def decode(737) do
        :NOT_LA
      end,
      def decode(625) do
        :SELECT
      end,
      def decode(531) do
        :NOTNULL
      end,
      def decode(593) do
        :REFERENCING
      end,
      def decode(699) do
        :VALID
      end,
      def decode(406) do
        :EXCLUDE
      end,
      def decode(389) do
        :DISCARD
      end,
      def decode(522) do
        :NFKC
      end,
      def decode(478) do
        :JOIN
      end,
      def decode(41) do
        :ASCII_41
      end,
      def decode(290) do
        :ANALYZE
      end,
      def decode(296) do
        :ASENSITIVE
      end,
      def decode(351) do
        :CONVERSION_P
      end,
      def decode(509) do
        :MINVALUE
      end,
      def decode(645) do
        :STANDALONE_P
      end,
      def decode(584) do
        :QUOTE
      end,
      def decode(348) do
        :CONSTRAINTS
      end,
      def decode(283) do
        :AFTER
      end,
      def decode(502) do
        :MATCH
      end,
      def decode(40) do
        :ASCII_40
      end,
      def decode(59) do
        :ASCII_59
      end,
      def decode(586) do
        :READ
      end,
      def decode(550) do
        :ORDINALITY
      end,
      def decode(453) do
        :IN_P
      end,
      def decode(646) do
        :START
      end,
      def decode(517) do
        :NCHAR
      end,
      def decode(598) do
        :RENAME
      end,
      def decode(352) do
        :COPY
      end,
      def decode(288) do
        :ALWAYS
      end,
      def decode(442) do
        :HAVING
      end,
      def decode(530) do
        :NOTIFY
      end,
      def decode(425) do
        :FORCE
      end,
      def decode(595) do
        :REINDEX
      end,
      def decode(663) do
        :TABLESAMPLE
      end,
      def decode(0) do
        :NUL
      end,
      def decode(654) do
        :STRIP_P
      end,
      def decode(373) do
        :DECIMAL_P
      end,
      def decode(718) do
        :WITHOUT
      end,
      def decode(388) do
        :DISABLE_P
      end,
      def decode(435) do
        :GRANT
      end,
      def decode(268) do
        :TYPECAST
      end,
      def decode(385) do
        :DESC
      end,
      def decode(631) do
        :SESSION_USER
      end,
      def decode(339) do
        :COMMENTS
      end,
      def decode(681) do
        :TRUNCATE
      end,
      def decode(507) do
        :METHOD
      end,
      def decode(391) do
        :DO
      end,
      def decode(344) do
        :CONFIGURATION
      end,
      def decode(263) do
        :BCONST
      end,
      def decode(670) do
        :TIES
      end,
      def decode(336) do
        :COLUMN
      end,
      def decode(540) do
        :OFFSET
      end,
      def decode(546) do
        :OPTION
      end,
      def decode(686) do
        :UNBOUNDED
      end,
      def decode(390) do
        :DISTINCT
      end,
      def decode(414) do
        :EXTERNAL
      end,
      def decode(516) do
        :NATURAL
      end,
      def decode(526) do
        :NORMALIZE
      end,
      def decode(599) do
        :REPEATABLE
      end,
      def decode(533) do
        :NULL_P
      end,
      def decode(374) do
        :DECLARE
      end,
      def decode(272) do
        :LESS_EQUALS
      end,
      def decode(308) do
        :BETWEEN
      end,
      def decode(463) do
        :INNER_P
      end,
      def decode(723) do
        :XMLATTRIBUTES
      end,
      def decode(337) do
        :COLUMNS
      end,
      def decode(362) do
        :CURRENT_SCHEMA
      end,
      def decode(543) do
        :ON
      end,
      def decode(590) do
        :RECURSIVE
      end,
      def decode(504) do
        :MATERIALIZED
      end,
      def decode(91) do
        :ASCII_91
      end,
      def decode(448) do
        :ILIKE
      end,
      def decode(693) do
        :UNLOGGED
      end,
      def decode(627) do
        :SEQUENCES
      end,
      def decode(549) do
        :ORDER
      end,
      def decode(647) do
        :STATEMENT
      end,
      def decode(614) do
        :ROUTINES
      end,
      def decode(400) do
        :ENCRYPTED
      end,
      def decode(497) do
        :LOCATION
      end,
      def decode(606) do
        :RETURNING
      end,
      def decode(394) do
        :DOUBLE_P
      end,
      def decode(454) do
        :INCLUDE
      end,
      def decode(642) do
        :SOME
      end,
      def decode(488) do
        :LEFT
      end,
      def decode(573) do
        :PRESERVE
      end,
      def decode(465) do
        :INPUT_P
      end,
      def decode(404) do
        :EVENT
      end,
      def decode(408) do
        :EXCLUSIVE
      end,
      def decode(434) do
        :GLOBAL
      end,
      def decode(343) do
        :CONCURRENTLY
      end,
      def decode(433) do
        :GENERATED
      end,
      def decode(658) do
        :SYMMETRIC
      end,
      def decode(503) do
        :MATCHED
      end,
      def decode(280) do
        :ACTION
      end,
      def decode(475) do
        :IS
      end,
      def decode(587) do
        :REAL
      end,
      def decode(458) do
        :INDEXES
      end,
      def decode(554) do
        :OVER
      end,
      def decode(266) do
        :ICONST
      end,
      def decode(379) do
        :DEFINER
      end,
      def decode(479) do
        :KEY
      end,
      def decode(618) do
        :SAVEPOINT
      end,
      def decode(514) do
        :NAMES
      end,
      def decode(431) do
        :FUNCTION
      end,
      def decode(469) do
        :INT_P
      end,
      def decode(335) do
        :COLLATION
      end,
      def decode(675) do
        :TRANSACTION
      end,
      def decode(483) do
        :LAST_P
      end,
      def decode(734) do
        :YEAR_P
      end,
      def decode(485) do
        :LEADING
      end,
      def decode(264) do
        :XCONST
      end,
      def decode(720) do
        :WRAPPER
      end,
      def decode(710) do
        :VIEWS
      end,
      def decode(660) do
        :SYSTEM_P
      end,
      def decode(320) do
        :CASCADED
      end,
      def decode(581) do
        :PROCEDURES
      end,
      def decode(563) do
        :PARTIAL
      end,
      def decode(619) do
        :SCHEMA
      end,
      def decode(705) do
        :VARIADIC
      end,
      def decode(269) do
        :DOT_DOT
      end,
      def decode(695) do
        :UPDATE
      end,
      def decode(744) do
        :MODE_PLPGSQL_ASSIGN3
      end,
      def decode(521) do
        :NFD
      end,
      def decode(37) do
        :ASCII_37
      end,
      def decode(580) do
        :PROCEDURE
      end,
      def decode(462) do
        :INLINE_P
      end,
      def decode(329) do
        :CHECKPOINT
      end,
      def decode(361) do
        :CURRENT_ROLE
      end,
      def decode(638) do
        :SIMPLE
      end,
      def decode(384) do
        :DEPTH
      end,
      def decode(576) do
        :PRIMARY
      end,
      def decode(644) do
        :STABLE
      end,
      def decode(417) do
        :FAMILY
      end,
      def decode(635) do
        :SHARE
      end,
      def decode(701) do
        :VALIDATOR
      end,
      def decode(419) do
        :FILTER
      end,
      def decode(508) do
        :MINUTE_P
      end,
      def decode(392) do
        :DOCUMENT_P
      end,
      def decode(728) do
        :XMLNAMESPACES
      end,
      def decode(677) do
        :TREAT
      end,
      def decode(738) do
        :NULLS_LA
      end,
      def decode(451) do
        :IMPLICIT_P
      end,
      def decode(545) do
        :OPERATOR
      end,
      def decode(510) do
        :MODE
      end,
      def decode(724) do
        :XMLCONCAT
      end,
      def decode(637) do
        :SIMILAR
      end,
      def decode(380) do
        :DELETE_P
      end,
      def decode(444) do
        :HOLD
      end,
      def decode(544) do
        :ONLY
      end,
      def decode(470) do
        :INTEGER
      end,
      def decode(745) do
        :UMINUS
      end,
      def decode(594) do
        :REFRESH
      end,
      def decode(46) do
        :ASCII_46
      end,
      def decode(305) do
        :BACKWARD
      end,
      def decode(278) do
        :ABSOLUTE_P
      end,
      def decode(495) do
        :LOCALTIME
      end,
      def decode(682) do
        :TRUSTED
      end,
      def decode(624) do
        :SECURITY
      end,
      def decode(694) do
        :UNTIL
      end,
      def decode(656) do
        :SUBSTRING
      end,
      def decode(560) do
        :PARALLEL
      end,
      def decode(306) do
        :BEFORE
      end,
      def decode(610) do
        :ROLE
      end,
      def decode(63) do
        :ASCII_63
      end,
      def decode(617) do
        :RULE
      end,
      def decode(706) do
        :VARYING
      end,
      def decode(505) do
        :MAXVALUE
      end,
      def decode(665) do
        :TEMP
      end,
      def decode(409) do
        :EXECUTE
      end,
      def decode(640) do
        :SMALLINT
      end,
      def decode(461) do
        :INITIALLY
      end,
      def decode(679) do
        :TRIM
      end,
      def decode(608) do
        :REVOKE
      end,
      def decode(468) do
        :INSTEAD
      end,
      def decode(382) do
        :DELIMITERS
      end,
      def decode(588) do
        :REASSIGN
      end,
      def decode(708) do
        :VERSION_P
      end,
      def decode(366) do
        :CURSOR
      end,
      def decode(602) do
        :RESET
      end,
      def decode(567) do
        :PLACING
      end,
      def decode(535) do
        :NULLS_P
      end,
      def decode(634) do
        :SETOF
      end,
      def decode(528) do
        :NOT
      end,
      def decode(552) do
        :OUT_P
      end,
      def decode(571) do
        :PRECEDING
      end,
      def decode(692) do
        :UNLISTEN
      end,
      def decode(332) do
        :CLUSTER
      end,
      def decode(539) do
        :OFF
      end,
      def decode(274) do
        :NOT_EQUALS
      end,
      def decode(714) do
        :WHITESPACE_P
      end,
      def decode(265) do
        :Op
      end,
      def decode(676) do
        :TRANSFORM
      end,
      def decode(743) do
        :MODE_PLPGSQL_ASSIGN2
      end,
      def decode(696) do
        :USER
      end,
      def decode(426) do
        :FOREIGN
      end,
      def decode(476) do
        :ISNULL
      end,
      def decode(499) do
        :LOCKED
      end,
      def decode(402) do
        :ENUM_P
      end,
      def decode(386) do
        :DETACH
      end,
      def decode(585) do
        :RANGE
      end,
      def decode(731) do
        :XMLROOT
      end,
      def decode(493) do
        :LOAD
      end,
      def decode(331) do
        :CLOSE
      end,
      def decode(423) do
        :FOLLOWING
      end,
      def decode(397) do
        :ELSE
      end,
      def decode(541) do
        :OIDS
      end,
      def decode(286) do
        :ALSO
      end,
      def decode(312) do
        :BOOLEAN_P
      end,
      def decode(276) do
        :C_COMMENT
      end,
      def decode(652) do
        :STORED
      end,
      def decode(342) do
        :COMPRESSION
      end,
      def decode(609) do
        :RIGHT
      end,
      def decode(421) do
        :FIRST_P
      end,
      def decode(620) do
        :SCHEMAS
      end,
      def decode(370) do
        :DAY_P
      end,
      def decode(45) do
        :ASCII_45
      end,
      def decode(538) do
        :OF
      end,
      def decode(43) do
        :ASCII_43
      end,
      def decode(572) do
        :PRECISION
      end,
      def decode(292) do
        :ANY
      end,
      def decode(61) do
        :ASCII_61
      end,
      def decode(346) do
        :CONNECTION
      end,
      def decode(578) do
        :PRIVILEGES
      end,
      def decode(568) do
        :PLANS
      end,
      def decode(437) do
        :GREATEST
      end,
      def decode(369) do
        :DATABASE
      end,
      def decode(548) do
        :OR
      end,
      def decode(739) do
        :WITH_LA
      end,
      def decode(506) do
        :MERGE
      end,
      def decode(689) do
        :UNION
      end,
      def decode(47) do
        :ASCII_47
      end,
      def decode(319) do
        :CASCADE
      end,
      def decode(534) do
        :NULLIF
      end,
      def decode(523) do
        :NFKD
      end,
      def decode(574) do
        :PREPARE
      end,
      def decode(722) do
        :XML_P
      end,
      def decode(690) do
        :UNIQUE
      end,
      def decode(466) do
        :INSENSITIVE
      end,
      def decode(44) do
        :ASCII_44
      end,
      def decode(410) do
        :EXISTS
      end,
      def decode(367) do
        :CYCLE
      end,
      def decode(334) do
        :COLLATE
      end,
      def decode(716) do
        :WITH
      end,
      def decode(427) do
        :FORWARD
      end,
      def decode(328) do
        :CHECK
      end,
      def decode(405) do
        :EXCEPT
      end,
      def decode(513) do
        :NAME_P
      end,
      def decode(636) do
        :SHOW
      end,
      def decode(349) do
        :CONTENT_P
      end,
      def decode(559) do
        :OWNER
      end,
      def decode(564) do
        :PARTITION
      end,
      def decode(270) do
        :COLON_EQUALS
      end,
      def decode(327) do
        :CHARACTERISTICS
      end,
      def decode(311) do
        :BIT
      end,
      def decode(669) do
        :THEN
      end,
      def decode(360) do
        :CURRENT_DATE
      end,
      def decode(492) do
        :LISTEN
      end,
      def decode(621) do
        :SCROLL
      end,
      def decode(740) do
        :MODE_TYPE_NAME
      end,
      def decode(704) do
        :VARCHAR
      end,
      def decode(477) do
        :ISOLATION
      end,
      def decode(413) do
        :EXTENSION
      end,
      def decode(399) do
        :ENCODING
      end,
      def decode(277) do
        :ABORT_P
      end,
      def decode(579) do
        :PROCEDURAL
      end,
      def decode(377) do
        :DEFERRABLE
      end,
      def decode(309) do
        :BIGINT
      end,
      def decode(401) do
        :END_P
      end,
      def decode(456) do
        :INCREMENT
      end,
      def decode(518) do
        :NEW
      end,
      def decode(289) do
        :ANALYSE
      end,
      def decode(326) do
        :CHARACTER
      end
    ]

    def decode(x) do
      x
    end

    @spec constants() :: [{integer(), atom()}]
    def constants() do
      [
        {0, :NUL},
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
        {278, :ABSOLUTE_P},
        {279, :ACCESS},
        {280, :ACTION},
        {281, :ADD_P},
        {282, :ADMIN},
        {283, :AFTER},
        {284, :AGGREGATE},
        {285, :ALL},
        {286, :ALSO},
        {287, :ALTER},
        {288, :ALWAYS},
        {289, :ANALYSE},
        {290, :ANALYZE},
        {291, :AND},
        {292, :ANY},
        {293, :ARRAY},
        {294, :AS},
        {295, :ASC},
        {296, :ASENSITIVE},
        {297, :ASSERTION},
        {298, :ASSIGNMENT},
        {299, :ASYMMETRIC},
        {300, :ATOMIC},
        {301, :AT},
        {302, :ATTACH},
        {303, :ATTRIBUTE},
        {304, :AUTHORIZATION},
        {305, :BACKWARD},
        {306, :BEFORE},
        {307, :BEGIN_P},
        {308, :BETWEEN},
        {309, :BIGINT},
        {310, :BINARY},
        {311, :BIT},
        {312, :BOOLEAN_P},
        {313, :BOTH},
        {314, :BREADTH},
        {315, :BY},
        {316, :CACHE},
        {317, :CALL},
        {318, :CALLED},
        {319, :CASCADE},
        {320, :CASCADED},
        {321, :CASE},
        {322, :CAST},
        {323, :CATALOG_P},
        {324, :CHAIN},
        {325, :CHAR_P},
        {326, :CHARACTER},
        {327, :CHARACTERISTICS},
        {328, :CHECK},
        {329, :CHECKPOINT},
        {330, :CLASS},
        {331, :CLOSE},
        {332, :CLUSTER},
        {333, :COALESCE},
        {334, :COLLATE},
        {335, :COLLATION},
        {336, :COLUMN},
        {337, :COLUMNS},
        {338, :COMMENT},
        {339, :COMMENTS},
        {340, :COMMIT},
        {341, :COMMITTED},
        {342, :COMPRESSION},
        {343, :CONCURRENTLY},
        {344, :CONFIGURATION},
        {345, :CONFLICT},
        {346, :CONNECTION},
        {347, :CONSTRAINT},
        {348, :CONSTRAINTS},
        {349, :CONTENT_P},
        {350, :CONTINUE_P},
        {351, :CONVERSION_P},
        {352, :COPY},
        {353, :COST},
        {354, :CREATE},
        {355, :CROSS},
        {356, :CSV},
        {357, :CUBE},
        {358, :CURRENT_P},
        {359, :CURRENT_CATALOG},
        {360, :CURRENT_DATE},
        {361, :CURRENT_ROLE},
        {362, :CURRENT_SCHEMA},
        {363, :CURRENT_TIME},
        {364, :CURRENT_TIMESTAMP},
        {365, :CURRENT_USER},
        {366, :CURSOR},
        {367, :CYCLE},
        {368, :DATA_P},
        {369, :DATABASE},
        {370, :DAY_P},
        {371, :DEALLOCATE},
        {372, :DEC},
        {373, :DECIMAL_P},
        {374, :DECLARE},
        {375, :DEFAULT},
        {376, :DEFAULTS},
        {377, :DEFERRABLE},
        {378, :DEFERRED},
        {379, :DEFINER},
        {380, :DELETE_P},
        {381, :DELIMITER},
        {382, :DELIMITERS},
        {383, :DEPENDS},
        {384, :DEPTH},
        {385, :DESC},
        {386, :DETACH},
        {387, :DICTIONARY},
        {388, :DISABLE_P},
        {389, :DISCARD},
        {390, :DISTINCT},
        {391, :DO},
        {392, :DOCUMENT_P},
        {393, :DOMAIN_P},
        {394, :DOUBLE_P},
        {395, :DROP},
        {396, :EACH},
        {397, :ELSE},
        {398, :ENABLE_P},
        {399, :ENCODING},
        {400, :ENCRYPTED},
        {401, :END_P},
        {402, :ENUM_P},
        {403, :ESCAPE},
        {404, :EVENT},
        {405, :EXCEPT},
        {406, :EXCLUDE},
        {407, :EXCLUDING},
        {408, :EXCLUSIVE},
        {409, :EXECUTE},
        {410, :EXISTS},
        {411, :EXPLAIN},
        {412, :EXPRESSION},
        {413, :EXTENSION},
        {414, :EXTERNAL},
        {415, :EXTRACT},
        {416, :FALSE_P},
        {417, :FAMILY},
        {418, :FETCH},
        {419, :FILTER},
        {420, :FINALIZE},
        {421, :FIRST_P},
        {422, :FLOAT_P},
        {423, :FOLLOWING},
        {424, :FOR},
        {425, :FORCE},
        {426, :FOREIGN},
        {427, :FORWARD},
        {428, :FREEZE},
        {429, :FROM},
        {430, :FULL},
        {431, :FUNCTION},
        {432, :FUNCTIONS},
        {433, :GENERATED},
        {434, :GLOBAL},
        {435, :GRANT},
        {436, :GRANTED},
        {437, :GREATEST},
        {438, :GROUP_P},
        {439, :GROUPING},
        {440, :GROUPS},
        {441, :HANDLER},
        {442, :HAVING},
        {443, :HEADER_P},
        {444, :HOLD},
        {445, :HOUR_P},
        {446, :IDENTITY_P},
        {447, :IF_P},
        {448, :ILIKE},
        {449, :IMMEDIATE},
        {450, :IMMUTABLE},
        {451, :IMPLICIT_P},
        {452, :IMPORT_P},
        {453, :IN_P},
        {454, :INCLUDE},
        {455, :INCLUDING},
        {456, :INCREMENT},
        {457, :INDEX},
        {458, :INDEXES},
        {459, :INHERIT},
        {460, :INHERITS},
        {461, :INITIALLY},
        {462, :INLINE_P},
        {463, :INNER_P},
        {464, :INOUT},
        {465, :INPUT_P},
        {466, :INSENSITIVE},
        {467, :INSERT},
        {468, :INSTEAD},
        {469, :INT_P},
        {470, :INTEGER},
        {471, :INTERSECT},
        {472, :INTERVAL},
        {473, :INTO},
        {474, :INVOKER},
        {475, :IS},
        {476, :ISNULL},
        {477, :ISOLATION},
        {478, :JOIN},
        {479, :KEY},
        {480, :LABEL},
        {481, :LANGUAGE},
        {482, :LARGE_P},
        {483, :LAST_P},
        {484, :LATERAL_P},
        {485, :LEADING},
        {486, :LEAKPROOF},
        {487, :LEAST},
        {488, :LEFT},
        {489, :LEVEL},
        {490, :LIKE},
        {491, :LIMIT},
        {492, :LISTEN},
        {493, :LOAD},
        {494, :LOCAL},
        {495, :LOCALTIME},
        {496, :LOCALTIMESTAMP},
        {497, :LOCATION},
        {498, :LOCK_P},
        {499, :LOCKED},
        {500, :LOGGED},
        {501, :MAPPING},
        {502, :MATCH},
        {503, :MATCHED},
        {504, :MATERIALIZED},
        {505, :MAXVALUE},
        {506, :MERGE},
        {507, :METHOD},
        {508, :MINUTE_P},
        {509, :MINVALUE},
        {510, :MODE},
        {511, :MONTH_P},
        {512, :MOVE},
        {513, :NAME_P},
        {514, :NAMES},
        {515, :NATIONAL},
        {516, :NATURAL},
        {517, :NCHAR},
        {518, :NEW},
        {519, :NEXT},
        {520, :NFC},
        {521, :NFD},
        {522, :NFKC},
        {523, :NFKD},
        {524, :NO},
        {525, :NONE},
        {526, :NORMALIZE},
        {527, :NORMALIZED},
        {528, :NOT},
        {529, :NOTHING},
        {530, :NOTIFY},
        {531, :NOTNULL},
        {532, :NOWAIT},
        {533, :NULL_P},
        {534, :NULLIF},
        {535, :NULLS_P},
        {536, :NUMERIC},
        {537, :OBJECT_P},
        {538, :OF},
        {539, :OFF},
        {540, :OFFSET},
        {541, :OIDS},
        {542, :OLD},
        {543, :ON},
        {544, :ONLY},
        {545, :OPERATOR},
        {546, :OPTION},
        {547, :OPTIONS},
        {548, :OR},
        {549, :ORDER},
        {550, :ORDINALITY},
        {551, :OTHERS},
        {552, :OUT_P},
        {553, :OUTER_P},
        {554, :OVER},
        {555, :OVERLAPS},
        {556, :OVERLAY},
        {557, :OVERRIDING},
        {558, :OWNED},
        {559, :OWNER},
        {560, :PARALLEL},
        {561, :PARAMETER},
        {562, :PARSER},
        {563, :PARTIAL},
        {564, :PARTITION},
        {565, :PASSING},
        {566, :PASSWORD},
        {567, :PLACING},
        {568, :PLANS},
        {569, :POLICY},
        {570, :POSITION},
        {571, :PRECEDING},
        {572, :PRECISION},
        {573, :PRESERVE},
        {574, :PREPARE},
        {575, :PREPARED},
        {576, :PRIMARY},
        {577, :PRIOR},
        {578, :PRIVILEGES},
        {579, :PROCEDURAL},
        {580, :PROCEDURE},
        {581, :PROCEDURES},
        {582, :PROGRAM},
        {583, :PUBLICATION},
        {584, :QUOTE},
        {585, :RANGE},
        {586, :READ},
        {587, :REAL},
        {588, :REASSIGN},
        {589, :RECHECK},
        {590, :RECURSIVE},
        {591, :REF_P},
        {592, :REFERENCES},
        {593, :REFERENCING},
        {594, :REFRESH},
        {595, :REINDEX},
        {596, :RELATIVE_P},
        {597, :RELEASE},
        {598, :RENAME},
        {599, :REPEATABLE},
        {600, :REPLACE},
        {601, :REPLICA},
        {602, :RESET},
        {603, :RESTART},
        {604, :RESTRICT},
        {605, :RETURN},
        {606, :RETURNING},
        {607, :RETURNS},
        {608, :REVOKE},
        {609, :RIGHT},
        {610, :ROLE},
        {611, :ROLLBACK},
        {612, :ROLLUP},
        {613, :ROUTINE},
        {614, :ROUTINES},
        {615, :ROW},
        {616, :ROWS},
        {617, :RULE},
        {618, :SAVEPOINT},
        {619, :SCHEMA},
        {620, :SCHEMAS},
        {621, :SCROLL},
        {622, :SEARCH},
        {623, :SECOND_P},
        {624, :SECURITY},
        {625, :SELECT},
        {626, :SEQUENCE},
        {627, :SEQUENCES},
        {628, :SERIALIZABLE},
        {629, :SERVER},
        {630, :SESSION},
        {631, :SESSION_USER},
        {632, :SET},
        {633, :SETS},
        {634, :SETOF},
        {635, :SHARE},
        {636, :SHOW},
        {637, :SIMILAR},
        {638, :SIMPLE},
        {639, :SKIP},
        {640, :SMALLINT},
        {641, :SNAPSHOT},
        {642, :SOME},
        {643, :SQL_P},
        {644, :STABLE},
        {645, :STANDALONE_P},
        {646, :START},
        {647, :STATEMENT},
        {648, :STATISTICS},
        {649, :STDIN},
        {650, :STDOUT},
        {651, :STORAGE},
        {652, :STORED},
        {653, :STRICT_P},
        {654, :STRIP_P},
        {655, :SUBSCRIPTION},
        {656, :SUBSTRING},
        {657, :SUPPORT},
        {658, :SYMMETRIC},
        {659, :SYSID},
        {660, :SYSTEM_P},
        {661, :TABLE},
        {662, :TABLES},
        {663, :TABLESAMPLE},
        {664, :TABLESPACE},
        {665, :TEMP},
        {666, :TEMPLATE},
        {667, :TEMPORARY},
        {668, :TEXT_P},
        {669, :THEN},
        {670, :TIES},
        {671, :TIME},
        {672, :TIMESTAMP},
        {673, :TO},
        {674, :TRAILING},
        {675, :TRANSACTION},
        {676, :TRANSFORM},
        {677, :TREAT},
        {678, :TRIGGER},
        {679, :TRIM},
        {680, :TRUE_P},
        {681, :TRUNCATE},
        {682, :TRUSTED},
        {683, :TYPE_P},
        {684, :TYPES_P},
        {685, :UESCAPE},
        {686, :UNBOUNDED},
        {687, :UNCOMMITTED},
        {688, :UNENCRYPTED},
        {689, :UNION},
        {690, :UNIQUE},
        {691, :UNKNOWN},
        {692, :UNLISTEN},
        {693, :UNLOGGED},
        {694, :UNTIL},
        {695, :UPDATE},
        {696, :USER},
        {697, :USING},
        {698, :VACUUM},
        {699, :VALID},
        {700, :VALIDATE},
        {701, :VALIDATOR},
        {702, :VALUE_P},
        {703, :VALUES},
        {704, :VARCHAR},
        {705, :VARIADIC},
        {706, :VARYING},
        {707, :VERBOSE},
        {708, :VERSION_P},
        {709, :VIEW},
        {710, :VIEWS},
        {711, :VOLATILE},
        {712, :WHEN},
        {713, :WHERE},
        {714, :WHITESPACE_P},
        {715, :WINDOW},
        {716, :WITH},
        {717, :WITHIN},
        {718, :WITHOUT},
        {719, :WORK},
        {720, :WRAPPER},
        {721, :WRITE},
        {722, :XML_P},
        {723, :XMLATTRIBUTES},
        {724, :XMLCONCAT},
        {725, :XMLELEMENT},
        {726, :XMLEXISTS},
        {727, :XMLFOREST},
        {728, :XMLNAMESPACES},
        {729, :XMLPARSE},
        {730, :XMLPI},
        {731, :XMLROOT},
        {732, :XMLSERIALIZE},
        {733, :XMLTABLE},
        {734, :YEAR_P},
        {735, :YES_P},
        {736, :ZONE},
        {737, :NOT_LA},
        {738, :NULLS_LA},
        {739, :WITH_LA},
        {740, :MODE_TYPE_NAME},
        {741, :MODE_PLPGSQL_EXPR},
        {742, :MODE_PLPGSQL_ASSIGN1},
        {743, :MODE_PLPGSQL_ASSIGN2},
        {744, :MODE_PLPGSQL_ASSIGN3},
        {745, :UMINUS}
      ]
    end

    @spec has_constant?(any()) :: boolean()
    (
      [
        def has_constant?(:NUL) do
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
        def has_constant?(:KEY) do
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
        def has_constant?(:PLACING) do
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
        def has_constant?(:NOT_LA) do
          true
        end,
        def has_constant?(:NULLS_LA) do
          true
        end,
        def has_constant?(:WITH_LA) do
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
