/*
  Warnings:

  - You are about to drop the column `role_name` on the `role` table. All the data in the column will be lost.
  - Added the required column `name` to the `role` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `role` DROP COLUMN `role_name`,
    ADD COLUMN `name` VARCHAR(191) NOT NULL,
    MODIFY `role_id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`role_id`);

-- DropIndex
DROP INDEX `role_role_id_key` ON `role`;

-- CreateTable
CREATE TABLE `author` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `img` VARCHAR(191) NULL,
    `role_id` INTEGER NOT NULL,

    UNIQUE INDEX `author_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `admin` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `img` VARCHAR(191) NULL,
    `role_id` INTEGER NOT NULL,

    UNIQUE INDEX `admin_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `author` ADD CONSTRAINT `author_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `role`(`role_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `admin` ADD CONSTRAINT `admin_role_id_fkey` FOREIGN KEY (`role_id`) REFERENCES `role`(`role_id`) ON DELETE RESTRICT ON UPDATE CASCADE;
