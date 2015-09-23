CREATE DEFINER=`davidkenny`@`134.36.154.%` PROCEDURE `AddIndividualTheme`()
BEGIN
IF (SELECT idtheme FROM theme WHERE idtheme = 1) = null THEN INSERT INTO theme 
	(idtheme, name, points) Value (1, 'Action', 10);
    END IF;
    
    IF (SELECT idtheme FROM theme WHERE idtheme = 2) = null THEN INSERT INTO theme 
	(idtheme, name, points) Value (2, 'Practice', 10);
    END IF;
    
    IF (SELECT idtheme FROM theme WHERE idtheme = 3) = null THEN INSERT INTO theme 
	(idtheme, name, points) Value (3, 'Virtual', 10);
    END IF;
    
    IF (SELECT idtheme FROM theme WHERE idtheme = 4) = null THEN INSERT INTO theme 
	(idtheme, name, points) Value (4, 'Project', 10);
    END IF;
    
    IF (SELECT idtheme FROM theme WHERE idtheme = 5) = null THEN INSERT INTO theme 
	(idtheme, name, points) Value (5, 'Theory', 10);
    END IF;
    

END