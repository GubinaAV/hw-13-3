# Домашнее задание к занятию «SQL. Часть 1»

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

Получите уникальные названия районов из таблицы с адресами, которые начинаются на “K” и заканчиваются на “a” и не содержат пробелов.
#### Решение 1  
```  
mysql> 
SELECT DISTINCT district FROM address WHERE district LIKE "K%a" AND district NOT LIKE "% %";
```  
![Скриншот-1](https://github.com/GubinaAV/12-03/blob/main/img/SQL1.png)  

### Задание 2

Получите из таблицы платежей за прокат фильмов информацию по платежам, которые выполнялись в промежуток с 15 июня 2005 года по 18 июня 2005 года **включительно** и стоимость которых превышает 10.00.

#### Решение 2  
```  
~~mysql> SELECT payment_id, payment_date, amount FROM payment WHERE payment_date BETWEEN '2005-06-15' AND '2005-06-19' AND amount > 10.00 ORDER BY payment_date ASC;~~

вариант исправления 1:
mysql> SELECT payment_id, payment_date, amount FROM payment WHERE payment_date > '2005-06-15' AND payment_date < '2005-06-19' AND amount > 10.00 ORDER BY payment_date ASC;

вариант исправления 2 (в лоб, не очень "красиво", но всё же):
mysql> SELECT payment_id, payment_date, amount FROM payment WHERE payment_date > '2005-06-15' AND payment_date <= '2005-06-18 23:59:59' AND amount > 10.00 ORDER BY payment_date ASC;
```  
![Скриншот-2](https://github.com/GubinaAV/12-03/blob/main/img/SQL2.png)  
### Задание 3

Получите последние пять аренд фильмов.  

#### Решение 3
```  
mysql> SELECT rental_id, payment_id, payment_date FROM payment ORDER BY payment_date DESC LIMIT 5;
```  
![Скриншот-3](https://github.com/GubinaAV/12-03/blob/main/img/SQL3.png)  

### Задание 4

Одним запросом получите активных покупателей, имена которых Kelly или Willie. 

Сформируйте вывод в результат таким образом:
- все буквы в фамилии и имени из верхнего регистра переведите в нижний регистр,
- замените буквы 'll' в именах на 'pp'.  
#### Решение 4  
```  
mysql> SELECT LOWER (last_name) AS last_name, LOWER (first_name) AS first_name, REPLACE (LOWER (first_name), 'll', 'pp') AS new_first_name FROM customer WHERE first_name = 'Kelly' OR first_name = 'Willie' AND active = 1;

```  
![Скриншот-4](https://github.com/GubinaAV/12-03/blob/main/img/SQL4.png)  

## Дополнительные задания (со звёздочкой*)
Эти задания дополнительные, то есть не обязательные к выполнению, и никак не повлияют на получение вами зачёта по этому домашнему заданию. Вы можете их выполнить, если хотите глубже шире разобраться в материале.

### Задание 5*

Выведите Email каждого покупателя, разделив значение Email на две отдельных колонки: в первой колонке должно быть значение, указанное до @, во второй — значение, указанное после @.
#### Решение 5*  
```  
mysql> SELECT email,  SUBSTRING_INDEX(email, '@', 1) AS left_part, SUBSTRING_INDEX(email, '@', -1) AS right_part FROM customer;
```  
![Скриншот-5](https://github.com/GubinaAV/12-03/blob/main/img/SQL5.png)  

### Задание 6*

Доработайте запрос из предыдущего задания, скорректируйте значения в новых колонках: первая буква должна быть заглавной, остальные — строчными.
