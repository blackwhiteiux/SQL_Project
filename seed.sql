INSERT INTO guitar_store.categories (category_name)
VALUES ('Classical guitar'),
       ('Acoustic guitar'),
       ('Electro guitar'),
       ('Bass guitar'),
       ('Ukulele');

INSERT INTO guitar_store.products(product_name, category_id, price)
VALUES ('Yamaha C40', 1, 15590),
       ('Fender ESC-110', 1, 25690),
       ('Belucci BC3805 BK', 1, 3449),
       ('Yamaha F-310', 2, 16490),
       ('Fender CD-60', 2, 25399),
       ('Kremona M10E', 2, 53000),
       ('Cort G-110', 3, 15340),
       ('Yamaha Pacifica 012', 3, 36990),
       ('Fender Stratocaster', 3, 79900),
       ('Cort Action-PG', 4, 19990),
       ('Yamaha TRBX174', 4, 41990),
       ('Fender Jazz Bass', 4, 139000),
       ('Homage RS-C1', 5, 1770),
       ('Terris JUS-11', 5, 1830),
       ('Tom TUS-200', 5, 5900);

INSERT INTO guitar_store.users (user_name, email)
VALUES ('Alice', 'alice@gmail.com'),
       ('Bob', 'bob2425@gmail.com'),
       ('Jimmy', 'hendrix11414@gmail.com'),
       ('Roman', 'bulakhov1414@gmail.com'),
       ('John', 'fruciante@gmail.com');

INSERT INTO guitar_store.orders(user_id, order_date)
VALUES (1, '2026-03-10'),
       (1, '2026-03-12'),
       (1, '2026-03-09'),
       (2, '2026-03-10'),
       (2, '2026-03-02'),
       (2, '2026-03-05'),
       (2, '2026-03-01'),
       (3, '2026-03-03'),
       (3, '2026-03-08'),
       (4, '2026-03-18'),
       (5, '2026-03-03'),
       (5, '2026-03-02'),
       (5, '2026-03-17'),
       (5, '2026-03-13'),
       (5, '2026-03-11');

INSERT INTO guitar_store.order_items (order_id, product_id, quantity)
VALUES (1, 10, 1),
       (2, 7, 2),
       (3, 6, 1),
       (4, 1, 1),
       (5, 2, 3),
       (6, 3, 3),
       (7, 4, 1),
       (8, 5, 1),
       (9, 8, 4),
       (10, 9, 1),
       (11, 11, 9),
       (12, 15, 5),
       (13, 14, 1),
       (14, 12, 1),
       (15, 13, 1);