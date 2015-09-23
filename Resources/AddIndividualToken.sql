CREATE DEFINER=`davidkenny`@`134.36.154.%` PROCEDURE `AddIndividualTokens`()
BEGIN
	IF NOT EXISTS (SELECT idaccessToken FROM accessToken WHERE idaccessToken = 1) THEN 
    INSERT INTO accessToken 
	(idaccessToken, description) value (1, 'Can manage quizes');
    END IF;
    
	IF NOT EXISTS (SELECT idaccessToken FROM accessToken WHERE idaccessToken = 2) THEN 
    INSERT INTO accessToken 
	(idaccessToken, description) value (2, 'Can manage news itemns');
    END IF;
    
	IF NOT EXISTS (SELECT idaccessToken FROM accessToken WHERE idaccessToken = 3) THEN 
    INSERT INTO accessToken 
	(idaccessToken, description) value (3, 'Can manage event items');
    END IF;
    
	IF NOT EXISTS (SELECT idaccessToken FROM accessToken WHERE idaccessToken = 4) THEN 
    INSERT INTO accessToken 
	(idaccessToken, description) value  (4, 'Can ok participan attendance for an event');
    END IF;
    
	IF NOT EXISTS (SELECT idaccessToken FROM accessToken WHERE idaccessToken = 5) THEN 
    INSERT INTO accessToken 
	(idaccessToken, description) value (5, 'Can access charts');
    END IF;
    
	IF NOT EXISTS (SELECT idaccessToken FROM accessToken WHERE idaccessToken = 6) THEN 
    INSERT INTO accessToken 
	(idaccessToken, description) value (6, 'Can give out token');
    END IF;
    
	IF NOT EXISTS (SELECT idaccessToken FROM accessToken WHERE idaccessToken = 7) THEN 
    INSERT INTO accessToken 
	(idaccessToken, description) value (7, 'Can manage theme scores');
    END IF;
        
    
END