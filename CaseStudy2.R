## Load the packages for running the code

install.packages("XML")
library(XML)
install.packages("RCurl")
library(RCurl)
install.packages("dplyr")
library(dplyr)

## Code to remove common words, "stop words", from the text from job postings on CyberCoders.com

StopWords = readLines("http://jmlr.csail.mit.edu/papers/volume5/lewis04a/a11-smart-stop-list/english.stop")

asWords = function(txt, stopWords = StopWords, stem = FALSE)
{
  words = unlist(strsplit(txt, '[[:space:]!.,;#:()/"]+'))
  words = words[words != ""]
  if(stem && require(Rlibstemmer))
     words = wordStem(words)
  i = tolower(words) %in% tolower(stopWords)
  words[!i]
}

removeStopWords = function(x, stopWords = StopWords) 
     {
         if(is.character(x))
             setdiff(x, stopWords)
         else if(is.list(x))
             lapply(x, removeStopWords, stopWords)
         else
             x
     }

cy.getFreeFormWords = function(doc, stopWords = StopWords)
     {
         nodes = getNodeSet(doc, "//div[@class='job-details']/
                                 div[@data-section]")
         if(length(nodes) == 0) 
             nodes = getNodeSet(doc, "//div[@class='job-details']//p")
         
         if(length(nodes) == 0) 
             warning("did not find any nodes for the free form text in ",
                     docName(doc))
         
         words = lapply(nodes,
                        function(x)
                            strsplit(xmlValue(x), 
                                     "[[:space:][:punct:]]+"))
         
         removeStopWords(words, stopWords)
     }

## Code to extract the key information for Data Scientist job postings

cy.getSkillList = function(doc)
{
  lis = getNodeSet(doc, "//div[@class = 'skills-section']//
                         li[@class = 'skill-item']//
                         span[@class = 'skill-name']")

  sapply(lis, xmlValue)
}

cy.getDatePosted = function(doc)
  { xmlValue(getNodeSet(doc, 
                     "//div[@class = 'job-details']//
                        div[@class='posted']/
                        span/following-sibling::text()")[[1]],
    trim = TRUE) 
}

cy.getLocationSalary = function(doc)
{
  ans = xpathSApply(doc, "//div[@class = 'job-info-main'][1]/div", xmlValue)
  names(ans) = c("location", "salary")
  ans
}

cy.readPost = function(u, stopWords = StopWords, doc = htmlParse(u))
  {
    ans = list(words = cy.getFreeFormWords(doc, stopWords),
         datePosted = cy.getDatePosted(doc),
         skills = cy.getSkillList(doc))
    o = cy.getLocationSalary(doc)
    ans[names(o)] = o
    ans
}

## Code to search CyberCoders.com for Data Scientist job postings

txt = getForm("http://www.cybercoders.com/search/", searchterms = '"Data Scientist"',
              searchlocation = "",  newsearch = "true", sorttype = "")

doc = htmlParse(txt, asText = TRUE)
links = getNodeSet(doc, "//div[@class = 'job-title']/a/@href")

joblinks <- getRelativeURL(as.character(links), "http://www.cybercoders.com/search/")

cy.getPostLinks = function(doc, baseURL = "http://www.cybercoders.com/search/") 
  {
    if(is.character(doc)) doc = htmlParse(doc)
    links = getNodeSet(doc, "//div[@class = 'job-title']/a/@href") 
    getRelativeURL(as.character(links), baseURL)
}

cy.readPagePosts = function(doc, links = cy.getPostLinks(doc, baseURL),
baseURL = "http://www.cybercoders.com/search/")
  {
    if(is.character(doc)) doc = htmlParse(doc)
    lapply(links, cy.readPost)
 }

posts = cy.readPagePosts(doc)
sapply(posts,`[[`, "salary")

summary(sapply(posts, function(x) length(unlist(x$words))))

## Get the job postings for more than one page and count the number of times key words appear in the postings

cy.getNextPageLink = function(doc, baseURL = docName(doc))
{
  if(is.na(baseURL))
     baseURL = "http://www.cybercoders.com/"
  link = getNodeSet(doc, "//li[@class = 'lnk-next pager-item ']/a/@href")
  if(length(link) == 0)
    return(character())
    link2 <- gsub("./", "search/",link[[1]])
 getRelativeURL(link2, baseURL)
}

cyberCoders =
function(query)
{
   txt = getForm("http://www.cybercoders.com/search/",
                  searchterms = query,  searchlocation = "",
                  newsearch = "true",  sorttype = "")
   doc = htmlParse(txt)

   posts = list()
   while(TRUE) {
       posts = c(posts, cy.readPagePosts(doc))
       nextPage = cy.getNextPageLink(doc)
       if(length(nextPage) == 0)
          break

       nextPage = getURLContent(nextPage)
       doc = htmlParse(nextPage, asText = TRUE)
   }
   invisible(posts)
}

dataSciPosts = cyberCoders("Data Scientist")
tt = sort(table(unlist(lapply(dataSciPosts, `[[`, "skills"))),
           decreasing = TRUE)
tt[tt >= 2]

## Convert tt to a matrix and change the dimnames to rownames

contt <- as.matrix(tt)
names <- rownames(contt)
rownames(contt) <- NULL
comtt <- cbind(names, contt)

## Combine like skills for a more concise list of skills

grepl("^Statis+", comtt[,1])
Statistt1 <- rbind(comtt[17], comtt[24], comtt[25], comtt[95], comtt[281], comtt[282], comtt[283], comtt[284])
Statistt2 <- rbind(comtt[17,2], comtt[24,2], comtt[25,2], comtt[95,2], comtt[281,2], comtt[282,2], comtt[283,2], comtt[284,2])
Statistt <- cbind(Statistt1, Statistt2)
grepl("C+", comtt[,1])
Ctt1 <- rbind(comtt[18], comtt[33], comtt[126], comtt[127], comtt[128], comtt[194], comtt[195])
Ctt2 <- rbind(comtt[18,2], comtt[33,2], comtt[126,2], comtt[127,2], comtt[128,2], comtt[194,2], comtt[195,2])
Ctt <- cbind(Ctt1, Ctt2)
