-- AlterTable
ALTER TABLE `addtocart` ADD COLUMN `isActive` BOOLEAN NULL DEFAULT true;

-- AlterTable
ALTER TABLE `author` ADD COLUMN `isActive` BOOLEAN NULL DEFAULT true;

-- AlterTable
ALTER TABLE `book` ADD COLUMN `isActive` BOOLEAN NULL DEFAULT true;

-- AlterTable
ALTER TABLE `user` ADD COLUMN `isActive` BOOLEAN NULL DEFAULT true;
