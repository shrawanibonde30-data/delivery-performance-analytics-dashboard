import pandas as pd

# -----> 1. Load Dataset
df = pd.read_csv("Ecommerce_Delivery_Analytics_New.csv")

# -----> 2. Remove Duplicate Records
df = df.drop_duplicates()

# -----> 3. Convert Order Date & Time to Datetime Format
df['Order Date & Time'] = pd.to_datetime(
    df['Order Date & Time'],
    errors='coerce'
)

# -----> 4. Remove Invalid Date Records
df = df.dropna(subset=['Order Date & Time'])

# -----> 5. Check Missing Values
df.isnull().sum()

# -----> 6. Review Dataset Information
df.info()

# -----> 7. Preview Order Date & Time Column
df['Order Date & Time'].head()

# -----> 8. Count Unique Order Dates
df['Order Date & Time'].dt.date.nunique()

# -----> 9. Extract Order Hour
df['Hour'] = df['Order Date & Time'].dt.hour

# -----> 10. Standardize Datetime Format
df['Order Date & Time'] = pd.to_datetime(
    df['Order Date & Time'],
    format='%Y-%m-%d %H:%M:%S',
    errors='coerce'
)

# -----> 11. Remove Unnecessary Columns
df = df.drop(['Day', 'Month'], axis=1)

# -----> 12. Review Updated Dataset Structure
df.info()

# -----> 13. Reconfirm Datetime Conversion
df['Order Date & Time'] = pd.to_datetime(
    df['Order Date & Time'],
    errors='coerce'
)

# -----> 14. Create Delivery Category Feature
def check_delivery(time):
    if time <= 30:
        return 'Fast'
    else:
        return 'Slow'

df['Delivery Category'] = df['Delivery Time (Minutes)'].apply(check_delivery)

# -----> 15. Preview Updated Dataset
df.head()

# -----> 16. Rename Columns for Analysis
df.rename(columns={
    'Order ID': 'order_id',
    'Customer ID': 'customer_id',
    'Order Date & Time': 'order_date_&_time',
    'Delivery Time (Minutes)': 'delivery_time_minutes',
    'Product Category': 'product_category',
    'Order Value (INR)': 'order_value_INR',
    'Customer feedback': 'customer_feedback',
    'Service Rating': 'service_rating',
    'Delivery Delay': 'delivery_delay',
    'Refund Requested': 'refund_requested',
    'Delivery Category': 'delivery_category'
}, inplace=True)

# -----> 17. Export Cleaned Dataset
df.to_csv("ecommerce_cleaned_final.csv", index=False)