# Alternative Assets Market Intelligence Tracker

This project analyzes private equity and venture capital investment activity using a structured relational dataset.  
The goal is to simulate the type of market intelligence analysis used by financial data providers (e.g., Preqin, PitchBook) and asset management firms (e.g., BlackRock-style roles).

## Dataset Structure

The project uses a relational database model with three core tables:

### Firms
- `firm_id` (PK)
- `firm_name`
- `region`

### Funds
- `fund_id` (PK)
- `firm_id` (FK → Firms)
- `fund_name`
- `strategy` (e.g., Venture Capital, Growth Equity, Late Stage VC, Private Equity)
- `vintage_year`
- `fund_size_usd`

### Deals
- `deal_id` (PK)
- `fund_id` (FK → Funds)
- `portfolio_company`
- `industry` (cleaned: Artificial Intelligence, Software / SaaS, FinTech, Consumer / E-commerce, etc.)
- `deal_year`
- `deal_value` (USD, original)
- `deal_value_millions` (cleaned/derived)

**Relationships**  
Firms (1) → Funds (many) → Deals (many)

## Analysis Performed

The following key analyses were conducted using **SQL**:

- Deal volume (count and total value) by industry
- Investment trends over time (by deal_year)
- Average deal size by fund strategy
- Regional distribution of funds and firms
- Total investment value by region

## Tools Used

- **SQL** — core querying and aggregation (via SQLite / PostgreSQL / BigQuery-style syntax)
- **Python** — data cleaning, transformation, and future EDA (pandas, matplotlib/seaborn planned)
- **Power BI** — interactive dashboards and visualizations (relationship modeling, DAX measures, slicers)

*(Python scripts and Power BI .pbix file will be added in future commits.)*

## Key Visualizations (Power BI)

- Deal volume and value by industry (clustered column / bar charts)
- Investment trend by year (line + column combo chart)
- Average deal size by strategy (bar chart)
- Regional distribution of funds (pie / donut / map visuals)
- Executive summary cards (total value, deal count, average size)

## Future Improvements

- Full Python-based exploratory data analysis (EDA) notebooks
- Advanced Power BI dashboards with drill-through, bookmarks, and tooltips
- Sector growth trend modeling (YoY growth, CAGR calculations)
- Deal size distribution analysis (histograms, box plots, outliers)
- Integration of real-time or more recent 2025–2026 data
- Deployment of interactive dashboard (Power BI Service or Streamlit)

## How to Use This Repository

1. Clone the repo
2. Open the provided `.xlsx` or CSVs in Excel / Power BI
3. Import tables into Power BI Desktop
4. Set relationships: `Deals.fund_id → Funds.fund_id` and `Funds.firm_id → Firms.firm_id`
5. Build visuals using the measures and fields described above

Contributions, additional real datasets, or dashboard enhancements are welcome!
