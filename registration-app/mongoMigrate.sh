#!/bin/bash

# Complex JSON dataset here: https://www.yelp.com/dataset

echo "Enter the endpoint information for your MongoDB database: "
echo "Please include URI, credentials and database name as required."
read srcMongo

echo "Enter the collection name to export: "
read srcCol

echo "Enter the MongoDB API endpoint of your Oracle database: "
echo "Please include URI, credentials and database name as required."
read tgtMongo
echo "Enter the collection name to import: "
read tgtCol

echo "Enter the local storage location for the export file: "
read jsonLoc

# Export the JSON data from MongoDB
echo "MongoExport command is: "
echo "mongoexport --uri="mongodb://"$srcMongo --collection=$srcCol --out=$jsonLoc/$srcCol.json --type=json"
echo "Press any key to conduct the export."
read 
mongoexport --uri="mongodb://$srcMongo" --collection=$srcCol --out=$jsonLoc/$srcCol.json --type=json

# Import the JSON data into Oracle
echo "MongoImport command is: "
echo "mongoimport --uri="mongodb://$tgtMongo" --collection=$tgtCol --file=$jsonLoc/$srcCol.json"
echo "Press any key to conduct the import."
read 
mongoimport --uri="mongodb://$tgtMongo" --collection=$tgtCol --file=$jsonLoc/$srcCol.json


