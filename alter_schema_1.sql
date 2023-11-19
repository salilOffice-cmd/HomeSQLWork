-- Alter table schema and different ways



--1A. **Alter Column Name:**

   EXEC sp_rename 'YourTable.OldColumnName', 'NewColumnName', 'COLUMN';

--1B. **Alter Table Name:**
   EXEC sp_rename 'OldTableName', 'NewTableName';

--2. **Alter Column Data Type:**

   ALTER TABLE YourTable
   ALTER COLUMN YourColumn NEW_DATA_TYPE;



--3. **Drop Column:**

   ALTER TABLE YourTable
   DROP COLUMN YourColumn;



--4. **Add Column:**

   ALTER TABLE YourTable
   ADD YourColumn DATA_TYPE;



--5. **Drop Constraint:**

   ALTER TABLE YourTable
   DROP CONSTRAINT UniqueConstraintName;



--6. **Add Constraint:**

   ALTER TABLE YourTable
   Add CONSTRAINT UniqueConstraintName;



