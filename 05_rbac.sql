-- File: 05_rbac.sql
USE EcommerceWarehouse;

CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON EcommerceWarehouse.* TO 'admin_user'@'localhost';

CREATE USER 'sales_user'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE ON EcommerceWarehouse.* TO 'sales_user'@'localhost';

CREATE USER 'support_user'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT ON EcommerceWarehouse.* TO 'support_user'@'localhost';

FLUSH PRIVILEGES;
