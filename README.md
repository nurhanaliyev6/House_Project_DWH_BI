# House Data Engineering Project

![architecture](https://github.com/user-attachments/assets/390b9415-ac1c-4548-923b-2ffcfb4b9da0)


### Overview
This project is an end-to-end data engineering solution designed for managing and analyzing house listings data. It covers the entire pipeline from data extraction to transformation, loading (ETL), and visualization. The project uses dbt for data transformations, PostgreSQL for implementing the data warehouse (DWH), and Power BI for creating a dynamic dashboard.
Note: [Data is extracted in this repo.](https://github.com/nurhanaliyev6/House-Data-ETL-Project)


### Project Structure
**seeds/house_data.csv**: The extracted dataset from yeniemlak.az containing house listings data. <br>
**models/**: Directory containing dbt project files for transformations and tests. <br>
**schema.yml**: File defining the structure and tests for the dbt models. <br>
**architecture.png**: Diagram showing the architecture of the data warehouse tables. <br>
**sumgait_house_price_tracker.pbix**: Dashboard showing house data of Sumagit. <br>

### Technologies Used
__dbt (Data Build Tool)__: For data modeling, transformation, and testing. <br>
__PostgreSQL__: As the data warehouse (DWH) for storing transformed data. <br>
__Power BI__: For creating interactive dashboards and data visualization. <br>
__GitHub__: For version control and project documentation. <br>


## Data Pipeline Implementation
### 1. Data Source
The project begins with the __house_data.csv__ file, which includes the following columns: <br>
` ['Qiymet', 'Tarix', 'Baxısh', 'Elan', 'Emlak', "Kategoriya", 'Mertebe', "Sahe", 'Otag sayı', 'Çıxarısh', 'İpoteka', 'Adres','Umumi Mertebe sayi'] ` <br>

### 2. Data Warehouse (DWH)
The data warehouse is implemented in PostgreSQL, with the following structure: <br>

__Fact Table (fact_house)__: Stores the main transactional data related to house listings, including foreign keys to various dimension tables. <br>

**Dimension Tables**: <br>
__dim_tarix__  <br>
__dim_kateqoriya__ <br>
__dim_adres__  <br>
__dim_emlak__ <br>
__dim_çıxarış__ <br>
__dim_mərtəbə__ <br>

### 3. dbt Project
The dbt project is central to this data pipeline, handling the following tasks: <br>
Data from house_data.csv is cleaned, transformed, and loaded into the data warehouse. Key transformations include: <br>

__a.__ Data Cleaning: Handling null values, correcting data types, and ensuring data consistency. <br>
__b.__ Data Testing: <br>
To ensure data quality, various tests are implemented in schema.yml: <br>

**Unique Tests**: Ensure that certain columns (like house_id) contain unique values. <br>
**Not Null Tests**: Verify that critical columns (like qiymət and kateqoriya_id) are never null. <br>
**Relationships Tests**: Ensure referential integrity between fact and dimension tables. <br>

![tests](https://github.com/user-attachments/assets/2ab21069-4fef-4100-b585-b9c597ab6350)



 ### c. Data Loading
Once transformed and tested, the data is loaded into PostgreSQL, where it resides in the corresponding fact and dimension tables.<br>
<br>




## Power BI Dashboard
The Power BI dashboard is connected to the PostgreSQL database and provides a dynamic and interactive way to analyze the house data. The dashboard includes the following features: <br>

**Visuals**:

Average Price by Adress <br>
Number of Views over Adress <br>
Distribution of floor counts <br>
Average Area by Adress <br>

**Filters**: <br>

Adress <br>
Mortgage  status <br>
Room count <br>
Category type <br>
The Power BI dashboard allows users to gain insights into the real estate market trends, focusing on various dimensions of the house listings data.

![Screenshot (429)](https://github.com/user-attachments/assets/916d44cf-4fdb-4902-94fd-6ae9adcdcf1c)

[Dashboard link(click me)](https://app.powerbi.com/links/p23HvgFOs6?ctid=a830f566-8c60-43cf-9f13-939301bec745&pbi_source=linkShare)










