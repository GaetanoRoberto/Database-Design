drop trigger if exists check_partecipazione_rif on partecipazione;
drop function if exists check_partecipazione_rif();

create function check_partecipazione_rif() returns trigger as $BODY$
begin
	
	if(exists(select * from partecipazione join edizione_progetto on edizione_progetto=codice where rifugiato=new.rifugiato and (data_fine-current_date>0))) then
	   raise exception 'rifugiato già assegnato a un progetto';
	end if;
	return new;
end $BODY$ language plpgsql;
create trigger check_partecipazione_rif
after insert on partecipazione 
for each row execute procedure check_partecipazione_rif();



