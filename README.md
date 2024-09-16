# Домашнее задание к занятию «SQL. Часть 2»

### Инструкция по выполнению домашнего задания

1. Сделайте fork [репозитория c шаблоном решения](https://github.com/netology-code/sys-pattern-homework) к себе в Github и переименуйте его по названию или номеру занятия, например, https://github.com/имя-вашего-репозитория/gitlab-hw или https://github.com/имя-вашего-репозитория/8-03-hw).
2. Выполните клонирование этого репозитория к себе на ПК с помощью команды `git clone`.
3. Выполните домашнее задание и заполните у себя локально этот файл README.md:
   - впишите вверху название занятия и ваши фамилию и имя;
   - в каждом задании добавьте решение в требуемом виде: текст/код/скриншоты/ссылка;
   - для корректного добавления скриншотов воспользуйтесь инструкцией [«Как вставить скриншот в шаблон с решением»](https://github.com/netology-code/sys-pattern-homework/blob/main/screen-instruction.md);
   - при оформлении используйте возможности языка разметки md. Коротко об этом можно посмотреть в [инструкции по MarkDown](https://github.com/netology-code/sys-pattern-homework/blob/main/md-instruction.md).
4. После завершения работы над домашним заданием сделайте коммит (`git commit -m "comment"`) и отправьте его на Github (`git push origin`).
5. Для проверки домашнего задания преподавателем в личном кабинете прикрепите и отправьте ссылку на решение в виде md-файла в вашем Github.
6. Любые вопросы задавайте в чате учебной группы и/или в разделе «Вопросы по заданию» в личном кабинете.

Желаем успехов в выполнении домашнего задания.

---

Задание можно выполнить как в любом IDE, так и в командной строке.

### Задание 1

Одним запросом получите информацию о магазине, в котором обслуживается более 300 покупателей, и выведите в результат следующую информацию: 
- фамилия и имя сотрудника из этого магазина;
- город нахождения магазина;
- количество пользователей, закреплённых в этом магазине.
#### Решение 1  
```sql
SELECT CONCAT(staff.first_name, ' ', staff.last_name) AS employee_name, city.city AS store_city,
COUNT(customer.customer_id) AS customer_count FROM store JOIN staff ON store.manager_staff_id = staff.staff_id JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id JOIN customer ON store.store_id = customer.store_id GROUP BY store.store_id HAVING customer_count > 300;
```  
![Скриншот 1(DBEaver)](https://github.com/GubinaAV/12-04/blob/main/img/screen1(DBr).png)  
![Скриншот 1(MYSQL_cmd)](https://github.com/GubinaAV/12-04/blob/main/img/screen1(MSQLc).png)

### Задание 2

Получите количество фильмов, продолжительность которых больше средней продолжительности всех фильмов.
#### Решение 2
```sql
SELECT (SELECT  AVG(`length`) from film) AS Average, COUNT(1) AS 'Long Films' FROM film  WHERE `length` > (SELECT AVG(`length`) from film);
```
![Скриншот 2(DBEaver)](https://github.com/GubinaAV/12-04/blob/main/img/screen2(DBr).png)  
![Скриншот 2(MYSQL_cmd)](https://github.com/GubinaAV/12-04/blob/main/img/screen2(MSQLc).png)

### Задание 3

Получите информацию, за какой месяц была получена наибольшая сумма платежей, и добавьте информацию по количеству аренд за этот месяц.
#### Решение 3  
```sql
SELECT DATE_FORMAT(payment_date, '%m-%Y') AS payment_month, COUNT(rental_id) AS rent_quanity, SUM(amount) AS total_amount FROM payment GROUP BY payment_month ORDER BY total_amount DESC LIMIT 1;
```  
![Скриншот 3(DBEaver)](https://github.com/GubinaAV/12-04/blob/main/img/screen3(DBr).png)  
![Скриншот 3(MYSQL_cmd)](https://github.com/GubinaAV/12-04/blob/main/img/screen3(MSQLc).png)
## Дополнительные задания (со звёздочкой*)
Эти задания дополнительные, то есть не обязательные к выполнению, и никак не повлияют на получение вами зачёта по этому домашнему заданию. Вы можете их выполнить, если хотите глубже шире разобраться в материале.

### Задание 4*

Посчитайте количество продаж, выполненных каждым продавцом. Добавьте вычисляемую колонку «Премия». Если количество продаж превышает 8000, то значение в колонке будет «Да», иначе должно быть значение «Нет».

### Задание 5*

Найдите фильмы, которые ни разу не брали в аренду.