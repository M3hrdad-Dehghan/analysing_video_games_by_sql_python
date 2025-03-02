USE [Games]

--Q1:  Find the Most Expensive Games by Genre and Player
SELECT TOP 10
    VG.Genre, PL.NickName, SUM(PR.Price) AS "Total Price"
FROM [dbo].[VideoGames] VG
    JOIN [dbo].[Price] PR ON VG.GameID = PR.GameID
    JOIN [dbo].[Purchase_Games] PG ON PG.GameID = VG.GameID
    JOIN [dbo].[Players] PL ON PL.PlayerID = PG.PlayerID
GROUP BY VG.Genre, PL.NickName
ORDER BY SUM(PR.Price) DESC


--Q2:  Find Games Purchased and average price between 2020 and 2024

SELECT VG.Title, AVG(PR.Price) AS 'Average Sale'
FROM [dbo].[VideoGames] VG
    JOIN [dbo].[Price] PR ON PR.GameID = VG.GameID
WHERE VG.Release_Date BETWEEN 2020 AND 2024
GROUP BY VG.Title
ORDER BY AVG(PR.Price) DESC


--Q3.  Find a List of all Players who have never purchased any games and are living in Canada or the US

SELECT pl.NickName, c.Country, pl.PlayerID
FROM [dbo].[Players] pl
    JOIN [dbo].[Country] c ON c.CountryID = pl.CountryID
    LEFT JOIN [dbo].[Purchase_Games] pg ON pg.PlayerID = pl.PlayerID
WHERE 
	c.Country IN ('Canada' , 'United States') AND
    pg.PlayerID IS NULL
