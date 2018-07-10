# tweet2r
Twitter streming Collector and Export to SQLite, 'postGIS', shapefile, KML, GML.

This is an improved implementation of the package 'StreamR' to capture tweets and store it into R, SQLite, 'postGIS' data base or GIS format. The package performs a description of harvested data and aommit space time exploratory analysis.

A typical workflow is (1) streaming data with `tweet2r()`, then (2) validate the recieved files with `valjson()` and (3) proceed with accumulating the individual files into a database, e.g. with `t2sqlite()`. Last but not least (4) you can attach an exprotative analysis with `t2summary()`.

The tweet2r package is in R-Cran repository, https://cran.r-project.org/web/packages/tweet2r/index.html
