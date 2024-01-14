from multipleImage import get_nutrition_facts_from_multiple_foods
from database import writeTotaltoDB, readfromDB, writeFoodtoDB, initiateDB

# start Firebase database
db = initiateDB()

# read image from database
readfromDB()

# write food from image's nutrients to "nutrient_facts" database
writeFoodtoDB(db, get_nutrition_facts_from_multiple_foods())

# write total nutrients added up to "users" database
writeTotaltoDB(db)
