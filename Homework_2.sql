# 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными.
CREATE DATABASE sales;
USE sales;
CREATE TABLE sales
(id INT PRIMARY KEY AUTO_INCREMENT,
 order_date DATE NOT NULL,
 count_product INT NOT NULL
);
INSERT INTO sales (order_date, count_product)
VALUES
  ('2022-01-01', 156),
  ('2022-01-02', 180),
  ('2022-01-03', 21),
  ('2022-01-04', 124),
  ('2022-01-05', 341);
SELECT * FROM sales;
  
# 2. Сгруппируйте значения количества в 3 сегмента — меньше 100, 100-300 и больше 300 (функция IF).
SELECT id, order_date, count_product,
CASE TRUE
    WHEN count_product < 100 THEN 'Меньше 100'
    WHEN count_product >= 100 AND count_product <= 300 THEN 'От 100 до 300'
    ELSE 'Больше 300'
END AS order_size
FROM sales;

# 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE.ALTER.
CREATE TABLE orders (
    orderid INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(5) NOT NULL,
    amount DECIMAL(20, 2) NOT NULL,
    order_status VARCHAR(45) NOT NULL
);

INSERT INTO orders (employee_id, amount, order_status)
VALUES
  ('e03', 15.00, 'OPEN'),
  ('e01', 25.50, 'OPEN'),
  ('e05', 100.70, 'CLOSED'),
  ('e02', 22.18, 'OPEN'),
  ('e04', 9.50, 'CANCELLED');

SELECT orderid, order_status,
CASE order_status
    WHEN 'OPEN' THEN 'Order is in open state.'
    WHEN 'CLOSED' THEN 'Order is closed.'
    ELSE 'Order is cancelled.'
END AS order_summary
FROM orders;

# 4. Чем NULL отличается от 0?
-- 0 это числовое значение, а NULL означает отсутствие какого-либо значения в ячейке таблицы.
