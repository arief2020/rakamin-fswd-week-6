-- Database: db_barang

-- DROP DATABASE IF EXISTS db_barang;

CREATE DATABASE db_barang
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
CREATE TABLE kategori (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE barang (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
  	stock INTEGER,
  	price INTEGER,
  	kategori_id INTEGER references kategori(id),
  	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO kategori( name ) 
		VALUES 
		( 'cloth' );

INSERT INTO kategori( name ) 
		VALUES 
		('watch'),
		('mainan'),
		('fruits');
		
INSERT INTO barang( name, stock, price, kategori_id ) 
		VALUES 
		( 'baju presiden', 2, 20000000, 1 );

INSERT INTO barang( name, stock, price, kategori_id ) 
		VALUES 
		( 'mainan', 20, 100000, 3),
		('jam tangan prancis', 6, 10000000, 2);

UPDATE kategori SET name = 'toy', updated_at = CURRENT_TIMESTAMP WHERE name = 'mainan';
UPDATE barang SET name = 'baju limited edition', updated_at = CURRENT_TIMESTAMP WHERE name = 'baju presiden';

UPDATE barang SET name = 'kids toy', updated_at = CURRENT_TIMESTAMP WHERE name = 'mainan';

DELETE FROM barang WHERE name = 'kids toy';

DELETE FROM kategori WHERE name = 'toy';

select * from barang;
select * from kategori;
select barang.name AS nama_barang, 
	barang.stock AS stock_barang, barang.price AS harga_barang, 
	kategori.name AS kategori_barang FROM barang 
	InNER JOIN kategori ON barang.kategori_id = kategori.id;
	
--study or training
--delete all data in table
truncate table kategori, barang;

--delete table
drop table kategori;

-- add constraint unique
ALTER TABLE kategori
ADD CONSTRAINT uk_kategori_name UNIQUE (name);

	