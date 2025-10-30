/*
tempdev
tempdev_new_02
tempdev_new_03
tempdev_new_04
tempdev2
tempdev3
tempdev4
tempdev5
*/


SELECT name AS logical_name, physical_name, size * 8 / 1024 AS size_mb, growth * 8 / 1024 AS growth_mb
FROM master.sys.master_files
WHERE database_id = DB_ID('tempdb');


ALTER DATABASE tempdb MODIFY FILE (NAME = tempdev, SIZE = 19456MB, FILEGROWTH = 2048MB);
ALTER DATABASE tempdb MODIFY FILE (NAME = tempdev_new_02, SIZE = 19456MB, FILEGROWTH = 2048MB);
ALTER DATABASE tempdb MODIFY FILE (NAME = tempdev_new_03, SIZE = 19456MB, FILEGROWTH = 2048MB);
ALTER DATABASE tempdb MODIFY FILE (NAME = tempdev_new_04, SIZE = 19456MB, FILEGROWTH = 2048MB);
ALTER DATABASE tempdb MODIFY FILE (NAME = tempdev2, SIZE = 19456MB, FILEGROWTH = 2048MB);
ALTER DATABASE tempdb MODIFY FILE (NAME = tempdev3, SIZE = 19456MB, FILEGROWTH = 2048MB);
ALTER DATABASE tempdb MODIFY FILE (NAME = tempdev4, SIZE = 19456MB, FILEGROWTH = 2048MB);
ALTER DATABASE tempdb MODIFY FILE (NAME = tempdev5, SIZE = 19456MB, FILEGROWTH = 2048MB);