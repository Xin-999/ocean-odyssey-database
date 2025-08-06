Readme

# RunCarnivalDB – Relational + MongoDB Database Project

A full-stack database project simulating the backend of a public running event system. It includes designing, building, and querying both **relational (Oracle SQL)** and **non-relational (MongoDB)** databases — all from scratch.

This project is split into two major phases:
- 📁 **Phase 1: Conceptual → Logical → Physical DB Design** (Cruise company system)
- 🗂️ **Phase 2: Schema creation, data loading, SQL transactions, analytics & MongoDB** (Running carnival system)

---

## 🧱 Project Structure

```txt
📦 Ocean odyssesy cruise database
├── ass1/                    # Phase 1: Cruise database design
   ├── oo_assumptions.pdf        # List of assumptions made during design
   ├── oo_conceptual.pdf         # Conceptual ERD (Crow’s Foot notation)
   ├── oo_logical.pdf            # Logical schema (3NF)
   ├── oo_model.zip              # Zipped model files (Lucidchart or SQL DDL)
   ├── oo_normalisation.pdf      # UNF → 1NF → 2NF → 3NF steps
   ├── oo_schema.sql             # SQL DDL script (CREATE TABLE, constraints)
   ├── oo_schema_output.txt      # SQL execution log / output
   └── oo_model/                 # Folder containing model support files

├── ass2/                    # Phase 2: RunCarnival event system
   ├── T1-rm-schema.sql           # Add missing tables and constraints
   ├── T2-rm-insert.sql           # Insert test data into COMPETITOR, ENTRY, TEAM
   ├── T3-rm-dm.sql               # DML: update, delete, transaction logic
   ├── T4-rm-mods.sql             # Data modifications with commit/rollback
   ├── T5-rm-select.sql           # Advanced SELECT queries and reporting
   ├── T6-rm-json.sql             # Export SQL data to JSON format
   ├── T6-rm-mongo.mongodb.js     # Import JSON into MongoDB and run aggregations
   ├── rm-schema-insert.sql       # Initial base insert (e.g. student info)
```
---

## 🔍 Highlights

### ✅ SQL Features
- Hand-coded `CREATE TABLE`, `ALTER`, `CONSTRAINTS`
- Insert, update, delete statements using realistic mock data
- Query development using **inner joins**, **grouping**, **aggregation**, and **subqueries**
- Transaction-safe logic with `COMMIT`, `ROLLBACK`, `SAVEPOINT`
- Use of sequences to generate primary keys

### 🌐 MongoDB Integration
- Exported structured JSON from SQL data
- MongoDB insert, filter, and update operations using the shell
- Created and queried team documents with nested data for each member’s event entry

### 📊 Data Design Practices
- Designed real-world datasets simulating events, teams, competitors, and charities
- Used both hardcoded and calculated attributes (e.g., elapsed time, percent allocations)
- Ensured data constraints (e.g., unique phone numbers, valid team reuse logic)

---

## 💡 What I Learned

- Translating real-world business rules into normalized relational models
- Writing and testing advanced SQL queries in Oracle
- Handling transaction-safe logic across related tables
- Migrating structured relational data into JSON and MongoDB
- Managing Git version control with meaningful commit history

---

## 🧪 How to Run

1. Open SQL scripts with Oracle SQL Developer or any PL/SQL-compatible IDE
2. Run scripts in this order:
   - `rm-schema-insert.sql` (provided)
   - `T1-rm-schema.sql`
   - `T2-rm-insert.sql`
   - `T3-rm-dm.sql`, `T4-rm-mods.sql`, `T5-rm-select.sql`
3. Open Mongo shell and run:
   - `T6-rm-json.sql` to generate JSON
   - `T6-rm-mongo.js` to create, insert, and query MongoDB

---

## 📄 License

This project is for learning and showcase purposes only. No proprietary data or credentials included.

