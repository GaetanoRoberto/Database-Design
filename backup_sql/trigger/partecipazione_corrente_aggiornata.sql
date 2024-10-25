drop trigger if exists check_partecipazione_rif on partecipazione;
drop function if exists check_partecipazione_rif();

create function check_partecipazione_rif() returns trigger as $BODY$
begin
	
	if((select data_fine from edizione_progetto where codice=new.edizione_progetto)-current_date>0) then
		if(exists(select * from partecipazione join edizione_progetto on edizione_progetto=codice where rifugiato=new.rifugiato and codice<>new.edizione_progetto and (data_fine-current_date>0))) then
		   raise exception 'impossibile assegnare rifugiato % a progetto %',new.rifugiato,new.edizione_progetto;
		end if;
	end if;
	return new;
end $BODY$ language plpgsql;

create trigger check_partecipazione_rif
after insert on partecipazione 
for each row execute procedure check_partecipazione_rif();