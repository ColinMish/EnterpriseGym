CREATE PROCEDURE `AddTokens` ()
BEGIN
	insert into accessToken (idaccessToken, description) value 
    ((1, 'Can manage quizes'), (2, 'Can manage news itemns'), (3, 'Can manage event items'), 
    (4, 'Can ok participan attendance for an event'), (5, 'Can access charts'), (6, 'Can give out token'),
    (7, 'Can manage theme scores'));
END
