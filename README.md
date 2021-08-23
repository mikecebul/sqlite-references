# Weeks-15-16-Wrap-up-final-project

## 1) Write a SQL query that retrieves all languages that occur in more than 1000 Webpages. A language "occurs" in a Webpage if the Webpage contains a word in that language.

### Answer  
SELECT y.language  
FROM Occurs x, Dictionary y  
WHERE x.word = y.word  
GROUP BY y.language  
HAVING COUNT(*) > 1000
  
  
## 2) Write a SQL query that computes, for each Webpage, the largest number of words on that page in any language. For example, if a page has 100 words in French and 50 words in English (these two sets of words may be overlapping), then your query will return 100 for that page. If a Webpage has only words that do not occur in any language at all, then you do not need to return that Webpage.
  
### Answer  
SELECT url, max(c)  
FOMR (SELECT x.url, y.language, COUNT(*) AS c  
FROM Occur x, Dictionary y  
WHERE x.word = y.word  
GROUP BY x.url, y.language)  
GROUP BY url  
  
  
## 3) We say that a Webpage is "monolingual in X" if all words occurring on that Webpage are in the language X (and may be in other languages too). Write a query in the Relational Calculus that returns all monolingual Webpages together with the language(s) in which they are monolingual. For example, if the Webpage is: Introduction to Data Management then your query should return English for that Webpage, because all four words are in English, hence the Webpage is monolingual in English. (The word Data occurs in other languages as well, but not he other three words.) On the other hand, if the Webpage is: NO SQL ! then it is monolingual in English, in French, in Italian, etc, because both NO and SQL are words in English, in French, in Italian. (But the Webpage is not monlingual in Dutch because NO is not a Dutch word; Dutch people say 'NEE').
  
### Answer  
SELECT o1.url, d1.language  
FROM Occurs o1, Dictionary d1  
WHERE NOT EXISTS  
(SELECT *  
FROM Occurs o2  
WHERE o1.url = o2.url  
AND NOT EXISTS  
(SELECT *  
FROM Dictionary d2  
WHERE o2.word = d2.word  
AND d2.language = d1.language))  
  
  
## 4) Design an ERM Diagram for an online video rental company: 
  
### Answer  
Movies as m  
------------  
Title PK int  
Year int  
Duration int  
  
Customer as c  
------------  
Email PK text  
Name text  
Cedit int  
  
Reviewer as rr  
------------  
Name PK text FK - c.Name  
Reputation int  
  
Reviews as r  
------------  
ReviewerName PK text FK >0- rr.Name  
MovieTitle PK text FK >0- m.Title  
Rating int  
Date text  
Text text  

<img src="VideoRental_ERD.png">
