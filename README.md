# 4501-Python-Project
# New York Residential Environment Analysis

### Group Name: Group 44
UNIs: [ft2605, dq2161]


This project is a Python-based data analysis and visualization project that uses various libraries such as pandas, geopandas, SQLAlchemy, and matplotlib. The project is structured as a Jupyter notebook, which allows for interactive execution of code and visualization of data.

The project is divided into several parts:

1. **Data Preprocessing**: This part involves loading and cleaning various datasets related to New York City, including zip code data, 311 complaint data, tree data, and Zillow rent data. The data is loaded from various sources, cleaned, and transformed into pandas dataframes for further processing.

2. **Storing Data**: This part involves setting up a PostgreSQL database and storing the preprocessed data into it. The data is stored in four tables: tree, complaint, zipcode, and rent. The database setup and data insertion are done using SQLAlchemy.

3. **Understanding the Data**: This part involves writing and executing SQL queries to understand the data. The queries are written to answer specific questions about the data, such as which area might be more calm to live in, where has the most greenery, and can I afford a place in the areas with the most trees. The results of the queries are printed out.

4. **Visualizing the Data**: This part involves creating visualizations of the data to better understand it. The visualizations are created using matplotlib and are based on the results of the SQL queries.

### Requirements

- Python 3.6 or higher
- Jupyter Notebook
- Libraries: pandas, geopandas, SQLAlchemy, matplotlib, psycopg2
- PostgreSQL database (without password)

### Usage

1. Clone the repository and navigate to the project directory.
2. Install the required libraries using pip:
```
    pip install -r requirements.txt
```
3. Open the Jupyter notebook:
```
jupyter notebook Project\REA_NY.ipynb
```
4. Run the cells in the notebook to load and clean the data, store it in the database, execute the SQL queries, and create the visualizations.

### Note

This project provides a basic framework on which you can analyze your city
You can get earlier data by modifying the DATA_DOWNLOAD_START_YEAR