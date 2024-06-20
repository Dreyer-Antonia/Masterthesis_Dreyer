############################################################################################
# Title: Scoping Review on contact behavior and contact patterns in the context of disease 
# transmission within European Union and European Free Trade Association countries
###
# Date: 04-12-2023
# R version 4.1.3 (2022-03-10)


#Search in bioRxiv and medRxiv

# Concept 1 - Intervention: ("questionnair*", "survey*", "contact stud*", "location system*", "GPS", "Global Positioning System*", "geospatial", Respondent-Driven Sampling", 
# "smartphone*", "phone*", "tracking",  "mobile device*", "diary", "diaries", "Contact Tracing", "sensor*")

# AND

# Concept 2 - Outcome: ("contact pattern*", "contact data*", "contact behavior*", "contact rate*", "contact frequenc*", "contact network*", "contact intensit*", "contact mixing", "physical contact*", "contact parameter*", "social mixing", "assortative mixing", "disassortative mixing", "mixing parameter*", "social contact*", "mixing pattern*", "contact profil*", "contact person*", "contacted person*", "mixing behavio*", "close contact*", "contact duration*", "contact matri*", "sexual contact*", "sexual partner", "sexual partners")

# AND

# We did not include concept 3 and 4 in the search
# Concept 3 - Setting: 
# Concept 4 - Timeframe - 2000 to now. 


############################################################################################

# install & load the required packages
install.packages("rlang")
library(rlang)

install.packages("medrxivr")
library(medrxivr)

options(timeout = 600)  # Increase timeout to 600 seconds (10 minutes)

## get api info
medrxiv_data <- mx_api_content()
biorxiv_data <- mx_api_content(server = "biorxiv")

#medrxiv_data_test <- mx_snapshot()

# alternatively get a recent snapshot of the content
# medrxiv_data <- mx_snapshot()

################### 
### based on this documentation: https://github.com/ropensci/medrxivr
####################

Concept1 <- c("questionnair*", "survey*", "contact stud*", "location system*", "Global Positioning System*", "geospatial",  
              "Respondent-Driven Sampling", "smartphone*", "phone*", "tracking",  "mobile device*", "diary", "diaries", 
              "Contact Tracing", "sensor*") # Combined with Boolean OR


Concept2 <- c("contact pattern*", "contact data*", "contact behavior*", "contact rate*", "contact frequenc*", "contact network*", 
              "contact intensit*", "contact mixing", "physical contact*", "contact parameter*", "social mixing", "assortative mixing",
              "disassortative mixing", "mixing parameter*", "social contact*", "mixing pattern*", "contact profil*", "contact person*",
              "contacted person*", "mixing behavio*", "close contact*", "contact duration*", "contact matri*", "sexual contact*",
              "sexual partner", "sexual partners") # Combined with Boolean OR


# combine the two concepts with an AND operator 
query <- list(Concept1, Concept2 )
              

############# medrxiv
## run the search for medrxiv
mx_results_medrxiv <- mx_search(data = medrxiv_data, 
                        query = query, 
                        fields = c("title", "abstract"), 
                        deduplicate = TRUE,
                        report = TRUE)


######Run on 04-12-23
#Found 103 record(s) matching your search.

#Total topic 1 records: 4894
#questionnair([[:alpha:]]): 2195
#survey([[:alpha:]]): 1367
#contact stud([[:alpha:]]): 9
#location system([[:alpha:]]): 1
#Global Positioning System([[:alpha:]]): 1
#geospatial: 119
#Respondent-Driven Sampling: 2
#smartphone([[:alpha:]]): 73
#phone([[:alpha:]]): 149
#tracking: 554
#mobile device([[:alpha:]]): 23
#diary: 97
#diaries: 47
#Contact Tracing: 35
#sensor([[:alpha:]]): 633

