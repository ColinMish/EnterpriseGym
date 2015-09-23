CREATE PROCEDURE `AddIndividualTokens` ()
BEGIN
	IF (SELECT idaccessToken FROM accessToken WHERE idaccessToken = 1) = null THEN 
    INSERT INTO accessToken 
	(idaccessToken, description) value (1, 'Can manage quizes');
    END IF;
    
	IF (SELECT idaccessToken FROM accessToken WHERE idaccessToken = 2) = null THEN 
    INSERT INTO accessToken 
	(idaccessToken, description) value (2, 'Can manage news itemns');
    END IF;
    
	IF (SELECT idaccessToken FROM accessToken WHERE idaccessToken = 3) = null THEN 
    INSERT INTO accessToken 
	(idaccessToken, description) value (3, 'Can manage event items');
    END IF;
    
	IF (SELECT idaccessToken FROM accessToken WHERE idaccessToken = 4) = null THEN 
    INSERT INTO accessToken 
	(idaccessToken, description) value  (4, 'Can ok participan attendance for an event');
    END IF;
    
	IF (SELECT idaccessToken FROM accessToken WHERE idaccessToken = 5) = null THEN 
    INSERT INTO accessToken 
	(idaccessToken, description) value (5, 'Can access charts');
    END IF;
    
	IF (SELECT idaccessToken FROM accessToken WHERE idaccessToken = 6) = null THEN 
    INSERT INTO accessToken 
	(idaccessToken, description) value (6, 'Can give out token');
    END IF;
    
	IF (SELECT idaccessToken FROM accessToken WHERE idaccessToken = 7) = null THEN 
    INSERT INTO accessToken 
	(idaccessToken, description) value (7, 'Can manage theme scores');
    END IF;
        
    
END
