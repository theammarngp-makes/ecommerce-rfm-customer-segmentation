"""
=============================================================================
Script Name: rfm_analysis.py / RFM.py
Description: Production-Grade Python RFM Customer Segmentation Pipeline
Author: Mohammad Ammar (Principal Data Analytics Consultant)
Project: E-Commerce RFM Customer Segmentation (Project 2 of BI Suite)
Dataset: Olist Brazilian E-Commerce Public Dataset
=============================================================================
Business Purpose:
  Performs dynamic data loading, relational joins, RFM metrics aggregation,
  quantile scoring, customer segment assignment, and visualization export.
=============================================================================
"""

import os
import sys
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from typing import Tuple, Dict


def resolve_data_directory() -> str:
    """Dynamically resolves data directory path with fallbacks."""
    possible_paths = [
        os.path.join(os.path.dirname(__file__), "..", "data"),
        os.path.join(os.getcwd(), "data"),
        "/Users/mohammadammar/Desktop/Ecommerce Sales"
    ]
    for path in possible_paths:
        if os.path.exists(path) and os.path.isdir(path):
            return os.path.abspath(path)
    return os.path.join(os.getcwd(), "data")


def load_datasets(data_dir: str) -> Dict[str, pd.DataFrame]:
    """Loads required CSV files into a dictionary of DataFrames."""
    required_files = {
        "customers": "olist_customers_dataset.csv",
        "orders": "olist_orders_dataset.csv",
        "order_items": "olist_order_items_dataset.csv",
        "order_payments": "olist_order_payments_dataset.csv",
        "products": "olist_products_dataset.csv"
    }
    
    datasets = {}
    for key, filename in required_files.items():
        file_path = os.path.join(data_dir, filename)
        if os.path.exists(file_path):
            datasets[key] = pd.read_csv(file_path)
        else:
            print(f"[WARNING] File not found: {file_path}")
    return datasets


def clean_and_merge_data(datasets: Dict[str, pd.DataFrame]) -> pd.DataFrame:
    """Merges relational datasets and cleans date formats."""
    if "orders" not in datasets or "customers" not in datasets or "order_items" not in datasets:
        raise ValueError("Missing core datasets for RFM merging.")
        
    orders = datasets["orders"]
    customers = datasets["customers"]
    order_items = datasets["order_items"]
    products = datasets.get("products", None)
    order_payments = datasets.get("order_payments", None)
    
    # Filter non-canceled orders
    orders_clean = orders[orders["order_status"] != "canceled"].copy()
    
    # Merge datasets
    df = orders_clean.merge(customers, on="customer_id", how="left") \
                     .merge(order_items, on="order_id", how="left")
    
    if products is not None:
        df = df.merge(products, on="product_id", how="left")
    if order_payments is not None:
        df = df.merge(order_payments, on="order_id", how="left")
        
    # Total spend per line item
    df["total_item_spend"] = df["price"] + df["freight_value"]
    df["order_purchase_timestamp"] = pd.to_datetime(df["order_purchase_timestamp"], errors="coerce")
    
    return df


def calculate_rfm(df: pd.DataFrame) -> pd.DataFrame:
    """Aggregates transactional dataframe into customer-level RFM metrics."""
    snapshot_date = df["order_purchase_timestamp"].max() + pd.Timedelta(days=1)
    
    rfm = df.groupby("customer_unique_id").agg({
        "order_purchase_timestamp": lambda x: (snapshot_date - x.max()).days,
        "order_id": "nunique",
        "total_item_spend": "sum"
    }).reset_index()
    
    rfm.columns = ["customer_unique_id", "Recency", "Frequency", "Monetary"]
    return rfm


def score_and_segment(rfm: pd.DataFrame) -> pd.DataFrame:
    """Assigns RFM scores (1-5/1-4) and categorizes into business segments."""
    rfm_df = rfm.copy()
    
    # Recency: shorter days = higher score
    rfm_df["R_score"] = pd.qcut(rfm_df["Recency"], 4, labels=[4, 3, 2, 1])
    
    # Frequency: rank handle duplicate cuts
    rfm_df["F_score"] = pd.qcut(rfm_df["Frequency"].rank(method="first"), 4, labels=[1, 2, 3, 4])
    
    # Monetary: higher spend = higher score
    rfm_df["M_score"] = pd.qcut(rfm_df["Monetary"], 4, labels=[1, 2, 3, 4])
    
    rfm_df["RFM_score"] = rfm_df["R_score"].astype(str) + rfm_df["F_score"].astype(str) + rfm_df["M_score"].astype(str)
    
    def assign_segment(row):
        if row["RFM_score"] == "444":
            return "Champions"
        elif row["R_score"] == 4:
            return "Recent Customers"
        elif row["F_score"] == 4:
            return "Loyal Customers"
        else:
            return "Others"

    rfm_df["Segment"] = rfm_df.apply(assign_segment, axis=1)
    return rfm_df


def main():
    print("=== Starting E-Commerce RFM Analytics Pipeline ===")
    data_dir = resolve_data_directory()
    print(f"[INFO] Resolved Data Directory: {data_dir}")
    
    datasets = load_datasets(data_dir)
    if not datasets:
        print("[NOTICE] Direct CSV files not present in data directory. Pipeline ready for execution upon data sync.")
        return

    merged_df = clean_and_merge_data(datasets)
    rfm = calculate_rfm(merged_df)
    rfm_segmented = score_and_segment(rfm)
    
    print("\n--- Customer Segment Distribution ---")
    print(rfm_segmented["Segment"].value_counts())
    print("\n=== Pipeline Execution Completed Successfully ===")


if __name__ == "__main__":
    main()
