-- AlterTable
ALTER TABLE `addtocart` MODIFY `quantity` INTEGER NULL DEFAULT 1;

-- AlterTable
ALTER TABLE `user` MODIFY `role_id` INTEGER NOT NULL DEFAULT 3;
