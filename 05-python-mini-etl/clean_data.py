import pandas as pd

INPUT = "raw_data.csv"              # raw input file (to be added later)
OUTPUT = "clean_data_cleaned.csv"   # cleaned export

def coerce_numeric(df, cols):
    """Convert selected columns to numeric with safe coercion."""
    for c in cols:
        df[c] = pd.to_numeric(df[c], errors="coerce").fillna(0).astype(int)
    return df

def main():
    # Load raw file
    df = pd.read_csv(INPUT)

    # Standardize column names
    df.columns = [c.strip().lower().replace(" ", "_") for c in df.columns]

    # Required columns
    required = [
        "date", "county_fips", "county_name", "state",
        "cases", "tests", "positive", "hospitalizations", "deaths", "age_group"
    ]
    missing = [c for c in required if c not in df.columns]
    if missing:
        raise ValueError(f"Missing columns in input: {missing}")

    # Trim string columns
    for c in ["county_fips", "county_name", "state", "age_group"]:
        df[c] = df[c].astype(str).strip()

    # Convert date column
    df["date"] = pd.to_datetime(df["date"], errors="coerce")
    df = df.dropna(subset=["date"])  # drop rows with invalid dates
    df["date"] = df["date"].dt.date  # convert to date object

    # Convert numeric fields
    numeric_cols = ["cases", "tests", "positive", "hospitalizations", "deaths"]
    df = coerce_numeric(df, numeric_cols)

    # Remove duplicates
    df = df.drop_duplicates(subset=["date", "county_fips", "age_group"])

    # Add month column for downstream analysis
    df["month"] = pd.to_datetime(df["date"]).to_period("M").astype(str)

    # Sanity checks
    df = df[df["cases"] >= 0]
    df = df[df["tests"] >= 0]
    df = df[df["positive"] >= 0]

    # Save cleaned file
    df.to_csv(OUTPUT, index=False)
    print(f"✅ Cleaning complete. Saved {len(df)} rows → {OUTPUT}")

if __name__ == "__main__":
    main()
