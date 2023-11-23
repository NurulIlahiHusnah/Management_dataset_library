# Enhancing Database Library Management through Trigger Concepts
"Despite the existing database library management system, the current framework lacks the integration of trigger concepts, leading to suboptimal operational efficiency and potential data integrity issues. The absence of trigger mechanisms hinders the system's ability to respond dynamically to changing conditions, impacting the overall performance and security of the library database. This problem statement seeks to address these shortcomings by exploring and implementing trigger concepts within the library management system to enhance its functionality, ensure data security, and improve overall efficiency in providing library services."

![libraries](https://github.com/NurulIlahiHusnah/Management_dataset_library/assets/125198828/a987aead-7d2f-4643-af03-4ae964762d49)


## Features
Prepared Data, create five table frames, namely:
- Member Table
- Book Data Table
- Librarian Data Table
- Table of Book Borrowing Details
- Book Loan Table
- Return Table

tools = PosgreSql and Dbeaver


After creating a table frame, input data information based on the requirements of each table frame. Next, generate an Entity-Relationship Diagram (ERD) for the database system design, illustrating detailed relationships between objects and entities.

The following depicts the ERD diagram:

![ERD Library](https://github.com/NurulIlahiHusnah/Management_dataset_library/assets/125198828/971f1fa1-d017-43df-9865-387cd41cc61c)



Insert triggers into multiple tables, specifically the loan, borrowing, and return detail tables. To synchronize the tables and prevent errors in data input, utilize the following query snippet:

    create or replace function update_total_buku()
    returns trigger as $$
    begin 
	''    ''
	return new;
    end;
    $$ language plpgsql;

    create trigger update_tot_buku
    before insert or update on pinjam 
    for each row 
    execute function update_total_buku();


After implementing the trigger concept, when new input is received, the trigger mechanism will automatically operate to finalize and adjust the input.

## 🔗 Links
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/nurul-ilahi-husnah27/)

