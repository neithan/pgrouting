\i setup.sql

SELECT plan(18);



-- 0 edge, 0 vertex tests

PREPARE q1 AS
SELECT id, source, target, cost, reverse_cost
FROM edge_table
WHERE id > 18;

-- Graph is empty - it has 0 edge and 0 vertex
SELECT is_empty('q1', 'q1: Graph with 0 edge and 0 vertex');

-- 0 edge, 0 vertex tests

PREPARE boyerMyrvold2 AS
SELECT *
FROM pgr_boyerMyrvold(
    'SELECT id, source, target, cost, reverse_cost
    FROM edge_table
    WHERE id > 18'
);

PREPARE boyerMyrvold3 AS
SELECT *
FROM pgr_boyerMyrvold(
    'SELECT id, source, target, cost, reverse_cost
    FROM edge_table
    WHERE id > 18'
);

PREPARE boyerMyrvold AS
SELECT *
FROM pgr_boyerMyrvold(
    'SELECT id, source, target, cost, reverse_cost
    FROM edge_table
    WHERE id > 18'
);

PREPARE boyerMyrvold5 AS
SELECT *
FROM pgr_boyerMyrvold(
    'SELECT id, source, target, cost, reverse_cost
    FROM edge_table
    WHERE id > 18'
);

PREPARE boyerMyrvold6 AS
SELECT *
FROM pgr_boyerMyrvold(
    'SELECT id, source, target, cost, reverse_cost
    FROM edge_table
    WHERE id > 18'
);

PREPARE boyerMyrvold7 AS
SELECT *
FROM pgr_boyerMyrvold(
    'SELECT id, source, target, cost, reverse_cost
    FROM edge_table
    WHERE id > 18'
);

SELECT is_empty('boyerMyrvold2', '2: Graph with 0 edge and 0 vertex -> Empty row is returned');
SELECT is_empty('boyerMyrvold3', '3: Graph with 0 edge and 0 vertex -> Empty row is returned');
SELECT is_empty('boyerMyrvold', '4: Graph with 0 edge and 0 vertex -> Empty row is returned');
SELECT is_empty('boyerMyrvold5', '5: Graph with 0 edge and 0 vertex -> Empty row is returned');
SELECT is_empty('boyerMyrvold6', '6: Graph with 0 edge and 0 vertex -> Empty row is returned');
SELECT is_empty('boyerMyrvold7', '7: Graph with 0 edge and 0 vertex -> Empty row is returned');

-- vertex not present in graph tests

PREPARE boyerMyrvold8 AS
SELECT *
FROM pgr_boyerMyrvold(
    'SELECT id, source, target, cost, reverse_cost
    FROM edge_table WHERE id = -10'
);

PREPARE boyerMyrvold9 AS
SELECT *
FROM pgr_boyerMyrvold(
    'SELECT id, source, target, cost, reverse_cost
    FROM edge_table WHERE id IN (-10,50)'
);

PREPARE boyerMyrvold10 AS
SELECT *
FROM pgr_boyerMyrvold(
    'SELECT id, source, target, cost, reverse_cost
    FROM edge_table WHERE id IN (-10,-20,-30)'
);

PREPARE boyerMyrvold11 AS
SELECT *
FROM pgr_boyerMyrvold(
    'SELECT id, source, target, cost, reverse_cost
    FROM edge_table WHERE id IN (-10,33,39)'
);

PREPARE boyerMyrvold12 AS
SELECT *
FROM pgr_boyerMyrvold(
    'SELECT id, source, target, cost, reverse_cost
    FROM edge_table WHERE id = 36'
);

PREPARE boyerMyrvold13 AS
SELECT *
FROM pgr_boyerMyrvold(
    'SELECT id, source, target, cost, reverse_cost
    FROM edge_table WHERE id IN (36,45,34)'
);

SELECT is_empty('boyerMyrvold8', '8: Vertex not present in graph -> Empty row is returned');
SELECT is_empty('boyerMyrvold9', '9: Vertex not present in graph -> Empty row is returned');
SELECT is_empty('boyerMyrvold10', '10: Vertex not present in graph -> Empty row is returned');
SELECT is_empty('boyerMyrvold11', '11: Vertex not present in graph -> Empty row is returned');
SELECT is_empty('boyerMyrvold12', '12: Vertex not present in graph -> Empty row is returned');
SELECT is_empty('boyerMyrvold13', '13: Vertex not present in graph -> Empty row is returned');


-- 1 vertex tests

PREPARE q14 AS
SELECT id, source, 6 AS target, cost, reverse_cost
FROM edge_table
WHERE id = 9;

-- Graph with only vertex 9
SELECT set_eq('q14', $$VALUES (9, 6, 6, 1, 1)$$, 'q14: Graph with only vertex 6');

-- 1 vertex tests

PREPARE boyerMyrvold15 AS
SELECT *
FROM pgr_boyerMyrvold(
    'SELECT id, source, 6 AS target, cost, reverse_cost
    FROM edge_table
    WHERE id = 9'
);

PREPARE boyerMyrvold16 AS
SELECT *
FROM pgr_boyerMyrvold(
    'SELECT id, source, 6 AS target, cost, reverse_cost
    FROM edge_table
    WHERE id = 9'
);

PREPARE boyerMyrvold17 AS
SELECT *
FROM pgr_boyerMyrvold(
    'SELECT id, source, 6 AS target, cost, reverse_cost
    FROM edge_table
    WHERE id = 9'
);

PREPARE boyerMyrvold18 AS
SELECT *
FROM pgr_boyerMyrvold(
    'SELECT id, source, 6 AS target, cost, reverse_cost
    FROM edge_table
    WHERE id = 9'
);

SELECT set_eq('boyerMyrvold15', $$VALUES (1, 6, 6, 1)$$, '15: One row is returned');
SELECT set_eq('boyerMyrvold16', $$VALUES (1, 6, 6, 1)$$, '16: One row is returned');
SELECT set_eq('boyerMyrvold17', $$VALUES (1, 6, 6, 1)$$, '17: One row is returned');
SELECT set_eq('boyerMyrvold18', $$VALUES (1, 6, 6, 1)$$, '18: One row is returned');




SELECT * FROM finish();
ROLLBACK;