CREATE TABLE tasklist.tasks (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    content VARCHAR(100),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);