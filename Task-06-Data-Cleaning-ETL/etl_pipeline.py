
"""
Task 06 - Reusable ETL Pipeline
================================
Reads raw Superstore CSV, applies all cleaning steps, saves cleaned output.
Usage: python etl_pipeline.py
"""

import pandas as pd
import numpy as np

def extract(filepath):
    """Load raw CSV data."""
    df = pd.read_csv(filepath, encoding="latin1")
    print(f"[EXTRACT] Loaded {len(df)} rows from {filepath}")
    return df

def transform(df):
    """Apply all cleaning transformations."""
    print("[TRANSFORM] Starting cleaning pipeline")

    # 1) Remove duplicates
    before = len(df)
    df = df.drop_duplicates().reset_index(drop=True)
    print(f"  [1] Removed {before - len(df)} duplicate rows")

    # 2) Trim whitespace from text columns
    text_cols = ['Ship Mode', 'Segment', 'Country', 'City', 'State', 'Region',
                 'Category', 'Sub-Category', 'Customer Name', 'Product Name']
    for col in text_cols:
        df[col] = df[col].astype(str).str.strip()
    print(f"  [2] Trimmed whitespace in {len(text_cols)} text columns")

    # 3) Standardize Category values
    category_map = {'furniture': 'Furniture', 'FURNITURE': 'Furniture',
                    'Furnitur': 'Furniture'}
    df['Category'] = df['Category'].replace(category_map)
    print(f"  [3] Standardized Category values")

    # 4) Fix Sales data type
    df['Sales'] = (df['Sales'].astype(str)
                   .str.replace('$', '', regex=False)
                   .str.replace(',', '', regex=False))
    df['Sales'] = pd.to_numeric(df['Sales'], errors='coerce')
    print(f"  [4] Converted Sales to float64")

    # 5) Fix date columns
    df['Order Date'] = pd.to_datetime(df['Order Date'], format='%d-%m-%Y', errors='coerce')
    df['Ship Date'] = pd.to_datetime(df['Ship Date'], format='%d-%m-%Y', errors='coerce')
    print(f"  [5] Converted date columns to datetime")

    # 6) Handle missing values
    df['Postal Code'] = df['Postal Code'].fillna(0).astype(int)
    df['Profit'] = df['Profit'].fillna(df['Profit'].median())
    df['Discount'] = df['Discount'].fillna(0)
    df = df.dropna(subset=['Sales']).reset_index(drop=True)
    print(f"  [6] Handled missing values")

    # 7) Cap outliers in Sales (IQR method)
    Q1 = df['Sales'].quantile(0.25)
    Q3 = df['Sales'].quantile(0.75)
    IQR = Q3 - Q1
    upper = Q3 + 3 * IQR
    df['Sales'] = df['Sales'].clip(upper=upper)
    print(f"  [7] Capped Sales outliers at {upper:.2f}")

    print(f"[TRANSFORM] Complete. Final rows: {len(df)}")
    return df

def load(df, output_path):
    """Save cleaned data."""
    df.to_csv(output_path, index=False)
    print(f"[LOAD] Saved cleaned data to {output_path}")

if __name__ == "__main__":
    df_raw = extract("SampleSuperstore.csv")
    df_clean = transform(df_raw)
    load(df_clean, "Superstore_Clean.csv")
    print("ETL pipeline completed successfully.")
