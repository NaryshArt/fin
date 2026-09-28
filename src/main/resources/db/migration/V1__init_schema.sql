CREATE TABLE IF NOT EXISTS `icons`(
     `id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(20) NOT NULL,
    `code` varchar(255) NOT NULL,
);

CREATE TABLE IF NOT EXISTS `types`(
    `id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(10) NOT NULL,
    );

CREATE TABLE IF NOT EXISTS `users` (
    `id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(20) NOT NULL,
    `email` varchar(50) NOT NULL UNIQUE,
    `password` varchar(255) NOT NULL,
);

CREATE TABLE IF NOT EXISTS `categories` (
    `id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT,
    `icon_id` BIGINT NOT NULL,
    `type_id` BIGINT NOT NULL,
    `name` varchar(10),
    CONSTRAINT `fk_categories_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    CONSTRAINT `fk_categories_icon` FOREIGN KEY (`icon_id`) REFERENCES `icons` (`id`),
    CONSTRAINT `fk_categories_type` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`)
);

CREATE TABLE IF NOT EXISTS `payment_methods` (
    `id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT NOT NULL,
    `name` varchar(10) NOT NULL,
    `balance` NUMERIC NOT NULL DEFAULT 0,
    CONSTRAINT `fk_payment_methods_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `transfers` (
    `id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `pay_method_from_id` BIGINT NOT NULL,
    `pay_method_to_id` BIGINT NOT NULL,
    `sum` NUMERIC NOT NULL,
    `transfer_date` timestamp DEFAULT current_timestamp NOT NULL,
    CONSTRAINT `fk_transfers_payment_method` FOREIGN KEY (`pay_method_from_id`) REFERENCES `pay_methods` (`id`),
    CONSTRAINT `fk_transfers_payment_method` FOREIGN KEY (`pay_method_to_id`) REFERENCES `pay_methods` (`id`)
);

CREATE TABLE IF NOT EXISTS `transactions`(
    `id` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `category_id` BIGINT NOT NULL,
    `payment_method_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `name` varchar(50) NOT NULL,
    `sum` NUMERIC NOT NULL,
    `transaction_date` timestamp DEFAULT current_timestamp NOT NULL,
    CONSTRAINT `fk_transactions_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
    CONSTRAINT `fk_transactions_payment` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
    CONSTRAINT `fk_transactions_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
);

