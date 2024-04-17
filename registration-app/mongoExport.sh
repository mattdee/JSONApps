#!/bin/bash

# Export local mongodb collection to import into ADBJSON

# To get all collections in a database run this command from mongosh
# db.getCollectionNames()

# Update path as needed
/opt/homebrew/bin/mongoexport --collection=registrations --db=test --out=registrations.json