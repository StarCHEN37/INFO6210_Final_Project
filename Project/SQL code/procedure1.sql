CREATE DEFINER=`root`@`localhost` PROCEDURE `get_musician_company`(IN FIRST INT)
BEGIN
 DECLARE musicianId INT;
    
    SET musicianId = FIRST;
    
 select c.name,m.musicianId, m.musician_name
    from `musician` as m
    join `music` as c on c.musician = m.musician_name
    where m.musician_id = musicianId;
    
END