----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------

-- membuat trigger kolom jumlah pinjam buku
create or replace function update_total_buku()
returns trigger as $$
begin 
	select 
		coalesce (
			coalesce(jml_buku1, 0) +
			coalesce(jml_buku2, 0) +
			coalesce(jml_buku3, 0) +
			coalesce(jml_buku4, 0) +
			coalesce(jml_buku5, 0) 
		,0)
	into new.jumlah_buku
	from
	detail_pinjam_buku
where 
	  id_buku_pinjam = NEW.id_buku_pinjam OR (NEW.id_buku_pinjam IS NULL AND id_buku_pinjam IS NULL);

	return new;
end;
$$ language plpgsql;

create trigger update_tot_buku
before insert or update on pinjam 
for each row 
execute function update_total_buku();


----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
-- membuat trigger untuk kolom tanggal pengembalian 
create or replace function update_tanggal_pengembalian()
returns trigger as $$ 
begin 
	new.tanggal_pengembalian := (select tanggal_pinjam + interval '3 days'
								from pinjam where id_pinjam= new.id_pinjam);
return new;
end;
$$ language plpgsql;

create trigger update_tanggal_pengembalian_trigger
before insert on pengembalian
for each row 
execute function update_tanggal_pengembalian();

--melakukan triger untuk kolom total_keterlambatan
CREATE OR REPLACE FUNCTION update_keterlambatan()
RETURNS TRIGGER AS $$
BEGIN
  NEW.total_keterlambatan := NEW.dikembalikan - NEW.tanggal_pengembalian;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_total_keterlambatan
BEFORE INSERT OR UPDATE ON pengembalian
FOR EACH ROW
EXECUTE FUNCTION update_keterlambatan();

-- membuat triger untuk total denda
create or replace function update_denda()
returns trigger as $$
begin 
	NEW.total_denda := (NEW.dikembalikan - NEW.tanggal_pengembalian)*10000;
  RETURN NEW;
end;
$$ language plpgsql;

create trigger update_total_denda_trigger
before insert or update on pengembalian 
for each row 
execute function update_denda();


----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------

