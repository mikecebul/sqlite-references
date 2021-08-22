# Weeks-15-16-Wrap-up-final-project

## 1) Write a SQL query that retrieves all languages that occur in more than 1000 Webpages. A language "occurs" in a Webpage if the Webpage contains a word in that language.

Solution:  
select url, max(num)  
    from (select x.url, y.language, count(*) as num  
    from Occur x, Dictionary y  
    where x.word = y.word  
group by x.url, y.language)  
group by url
