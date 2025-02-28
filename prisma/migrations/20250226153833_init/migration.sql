-- DropForeignKey
ALTER TABLE `_addtocarttoauthor` DROP FOREIGN KEY `_addtocartToauthor_A_fkey`;

-- DropForeignKey
ALTER TABLE `_addtocarttoauthor` DROP FOREIGN KEY `_addtocartToauthor_B_fkey`;

-- DropForeignKey
ALTER TABLE `addtocart` DROP FOREIGN KEY `addtocart_book_id_fkey`;

-- DropForeignKey
ALTER TABLE `addtocart` DROP FOREIGN KEY `addtocart_user_id_fkey`;

-- DropForeignKey
ALTER TABLE `author` DROP FOREIGN KEY `author_role_id_fkey`;

-- DropForeignKey
ALTER TABLE `book` DROP FOREIGN KEY `book_author_id_fkey`;

-- DropForeignKey
ALTER TABLE `payment` DROP FOREIGN KEY `payment_books_fkey`;

-- DropForeignKey
ALTER TABLE `payment` DROP FOREIGN KEY `payment_cart_id_fkey`;

-- DropForeignKey
ALTER TABLE `payment` DROP FOREIGN KEY `payment_payment_type_fkey`;

-- DropForeignKey
ALTER TABLE `payment` DROP FOREIGN KEY `payment_user_id_fkey`;

-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `user_role_id_fkey`;

-- DropIndex
DROP INDEX `_addtocartToauthor_AB_unique` ON `_addtocarttoauthor`;

-- DropIndex
DROP INDEX `_addtocartToauthor_B_index` ON `_addtocarttoauthor`;

-- DropIndex
DROP INDEX `addtocart_book_id_fkey` ON `addtocart`;

-- DropIndex
DROP INDEX `addtocart_user_id_fkey` ON `addtocart`;

-- DropIndex
DROP INDEX `author_email_key` ON `author`;

-- DropIndex
DROP INDEX `author_role_id_fkey` ON `author`;

-- DropIndex
DROP INDEX `book_author_id_fkey` ON `book`;

-- DropIndex
DROP INDEX `payment_books_fkey` ON `payment`;

-- DropIndex
DROP INDEX `payment_cart_id_fkey` ON `payment`;

-- DropIndex
DROP INDEX `payment_payment_type_fkey` ON `payment`;

-- DropIndex
DROP INDEX `payment_user_id_fkey` ON `payment`;

-- DropIndex
DROP INDEX `payment_method_id_key` ON `payment_method`;

-- DropIndex
DROP INDEX `user_email_key` ON `user`;

-- DropIndex
DROP INDEX `user_role_id_fkey` ON `user`;
