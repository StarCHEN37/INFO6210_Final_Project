CREATE DEFINER=`root`@`localhost` FUNCTION `get_music_num`(N VARCHAR(45)) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
DECLARE num VARCHAR(255);
 SELECT COUNT(music_name) INTO num FROM music WHERE musician = N;
 RETURN num;
 
END