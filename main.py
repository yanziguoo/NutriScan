from multipleImage import get_nutrition_facts_from_multiple_foods
from database import writetoDB, readfromDB

readfromDB()
writetoDB(get_nutrition_facts_from_multiple_foods())