#Total topic 2 records: 598
#contact pattern([[:alpha:]]): 106
#contact data([[:alpha:]]): 1
#contact behavior([[:alpha:]]): 1
#contact rate([[:alpha:]]): 93
#contact frequenc([[:alpha:]]): 13
#contact network([[:alpha:]]): 46
#contact intensit([[:alpha:]]): 4
#contact mixing: 3
#physical contact([[:alpha:]]): 10
#contact parameter([[:alpha:]]): 3
#social mixing: 47
#assortative mixing: 5
#disassortative mixing: 0
#mixing parameter([[:alpha:]]): 0
#social contact([[:alpha:]]): 97
#mixing pattern([[:alpha:]]): 39
#contact profil([[:alpha:]]): 0
#contact person([[:alpha:]]): 4
#contacted person([[:alpha:]]): 1
#mixing behavio([[:alpha:]]): 2
#close contact([[:alpha:]]): 138
#contact duration([[:alpha:]]): 0
#contact matri([[:alpha:]]): 42
#sexual contact([[:alpha:]]): 8
#sexual partner: 80
#sexual partners: 67

### print the reuslts to a csv file
write.csv(mx_results_medrxiv, file="medrxivResults.csv")

# export to .BIB file
mx_export(data = mx_results_medrxiv,
          file = "medx_search_results.bib")

## Download the results PDFs - does not work with biorxiv DOIs as preffix URL is specified to medrxiv.org
mx_download(mx_results_medrxiv, directory = "pdf/", create = TRUE)

############# biorxiv
## run the search for biorxiv
mx_results_biorxiv <- mx_search(data = biorxiv_data, 
                                query = query, 
                                fields = c("title", "abstract"), 
                                deduplicate = TRUE,
                                report = TRUE)


########Run on 04-12-23

#Found 24 record(s) matching your search.

#Total topic 1 records: 15235
#questionnair([[:alpha:]]): 526
#survey([[:alpha:]]): 1596
#contact stud([[:alpha:]]): 2
#location system([[:alpha:]]): 5
#Global Positioning System([[:alpha:]]): 0
#geospatial: 65
#Respondent-Driven Sampling: 0
#smartphone([[:alpha:]]): 38
#phone([[:alpha:]]): 265
#tracking: 3155
#mobile device([[:alpha:]]): 16
#diary: 184
#diaries: 28
#Contact Tracing: 2
#sensor([[:alpha:]]): 9864

#Total topic 2 records: 268
#contact pattern([[:alpha:]]): 30
#contact data([[:alpha:]]): 0
#contact behavior([[:alpha:]]): 0
#contact rate([[:alpha:]]): 20
#contact frequenc([[:alpha:]]): 53
#contact network([[:alpha:]]): 31
#contact intensit([[:alpha:]]): 1
#contact mixing: 0
#physical contact([[:alpha:]]): 22
#contact parameter([[:alpha:]]): 1
#social mixing: 8
#assortative mixing: 5
#disassortative mixing: 1
#mixing parameter([[:alpha:]]): 2
#social contact([[:alpha:]]): 15
#mixing pattern([[:alpha:]]): 14
#contact profil([[:alpha:]]): 3
#contact person([[:alpha:]]): 1
#contacted person([[:alpha:]]): 0
#mixing behavio([[:alpha:]]): 0
#close contact([[:alpha:]]): 19
#contact duration([[:alpha:]]): 2
#contact matri([[:alpha:]]): 38
#sexual contact([[:alpha:]]): 1
#sexual partner: 26
#sexual partners: 25

### print the reuslts to a csv file
write.csv(mx_results_biorxiv, file="biorxivResults.csv")

# export to .BIB file
mx_export(data = mx_results_biorxiv,
          file = "biox_search_results.bib")

## Download the results PDFs - does not work with biorxiv DOIs as preffix URL is specified to medrxiv.org
mx_download(mx_results_biorxiv, directory = "pdf/", create = TRUE)

# Speichere medrxiv_data in CSV
write.csv(medrxiv_data, file = "medrxiv_data.csv", row.names = FALSE)

# Speichere biorxiv_data in CSV
write.csv(biorxiv_data, file = "biorxiv_data.csv", row.names = FALSE)
