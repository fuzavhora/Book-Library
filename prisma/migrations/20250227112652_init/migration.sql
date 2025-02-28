/*
  Warnings:

  - You are about to drop the column `cart_id` on the `payment` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `payment` DROP FOREIGN KEY `payment_cart_id_fkey`;

-- DropIndex
DROP INDEX `payment_cart_id_fkey` ON `payment`;

-- AlterTable
ALTER TABLE `payment` DROP COLUMN `cart_id`;
