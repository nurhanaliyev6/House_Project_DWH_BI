# House Data Engineering Project

![architecture](https://github.com/user-attachments/assets/390b9415-ac1c-4548-923b-2ffcfb4b9da0)


### Overview
This project is an end-to-end data engineering solution designed for managing and analyzing house listings data. It covers the entire pipeline from data extraction to transformation, loading (ETL), and visualization. The project uses dbt for data transformations, PostgreSQL for implementing the data warehouse (DWH), and Power BI for creating a dynamic dashboard.

### Project Structure
seeds/house_data.csv: The extracted dataset from yeniemlak.az containing house listings data. <br>
models/: Directory containing dbt project files for transformations and tests. <br>
schema.yml: File defining the structure and tests for the dbt models. <br>
architecture.png: Diagram showing the architecture of the data warehouse tables. <br>

### Technologies Used
dbt (Data Build Tool): For data modeling, transformation, and testing. <br>
PostgreSQL: As the data warehouse (DWH) for storing transformed data. <br>
Power BI: For creating interactive dashboards and data visualization. <br>
GitHub: For version control and project documentation. <br>


## Data Pipeline Implementation
### 1. Data Source
The project begins with the house_data.csv file, which includes the following columns: <br>
['Qiymet', 'Tarix', 'Baxısh', 'Elan', 'Emlak', "Kategoriya", 'Mertebe', "Sahe", 'Otag sayı', 'Çıxarısh', 'İpoteka', 'Adres','Umumi Mertebe sayi'] <br>

### 2. Data Warehouse (DWH)
The data warehouse is implemented in PostgreSQL, with the following structure: <br>

<span style="color:black">Fact Table (fact_house)</span>: Stores the main transactional data related to house listings, including foreign keys to various dimension tables. <br>

<span style="color:black">Dimension Tables</span>: <br>
dim_tarix  <br>
dim_kateqoriya <br>
dim_adres  <br>
dim_emlak <br>
dim_çıxarış <br>

### 3. dbt Project
The dbt project is central to this data pipeline, handling the following tasks: <br>
Data from house_data.csv is cleaned, transformed, and loaded into the data warehouse. Key transformations include: <br>

a. Data Cleaning: Handling null values, correcting data types, and ensuring data consistency. <br>
b. Data Testing: <br>
To ensure data quality, various tests are implemented in schema.yml: <br>

<span style="color:black">Unique Tests</span>: Ensure that certain columns (like house_id) contain unique values. <br>
<span style="color:black">Not Null Tests</span>: Verify that critical columns (like qiymət and kateqoriya_id) are never null. <br>
<span style="color:black">Relationships Tests</span>: Ensure referential integrity between fact and dimension tables. <br>

![tests](https://github.com/user-attachments/assets/2ab21069-4fef-4100-b585-b9c597ab6350)



 ### c. Data Loading
Once transformed and tested, the data is loaded into PostgreSQL, where it resides in the corresponding fact and dimension tables.<br>
<br>




## Power BI Dashboard
The Power BI dashboard is connected to the PostgreSQL database and provides a dynamic and interactive way to analyze the house data. The dashboard includes the following features: <br>

Visuals:

Average price by category and location <br>
Number of listings over location <br>
Distribution of room counts <br>
Mortgage and ownership document status insights <br>
Filters: <br>

Category <br>
Location <br>
Property type <br>
The Power BI dashboard allows users to gain insights into the real estate market trends, focusing on various dimensions of the house listings data.







