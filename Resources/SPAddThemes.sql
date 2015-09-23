CREATE DEFINER=`davidkenny`@`134.36.154.%` PROCEDURE `AddThemes`()
BEGIN
	IF (SELECT count(*) FROM theme)< 5 THEN DELETE FROM theme;
    END IF;
    
	IF (SELECT count(*) FROM theme)= 0 THEN INSERT INTO theme (idtheme, name, points) Value
		((1, 'Action', 10),(2, 'Practice', 10), (3, 'Virtual', 10), 
		(4, 'Project', 10), (5, 'Theory', 10));
        END IF;
END