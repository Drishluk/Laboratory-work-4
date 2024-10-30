/* Створення таблиці Consumer */
CREATE TABLE consumer (
    consumer_id NUMBER PRIMARY KEY, -- Первинний ключ
    name VARCHAR2(50) NOT NULL, -- Ім'я споживача, не порожнє
    email VARCHAR2(100) NOT NULL, -- Електронна пошта споживача, валідний email
    CONSTRAINT email_format CHECK
    (regexp_like(email, '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'))
);

/* Створення таблиці Zone */
CREATE TABLE zone (
    zone_id NUMBER PRIMARY KEY, -- Первинний ключ
    consumer_id NUMBER, -- Зовнішній ключ до Consumer
    name VARCHAR2(100) NOT NULL, -- Назва зони, унікальне значення
    safety_level VARCHAR2(50) NOT NULL, -- Рівень безпеки зони, не порожнє
    CONSTRAINT unique_zone_name UNIQUE (name),
    CONSTRAINT fk_consumer_id FOREIGN KEY (consumer_id)
    REFERENCES consumer (consumer_id)
);

/* Створення таблиці Notification */
CREATE TABLE notification (
    notification_id NUMBER PRIMARY KEY, -- Первинний ключ
    consumer_id NUMBER, -- Зовнішній ключ до Consumer
    message VARCHAR2(255) NOT NULL, -- Текст повідомлення, не порожнє
    date_sent DATE NOT NULL, -- Дата відправки повідомлення, не порожнє
    CONSTRAINT fk_notification_consumer FOREIGN KEY (consumer_id)
    REFERENCES consumer (consumer_id)
);

/* Створення таблиці Potential Danger */
CREATE TABLE potential_danger (
    potential_danger_id NUMBER PRIMARY KEY, -- Первинний ключ
    zone_id NUMBER, -- Зовнішній ключ до Zone
    description VARCHAR2(255) NOT
    NULL, -- Опис потенційної небезпеки, не порожнє
    CONSTRAINT fk_zone_id FOREIGN KEY (zone_id) REFERENCES zone (zone_id)
);
