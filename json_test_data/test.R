install.packages("tweet2r") 
library(tweet2r)

#definition of the start time and end time
start<-"2015-12-15 11:35:00"
end<-"2015-12-16 23:59:59"

#definition of the file prefix
fileprefix="tweets"
key=c("keyword1", "keyword2")

#definition number of tweets per file
number=3000

#running the function
tweet2r(start=start,end=end,ntweets=number,keywords=key,fileprefix = fileprefix)

#--------------------------------------------------
#VALIDATE JSON FILES
#--------------------------------------------------

#define the name of JSON file prefix to validate
fileprefix="castnov"
#validate JSON files collection
valjson(fileprefix)

#--------------------------------------------------
#STORE TWEETS INTO A SQLITE AND IMPORT FROM SQLITE
#--------------------------------------------------

tweets<-t2sqlite(fileprefix, import=TRUE)

#------------------------------------------------------------------
#IMPORT AS SPATIAL DATA FRAME FROM SQLITE ADN EXPORT TO GIS FORMAT
#------------------------------------------------------------------
#export as kml
export="shp"
#database name
dbname="castnov"

geotweets<-t2gis(dbname,export)

#-------------------------------------------------------
# GET A SUMMARY FORM TWEETS RETRIEVED
#-------------------------------------------------------

summary<-t2summary(tweets, geotweets)

#show output
summary



#---------------------------------------------------
#IMPORT JSON TO POSTGIS USING t2pgis function
#----------------------------------------------------

#Note you need a postgis database tu run this code

#IMPORT JSON TO POSTGIS
connection <- dbConnect(PostgreSQL(), host="database url",port=5432,
                        user="user name", password="password", dbname="tweets")
fileprefix="tweets"

t2pgis(fileprefix, connection)


#IMPORT FROM POSTGIS TO R EXAMPLE
#From here you need a postgis database
library(rgdal)

#connect to the data base
con<-"PG:dbname= tweets host='url' port='5432' user= postgresuer  password= postgrespassword"

#list geo tables of my postGIS
ogrListLayers(con)

#read the geotweets form table
geotweets = readOGR(con, "geotweets")

#write a shape file
writeOGR(geotweets, "tweets","tweets", driver="ESRI Shapefile" )

#Close conection
postgresqlCloseConnection(con)

#-----------End Posttgis Example -------------------







