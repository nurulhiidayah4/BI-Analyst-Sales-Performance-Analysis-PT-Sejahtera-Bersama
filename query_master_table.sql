SELECT 
    -- Membersihkan email
    c.CustomerEmail AS cust_email,
    c.CustomerCity AS cust_city,
    o.Date AS order_date,
    o.Quantity AS order_qty,
    p.ProdName AS product_name,
    p.Price AS product_price,
    cat.CategoryName AS category_name,
    -- Menghitung Total Sales (mengubah koma ke titik agar bisa dikali)
    (o.Quantity * CAST(REPLACE(p.Price, ',', '.') AS DECIMAL)) AS total_sales
FROM orders AS o
LEFT JOIN customers AS c ON o.CustomerID = c.CustomerID
LEFT JOIN products AS p ON o.ProdNumber = p.ProdNumber
LEFT JOIN product_category AS cat ON p.Category = cat.CategoryID
ORDER BY o.Date ASC;
