-- Crear la base de datos si no existe y usarla
CREATE DATABASE IF NOT EXISTS decor_house_prod;
USE decor_house_prod;

-- Limpieza de tablas si existen (orden correcto por claves foráneas)
DROP TABLE IF EXISTS stock;
DROP TABLE IF EXISTS users_roles;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS products;

-- Tabla de productos
CREATE TABLE IF NOT EXISTS products (
                                        id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                        name VARCHAR(255),
    price DOUBLE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla de roles
CREATE TABLE IF NOT EXISTS roles (
                                     id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                     name VARCHAR(50)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla de usuarios
CREATE TABLE IF NOT EXISTS users (
                                     id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                     username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Relación muchos a muchos: users_roles
CREATE TABLE IF NOT EXISTS users_roles (
                                           user_id BIGINT,
                                           role_id BIGINT,
                                           PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla de stock
CREATE TABLE IF NOT EXISTS stock (
                                     id BIGINT AUTO_INCREMENT PRIMARY KEY,
                                     product_id BIGINT UNIQUE,
                                     quantity INT,
                                     FOREIGN KEY (product_id) REFERENCES products(id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Inserciones iniciales
INSERT INTO roles (name) VALUES ('ROLE_USER'), ('ROLE_ADMIN');

INSERT INTO users (username, password) VALUES (
                                                  'admin',
                                                  '$2a$10$xLFtBIXGtYvAbRqM95JhYeuNd/h6q5r6mhknU9t.ChkmY8b0F.Q0K' -- Admin123 (BCrypt)
                                              );

-- Asignar rol ADMIN al usuario admin (usuario id = 1, rol id = 2)
INSERT INTO users_roles (user_id, role_id) VALUES (1, 2);

-- Productos de prueba
INSERT INTO products (name, price) VALUES
                                       ('Agua Cielo 1L', 4.50),
                                       ('Cheetos', 1.50);
