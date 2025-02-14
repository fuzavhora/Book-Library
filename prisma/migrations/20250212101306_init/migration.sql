/*
  Warnings:

  - You are about to drop the `admin` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `author` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `admin` DROP FOREIGN KEY `admin_role_id_fkey`;

-- DropForeignKey
ALTER TABLE `author` DROP FOREIGN KEY `author_role_id_fkey`;

-- DropTable
DROP TABLE `admin`;

-- DropTable
DROP TABLE `author`;

-- AddForeignKey
ALTER TABLE `book` ADD CONSTRAINT `book_author_fkey` FOREIGN KEY (`author`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
