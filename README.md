# Swiggy Data Analysis Using SQL
![image](https://github.com/user-attachments/assets/e7f5ff99-31cb-494b-88f4-35b2cf71f6a8)



---



## SQL Case Study

This repository contains an SQL case study focused on analyzing Swiggy restaurant data. The aim is to answer a set of specific questions using SQL queries, providing insights into various aspects of the restaurant data.

## Dataset Schema

The dataset used in this analysis contains the following fields:

- **`restaurant_no`**: Unique identifier for each restaurant.
- **`restaurant_name`**: Name of the restaurant.
- **`city`**: City where the restaurant is located.
- **`address`**: Address of the restaurant.
- **`rating`**: Rating of the restaurant.
- **`cost_per_person`**: Average cost per person at the restaurant.
- **`cuisine`**: Type of cuisine offered by the restaurant.
- **`restaurant_link`**: Link to the restaurant's page.
- **`menu_category`**: Category of the menu item (e.g., Main Course, Dessert).
- **`item`**: Name of the menu item.
- **`price`**: Price of the menu item.
- **`veg_or_non-veg`**: Indicates whether the menu item is vegetarian or non-vegetarian.

## Questions Answered

1. **Which is the top 1 city with the highest number of restaurants?**
2. **How many restaurants have the word "Pizza" in their name?**
3. **What is the most common cuisine among the restaurants in the dataset?**
4. **What is the average rating of restaurants in each city?**
5. **How many restaurants have a rating greater than 4.5?**
6. **What is the highest price of an item under the 'Recommended' menu category for each restaurant?**
7. **Which restaurant offers the most number of items in the 'Main Course' category?**
8. **Find the restaurants that have an average cost higher than the total average cost of all restaurants.**
9. **Retrieve the details of restaurants that have the same name but are located in different cities.**
10. **Find the top 5 most expensive restaurants that offer cuisine other than Indian cuisine.**
11. **List the names of restaurants that are 100% vegetarian in alphabetical order.**
12. **Which restaurant provides the lowest average price for all items?**
13. **Which top 5 restaurants offer the highest number of categories?**
14. **Which restaurant provides the highest percentage of non-vegetarian food?**

## Data and Tools

- **Dataset**: The dataset consists of various details about restaurants listed on Swiggy, including names, cuisines, ratings, prices, and locations.
- **Tools Used**: PostgreSQL (or any SQL-based database)
