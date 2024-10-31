CREATE TABLE consumer (
    consumer_id SERIAL PRIMARY KEY, -- Первинний ключ з автоінкрементом
    username VARCHAR(50) NOT NULL, -- Ім'я споживача, не порожнє
    email VARCHAR(100) NOT NULL,
    CHECK (email ~ '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
);

/* Створення таблиці Zone */
CREATE TABLE zone (
    zone_id SERIAL PRIMARY KEY, -- Первинний ключ з автоінкрементом
    consumer_id INTEGER REFERENCES
    consumer (consumer_id), -- Зовнішній ключ до Consumer
    title VARCHAR(100) NOT NULL, -- Назва зони, не порожнє
    username VARCHAR(50) NOT NULL,
    CHECK (username ~ '^[a-zA-Z0-9_]{3,50}$'),
    safety_level VARCHAR(50) NOT NULL, -- Рівень безпеки зони, не порожнє
    CONSTRAINT unique_zone_title
    UNIQUE (title) -- Унікальне обмеження на назву зони
);

/* Створення таблиці Notification */
CREATE TABLE notification (
    notification_id SERIAL PRIMARY KEY, -- Первинний ключ з автоінкрементом
    consumer_id INTEGER
    REFERENCES consumer (consumer_id), -- Зовнішній ключ до Consumer
    message VARCHAR(255) NOT NULL, -- Текст повідомлення, не порожнє
    date_sent DATE NOT NULL -- Дата відправки повідомлення, не порожнє
);

/* Створення таблиці Potential Danger */
CREATE TABLE potential_danger (
    potential_danger_id SERIAL PRIMARY KEY, -- Первинний ключ з автоінкрементом
    zone_id INTEGER REFERENCES zone (zone_id), -- Зовнішній ключ до Zone
    description VARCHAR(255) NOT NULL -- Опис потенційної небезпеки, не порожнє
);
