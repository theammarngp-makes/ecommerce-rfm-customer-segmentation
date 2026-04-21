import pandas as pd 
import matplotlib.pyplot as plt
import datetime as dt
import seaborn as sns

customers = pd.read_csv("/Users/mohammadammar/Desktop/Ecommerce Sales/olist_customers_dataset.csv")
geolocation=pd.read_csv("/Users/mohammadammar/Desktop/Ecommerce Sales/olist_geolocation_dataset.csv")
order_items=pd.read_csv("/Users/mohammadammar/Desktop/Ecommerce Sales/olist_order_items_dataset.csv")
order_payments=pd.read_csv("/Users/mohammadammar/Desktop/Ecommerce Sales/olist_order_payments_dataset.csv")
orders =pd.read_csv("/Users/mohammadammar/Desktop/Ecommerce Sales/olist_orders_dataset.csv")
products =pd.read_csv("/Users/mohammadammar/Desktop/Ecommerce Sales/olist_products_dataset.csv")


date_cols = [
    "order_purchase_timestamp",
    "order_delivered_customer_date",
    "order_estimated_delivery_date"
]
df = orders.merge(customers,on="customer_id",how="left")\
      .merge(order_items,on="order_id",how="left")\
      .merge(products,on="product_id",how="left")\
      .merge(order_payments,on="order_id",how="left") 

#Convert date columns to datetime format
df["total"] = df["price"]+df["freight_value"]
for col in date_cols:
    df[col] = pd.to_datetime(df[col], errors="coerce")

# RFM Customer Segmentation
snapshot_date = df["order_purchase_timestamp"].max() + pd.Timedelta(days=1)

rfm = df.groupby("customer_unique_id").agg({
    "order_purchase_timestamp": lambda x: (snapshot_date - x.max()).days,
    "order_id": "nunique",
    "total": "sum"
})

rfm.columns = ["Recency", "Frequency", "Monetary"]

# scoring
rfm["R_score"] = pd.qcut(rfm["Recency"], 4, labels=[4,3,2,1])
rfm["F_score"] = pd.qcut(rfm["Frequency"].rank(method="first"), 4, labels=[1,2,3,4])
rfm["M_score"] = pd.qcut(rfm["Monetary"], 4, labels=[1,2,3,4])

rfm["RFM_score"] = rfm[["R_score","F_score","M_score"]].astype(str).sum(axis=1)
def segment(row):
    if row["RFM_score"] == "444":
        return "Champions"
    elif row["R_score"] == 4:
        return "Recent Customers"
    elif row["F_score"] == 4:
        return "Loyal Customers"
    else:
        return "Others"

rfm["Segment"] = rfm.apply(segment, axis=1)
print(rfm)
rfm["Segment"].value_counts().plot(kind="bar", title="Customer Segments")
plt.show()

  
