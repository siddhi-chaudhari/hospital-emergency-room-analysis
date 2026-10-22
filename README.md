# 🏥 Hospital Emergency Room Data Analysis

An end-to-end data analytics project that explores hospital emergency room activity using **Python, PostgreSQL, SQL, and Power BI**. The project focuses on patient demographics, admission patterns, waiting times, satisfaction scores, and department referrals through data analysis and interactive visualization.

## 📌 Project Overview

The objective of this project is to transform raw emergency room data into meaningful insights that help understand patient flow and hospital service patterns. The analysis includes data cleaning, exploratory data analysis, SQL queries, and an interactive Power BI dashboard.

## 🎯 Project Objectives

- Analyze total emergency room patient visits.
- Understand patient admission patterns.
- Calculate average patient waiting time.
- Examine patient satisfaction scores.
- Analyze patient demographics by age group, gender, and race.
- Compare patient counts across department referrals.
- Identify patient visit patterns by month, day, and hour.
- Develop an interactive dashboard for visual reporting.

## 🛠️ Tools and Technologies

| Tool | Purpose |
|---|---|
| Python | Data cleaning and preprocessing |
| Pandas | Data manipulation and analysis |
| NumPy | Numerical operations |
| PostgreSQL | Database storage and management |
| SQL | Querying and analyzing patient records |
| Power BI | Interactive dashboards and data visualization |
| DAX | Creating measures and KPIs |
| GitHub | Version control and project documentation |

## 📂 Dataset Description

The dataset contains **9,216 records and 12 original columns** related to emergency room visits.

Key attributes include:

- Patient ID
- Admission Date
- Gender
- Age
- Race
- Department Referral
- Admission Flag
- Satisfaction Score
- Waiting Time

**Data privacy:** Patient name fields are excluded from the analytical dashboard. The dataset should be shared only if its usage and redistribution are permitted.

## 🔄 Project Workflow

1. **Data Loading:** Imported the dataset into Python using Pandas.
2. **Data Exploration:** Examined the dataset structure, data types, summary statistics, and missing values.
3. **Data Cleaning:** Removed unnecessary columns, standardized category values, and checked duplicate information.
4. **Feature Engineering:** Created age groups and date-related fields for further analysis.
5. **Database Integration:** Loaded the cleaned dataset into PostgreSQL.
6. **SQL Analysis:** Queried patient visits, admission status, department referrals, waiting time, and satisfaction scores.
7. **DAX Measures:** Created calculated measures for key performance indicators.
8. **Dashboard Development:** Built interactive Power BI visuals to present the analysis.

## 📊 Key Performance Indicators (KPIs)

The Power BI dashboard includes:

- **Total Patients:** Total distinct patient identifiers.
- **Admitted Patients:** Number of patients marked as admitted.
- **Admission Rate:** Percentage of patient records marked as admitted.
- **Average Waiting Time:** Mean recorded waiting time in minutes.
- **Average Satisfaction Score:** Mean satisfaction score among records with available values.

## 📈 Dashboard Features

The interactive Power BI dashboard includes:

- KPI cards for patient volume and service metrics.
- Donut chart for patient distribution by gender.
- Bar charts for age group, race, and department referral analysis.
- Line and area charts for patient trends over time.
- Matrix heatmap for patient volume by day and hour.
- Interactive slicers for department, gender, age group, admission status, and admission date.

## 🖼️ Dashboard Preview

Add your Power BI dashboard screenshot to the repository, preferably inside a folder named `screenshots`.

For example:

```text
screenshots/
└── hospital-er-dashboard.png
```

Then display it here:

```markdown
![Hospital Emergency Room Dashboard](screenshots/hospital-er-dashboard.png)
```

## 💡 Key Insights

The analysis provides an overview of patient visits, recorded admission patterns, waiting times, satisfaction scores, and department referrals.

The dataset shows an average waiting time of approximately **35.26 minutes** and an average satisfaction score of approximately **4.99** among records with available satisfaction scores.

The dashboard can help identify periods of higher patient volume and differences across demographic and referral categories. These findings are descriptive and do not establish the causes of waiting times or satisfaction levels.

## 🚀 Getting Started

### Prerequisites

Install or configure the following tools:

- Python 3.x
- Jupyter Notebook or another Python environment
- PostgreSQL
- Power BI Desktop

### Python Setup

Clone the repository:

```bash
git clone https://github.com/YOUR-USERNAME/hospital-emergency-room-analysis.git
cd hospital-emergency-room-analysis
```

Install the required Python libraries:

```bash
pip install pandas numpy sqlalchemy psycopg2-binary
```

Load the dataset:

```python
import pandas as pd

df = pd.read_csv("Hospital Emergency Room Data.csv")

print(df.head())
print(df.info())
```

**Note:** Update the file path and database connection settings according to your local environment. Do not commit database passwords or other credentials to GitHub.

## 📁 Suggested Repository Structure

```text
hospital-emergency-room-analysis/
│
├── README.md
├── notebooks/
│   └── data_cleaning_and_analysis.ipynb
├── sql/
│   └── hospital_analysis.sql
├── powerbi/
│   └── hospital_er_dashboard.pbix
├── screenshots/
│   └── hospital-er-dashboard.png
└── .gitignore
```

Add only the files and folders that are actually included in your project.

## 🔮 Future Improvements

- Analyze waiting-time patterns across different patient groups.
- Improve handling of missing department and satisfaction data.
- Add more detailed monthly and quarterly comparisons.
- Enhance dashboard filtering and visual formatting.
- Develop additional operational metrics for patient flow monitoring.

## 👩‍💻 Author

**Siddhi Chaudhari**

B.Tech — Artificial Intelligence and Data Science

GitHub: [siddhi-chaudhari](https://github.com/siddhi-chaudhari)

## 📄 License

This project is intended for educational and portfolio purposes. Add a license file if you wish to specify the terms under which others may use or modify the project.
