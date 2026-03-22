                                        SELECT запросы

    1. Список заказов совершенных до 10 марта

SELECT o.order_id
FROM guitar_store.orders AS o
WHERE o.order_date < '2026-03-10';

2. Вывести названия гитар с ценой более 20000
в категории электрогитары в порядке убывания цены

SELECT p.product_name,
       p.price
FROM guitar_store.products AS p
WHERE p.price > 20000 AND p.category_id = 3
ORDER BY p.price DESC;

3. Список гитар Fender c ценой от 20000 до 50000 в порядке возрастания цены

SELECT p.product_name,
       p.price
FROM guitar_store.products AS p
WHERE p.product_name ILIKE '%Fender%' AND p.price BETWEEN 20000 AND 50000
ORDER BY p.price;




                                        JOIN запросы

1. Список заказов с именами покупателей

SELECT o.order_id,
       u.user_name
FROM guitar_store.orders AS o
         JOIN guitar_store.users u ON o.user_id = u.user_id;

2. Список заказов с названиями гитар и их количеством с сортировкой
по убыванию количества

SELECT o.order_id,
       product_name,
       oi.quantity
FROM guitar_store.orders AS o
         JOIN guitar_store.order_items oi ON o.order_id = oi.order_id
         JOIN guitar_store.products p ON p.product_id = oi.product_id
ORDER BY oi.quantity DESC;

3. Список имен покупателей с названиями купленных гитар и общей суммой
покупки более 50000

SELECT u.user_name,
       p.product_name,
       SUM (p.price * oi.quantity) AS total_sum
FROM guitar_store.users AS u
         JOIN guitar_store.orders o on u.user_id = o.user_id
         JOIN guitar_store.order_items oi on o.order_id = oi.order_id
         JOIN guitar_store.products p on p.product_id = oi.product_id
GROUP BY u.user_name, p.product_name
HAVING SUM (p.price * oi.quantity) > 50000
ORDER BY total_sum DESC;

4. Список имен покупателей с датой заказа, суммой заказа и названием гитары купленной в
категориях акустика и бас гитара (категории с названием)

SELECT u.user_name,
       o.order_date,
       SUM (oi.quantity * p.price) AS total_sum,
       p.product_name,
       c.category_name
FROM guitar_store.users AS u
         JOIN guitar_store.orders o ON u.user_id = o.user_id
         JOIN guitar_store.order_items oi ON o.order_id = oi.order_id
         JOIN guitar_store.products p ON oi.product_id = p.product_id
         JOIN guitar_store.categories c on p.category_id = c.category_id
WHERE c.category_name IN ('Acoustic guitar', 'Bass guitar')
GROUP BY u.user_name, o.order_date, p.product_name, c.category_name
ORDER BY u.user_name, o.order_date DESC;



                                        UPDATE запросы

    1. Обновить почту Алисе

UPDATE guitar_store.users
SET email = 'alicenewemail@gmai;.com'
WHERE user_name = 'Alice';

2. Поднять цену на Cort Action-PG на 1000

UPDATE guitar_store.products
SET price = 20990
WHERE product_name = 'Cort Action-PG';



                                        DELETE запросы

1. Удалить Fender CD-60

DELETE FROM guitar_store.order_items
WHERE product_id = (SELECT product_id FROM guitar_store.products WHERE product_name = 'Fender CD-60');

DELETE FROM guitar_store.products
WHERE product_name = 'Fender CD-60';


2. Удалить заказы с 1 по 5 марта

DELETE FROM guitar_store.order_items
WHERE order_id IN (
    SELECT order_id
    FROM guitar_store.orders
    WHERE order_date BETWEEN '2026-03-01' AND '2026-03-05');

DELETE FROM guitar_store.orders
WHERE order_date BETWEEN '2026-03-01' AND '2026-03-05';




