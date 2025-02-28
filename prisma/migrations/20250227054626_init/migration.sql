/*
  Warnings:

  - You are about to drop the `_addtocarttoauthor` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ser` table. If the table is not empty, all the data it contains will be lost.

*/
-- AlterTable
ALTER TABLE `payment_method` MODIFY `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- DropTable
DROP TABLE `_addtocarttoauthor`;

-- DropTable
DROP TABLE `ser`;
