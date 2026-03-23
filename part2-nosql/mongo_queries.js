// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
  {
    _id: "E1001",
    name: "Samsung 55-inch 4K Smart TV",
    category: "Electronics",
    brand: "Samsung",
    price: 45000,
    currency: "INR",
    stock: 25,
    specifications: {
      screen_size: "55 inch",
      resolution: "4K UHD",
      smart_tv: true,
      connectivity: ["WiFi", "Bluetooth", "HDMI", "USB"],
      voltage: "220-240V"
    },
    warranty: {
      period: "2 years",
      type: "Manufacturer",
      coverage: ["Parts", "Labor"]
    },
    ratings: { average: 4.5, reviews: 120 }
  },
  {
    _id: "C2001",
    name: "Men's Cotton Casual Shirt",
    category: "Clothing",
    brand: "Levi's",
    price: 1499,
    currency: "INR",
    stock: 100,
    sizes_available: ["S", "M", "L", "XL"],
    colors_available: ["Blue", "White", "Black"],
    material: "100% Cotton",
    care_instructions: [
      "Machine wash cold",
      "Do not bleach",
      "Iron at low temperature"
    ],
    fit: "Regular",
    ratings: { average: 4.2, reviews: 75 }
  },
  {
    _id: "G3001",
    name: "Organic Whole Wheat Flour",
    category: "Groceries",
    brand: "Aashirvaad",
    price: 320,
    currency: "INR",
    stock: 200,
    weight: "5 kg",
    expiry_date: new Date("2026-02-15"),
    manufacturing_date: new Date("2025-08-15"),
    nutritional_info: {
      calories_per_100g: 340,
      protein: "12g",
      carbohydrates: "72g",
      fiber: "10g"
    },
    ingredients: ["Whole Wheat"],
    storage_instructions: "Store in a cool and dry place",
    ratings: { average: 4.6, reviews: 210 }
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: new Date("2025-01-01") }
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { _id: "E1001" },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ category: 1 });

/*
Explanation:
Creating an index on the "category" field improves query performance,
especially for frequent queries like filtering products by category
(e.g., Electronics or Groceries). It reduces scan time by allowing MongoDB
to quickly locate matching documents instead of scanning the entire collection.
*/