
## Architecture Recommendation

A Data Lakehouse architecture is the most suitable choice for this fast-growing food delivery startup.

Firstly, the startup handles diverse data types, including structured data (payment transactions), semi-structured data (GPS logs), and unstructured data (customer reviews and menu images). A traditional data warehouse is not well-suited for unstructured data, whereas a data lakehouse can store all formats in a unified system while still enabling structured querying.

Secondly, the startup requires both real-time and batch processing capabilities. Real-time analytics are needed for tracking delivery locations and monitoring operations, while batch processing is required for analyzing customer behavior, order trends, and business performance. A data lakehouse supports both workloads efficiently within the same architecture.

Thirdly, scalability and cost efficiency are critical. A lakehouse leverages low-cost object storage, making it ideal for storing large volumes of data such as images and GPS logs. At the same time, it enables high-performance analytics using engines like DuckDB and Apache Spark.

Additionally, modern lakehouse systems support ACID transactions, schema enforcement, and data versioning. These features ensure data consistency, reliability, and governance, which are essential when dealing with financial transactions and customer data.

Overall, a data lakehouse provides the flexibility, scalability, and performance required to support the startup’s rapid growth and complex data ecosystem