CREATE DEFINER=`davidkenny`@`134.36.154.%` PROCEDURE `AddTokens`()
BEGIN

IF (SELECT count(*) FROM accessToken) < 7 THEN CALL AddIndividualTokens;
	END IF;

IF (SELECT count(*) FROM accessToken) = 0 THEN INSERT INTO accessToken (idaccessToken, description) value 
    ((1, 'Can manage quizes'), (2, 'Can manage news itemns'), (3, 'Can manage event items'), 
    (4, 'Can ok participan attendance for an event'), (5, 'Can access charts'), (6, 'Can give out token'),
    (7, 'Can manage theme scores'));
    END IF;
END