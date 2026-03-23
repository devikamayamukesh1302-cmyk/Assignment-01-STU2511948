## Storage Systems

The architecture uses multiple storage systems, each chosen based on the nature of the workload. A **data lake** (e.g., S3 or similar object storage) is used to store raw data from Electronic Health Records (EHR), billing systems, and ICU streaming devices. This allows flexible storage of structured and semi-structured data (CSV, JSON, Parquet) and supports both batch and streaming ingestion.

A **data warehouse** (e.g., Snowflake, BigQuery) is used for analytical workloads such as monthly reporting. It stores cleaned, structured, and aggregated data optimized for fast queries required by hospital management dashboards (e.g., bed occupancy and department costs).

A **feature store** is used to store machine learning features derived from historical data. This ensures consistency between training and inference for the readmission prediction model, improving model reliability.

For real-time ICU data, a **streaming platform** (e.g., Kafka) is used along with append-only storage in the data lake. This enables low-latency ingestion and supports real-time alerting systems.

Finally, a **serving layer** (warehouse or indexed storage) is used by the NLP/LLM system to retrieve patient history efficiently for doctor queries.

---

## OLTP vs OLAP Boundary

The OLTP (Online Transaction Processing) system consists of operational databases such as EHR and billing systems. These systems handle real-time transactions like patient updates, treatment records, and billing entries. They are optimized for fast inserts, updates, and consistency.

The OLAP (Online Analytical Processing) system begins at the data ingestion layer, where data is extracted from OLTP systems into the data lake. From this point onward, the system focuses on analytics, reporting, and machine learning. The data warehouse and feature store are part of the OLAP layer, supporting complex queries and aggregations.

This separation ensures that analytical workloads do not impact the performance of critical transactional systems, maintaining reliability in hospital operations.

---

## Trade-offs

A key trade-off in this design is between **real-time processing and system complexity**. Supporting real-time ICU monitoring requires streaming infrastructure (e.g., Kafka), which increases system complexity, operational overhead, and maintenance effort.

To mitigate this, a hybrid approach is used. Only critical ICU data required for alerts is processed in real time, while less time-sensitive data is processed in batch and stored in the data warehouse. Additionally, managed cloud services (e.g., managed Kafka or serverless processing tools) can be used to reduce operational burden.

This approach balances the need for timely alerts with system simplicity, ensuring scalability without excessive complexity.
