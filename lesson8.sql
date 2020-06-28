
-- задание 3     
SELECT COUNT(*), gender 
FROM likes
JOIN profiles 
WHERE profiles.user_id = likes.user_id 
GROUP BY profiles.gender;


-- задание 4
SELECT COUNT(*) 
FROM likes 
	JOIN profiles
		ON likes.target_type_id = profiles.user_id 
		AND likes.target_type_id = 2 
		AND likes.target_id IN (SELECT * FROM (
      SELECT user_id FROM profiles ORDER BY birthday DESC LIMIT 10
    ) AS sorted_profiles )  
;


-- задание 5
SELECT 
CONCAT(first_name, ' ', last_name) AS user,
(COUNT(likes.target_id ) + COUNT(media.user_id ) + COUNT(messages.from_user_id )) AS activity,
users.id 
	FROM users
		left JOIN likes 
			ON  users.id = likes.user_id 
		left JOIN messages 
			ON messages.from_user_id = users.id
		left JOIN media 
			ON media.user_id = users.id
	GROUP by users.id 
	order by activity 
	LIMIT 10;
	
	
	
SELECT  
CONCAT(first_name, ' ', last_name) AS user,
users.id,
	(COUNT(likes.target_id ) + COUNT(media.user_id ) + COUNT(messages.from_user_id )) AS activity
		FROM users
			JOIN likes 
				ON  users.id = likes.user_id 
			JOIN messages 
				ON messages.from_user_id = users.id
			JOIN media 
				ON media.user_id = users.id
		GROUP BY likes.target_id
		ORDER BY activity 
		LIMIT 10;	
	
SELECT * 
FROM likes
WHERE user_id = 85;

SELECT * 
FROM  media 
WHERE user_id = 85;

SELECT * 
FROM  messages 
WHERE from_user_id = 85;
	
		

SELECT 
  CONCAT(first_name, ' ', last_name, ' ', id) AS user, 
	(SELECT COUNT(*) FROM likes WHERE likes.user_id = users.id) + 
	(SELECT COUNT(*) FROM media WHERE media.user_id = users.id) + 
	(SELECT COUNT(*) FROM messages WHERE messages.from_user_id = users.id) AS overall_activity 
	  FROM users
	  ORDER BY overall_activity
	  ;
     
