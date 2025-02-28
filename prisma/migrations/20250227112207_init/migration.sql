/*
  Warnings:

  - You are about to drop the column `books` on the `payment` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `payment` DROP FOREIGN KEY `payment_books_fkey`;

-- DropIndex
DROP INDEX `payment_books_fkey` ON `payment`;

-- AlterTable
ALTER TABLE `payment` DROP COLUMN `books`;
