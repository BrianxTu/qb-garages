ALTER TABLE `player_vehicles`
ADD COLUMN `parkingspot` VARCHAR(50) NULL DEFAULT NULL AFTER `garage`,
ADD COLUMN `damage` VARCHAR(1500) NULL DEFAULT NULL AFTER `parkingspot`;
