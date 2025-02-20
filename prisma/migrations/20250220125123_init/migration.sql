/*
  Warnings:

  - You are about to drop the column `author` on the `book` table. All the data in the column will be lost.
  - The primary key for the `role` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `role_id` on the `role` table. All the data in the column will be lost.
  - Added the required column `quantity` to the `addtocart` table without a default value. This is not possible if the table is not empty.
  - Added the required column `author_id` to the `book` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `role` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `book` DROP FOREIGN KEY `book_author_fkey`;

-- DropForeignKey
ALTER TABLE `user` DROP FOREIGN KEY `user_role_id_fkey`;

-- DropIndex
DROP INDEX `book_author_fkey` ON `book`;

-- DropIndex
DROP INDEX `user_role_id_fkey` ON `user`;

-- AlterTable
ALTER TABLE `addtocart` ADD COLUMN `quantity` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `book` DROP COLUMN `author`,
    ADD COLUMN `author_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `role` DROP PRIMARY KEY,
    DROP COLUMN `role_id`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- CreateTable
CREATE TABLE `author` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `img` VARCHAR(191) NULL,
    `role_id` INTEGER NOT NULL,
    `Income` INTEGER NULL,

    UNIQUE INDEX `author_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `payment_method` (
    `id` INTEGER NOT NULL,
    `name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `payment_method_id_key`(`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `payment` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `upi_id` VARCHAR(191) NULL,
    `credit_card_num` INTEGER NULL,
    `Expriry` INTEGER NULL,
    `Cvv` INTEGER NULL,
    `books` INTEGER NOT NULL,
    `payment_type` INTEGER NOT NULL,
    `cart_id` INTEGER NOT NULL,
    `total_price` INTEGER NOT NULL,
    `author_profit` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_addtocartToauthor` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_addtocartToauthor_AB_unique`(`A`, `B`),
    INDEX `_addtocartToauthor_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `user_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `role`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `author` ADD CONSTRAINT `author_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `role`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `book` ADD CONSTRAINT `book_author_id_fkey` FOREIGN KEY (`author_id`) REFERENCES `author`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `payment` ADD CONSTRAINT `payment_books_fkey` FOREIGN KEY (`books`) REFERENCES `book`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `payment` ADD CONSTRAINT `payment_cart_id_fkey` FOREIGN KEY (`cart_id`) REFERENCES `addtocart`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `payment` ADD CONSTRAINT `payment_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `payment` ADD CONSTRAINT `payment_payment_type_fkey` FOREIGN KEY (`payment_type`) REFERENCES `payment_method`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_addtocartToauthor` ADD CONSTRAINT `_addtocartToauthor_A_fkey` FOREIGN KEY (`A`) REFERENCES `addtocart`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_addtocartToauthor` ADD CONSTRAINT `_addtocartToauthor_B_fkey` FOREIGN KEY (`B`) REFERENCES `author`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
