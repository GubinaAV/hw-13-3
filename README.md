# Домашнее задание к занятию «Работа с данными (DDL/DML)»

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
1.1. Поднимите чистый инстанс MySQL версии 8.0+. Можно использовать локальный сервер или контейнер Docker.
```  
sudo apt update
sudo apt-get install mysql-server
```  

1.2. Создайте учётную запись sys_temp.
```  
CREATE USER 'sys_temp'@'localhost' IDENTIFIED BY 'secret';
FLUSH PRIVILEGES;
```   

1.3. Выполните запрос на получение списка пользователей в базе данных. (скриншот)  
```  
SELECT user,host FROM mysql.user;
```  

![Скриншот-1.3](https://github.com/GubinaAV/12-02/blob/main/img/1.3.png)  

1.4. Дайте все права для пользователя sys_temp. 
```
GRANT ALL PRIVILEGES ON *.* TO sys_temp'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```  

1.5. Выполните запрос на получение списка прав для пользователя sys_temp. (скриншот)
```
GRANT ALL PRIVILEGES ON *.* TO sys_temp'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```  

![Скриншот-1.5](https://github.com/GubinaAV/12-02/blob/main/img/1.5.png)  

1.6. Переподключитесь к базе данных от имени sys_temp.
```  
mysql -u sys_temp -p
```  
Для смены типа аутентификации с sha2 используйте запрос: 
```sql
ALTER USER 'sys_test'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```
1.6. По ссылке https://downloads.mysql.com/docs/sakila-db.zip скачайте дамп базы данных.  
```wget -c https://downloads.mysql.com/docs/sakila-db.zip```  

1.7. Восстановите дамп в базу данных.  
```unzip sakila-db.zip```

1.8. При работе в IDE сформируйте ER-диаграмму получившейся базы данных. При работе в командной строке используйте команду для получения всех таблиц базы данных. (скриншот)  
```show tables;```  
Скриншот из командной строки:  
![Скриншот-1.8(cmd)](https://github.com/GubinaAV/12-02/blob/main/img/1.8(cmd).png)  

Скриншот ER из Beaver:  
![Скриншот-1.8(cmd)](https://github.com/GubinaAV/12-02/blob/main/img/1.8(ER@Beaver).png)

*Результатом работы должны быть скриншоты обозначенных заданий, а также простыня со всеми запросами.*  

bash:
```
sudo apt update
sudo apt-get install mysql-server
```  

mysql -u root -p
```
CREATE USER 'sys_temp'@'localhost' IDENTIFIED BY 'secret';
FLUSH PRIVILEGES;
SELECT user,host FROM mysql.user;
GRANT ALL PRIVILEGES ON *.* TO sys_temp'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO sys_temp'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```  
mysql -u sys_temp -p  
```
ALTER USER 'sys_temp'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
```

bash  
```  
wget -c https://downloads.mysql.com/docs/sakila-db.zip
unzip sakila-db.zip
```  

mysql -u sys_temp -p>
```  
create database sakila;
source /root/sakila-db/sakila-schema.sql;
source /root/sakila-db/sakila-data.sql;
show tables;
```  

### Задание 2
Составьте таблицу, используя любой текстовый редактор или Excel, в которой должно быть два столбца: в первом должны быть названия таблиц восстановленной базы, во втором названия первичных ключей этих таблиц. Пример: (скриншот/текст)
```
Название таблицы | Название первичного ключа
customer         | customer_id
```
#### Решение 2
![Файл первичных ключей таблиц](https://github.com/GubinaAV/12-02/blob/main/files/sakila_pri_id.txt)  


## Дополнительные задания (со звёздочкой*)
Эти задания дополнительные, то есть не обязательные к выполнению, и никак не повлияют на получение вами зачёта по этому домашнему заданию. Вы можете их выполнить, если хотите глубже шире разобраться в материале.

### Задание 3*
3.1. Уберите у пользователя sys_temp права на внесение, изменение и удаление данных из базы sakila.

3.2. Выполните запрос на получение списка прав для пользователя sys_temp. (скриншот)

*Результатом работы должны быть скриншоты обозначенных заданий, а также простыня со всеми запросами.*