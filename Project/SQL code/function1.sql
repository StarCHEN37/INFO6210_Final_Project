CREATE DEFINER=`root`@`localhost` FUNCTION `GetMusic`(N VARCHAR(45)) RETURNS varchar(255) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
DECLARE qqq VARCHAR(255);
 SELECT music_name INTO qqq FROM music WHERE musician = N;
 RETURN qqq;

END