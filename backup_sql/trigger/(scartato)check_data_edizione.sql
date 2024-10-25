drop trigger if exists check_data_edizione on edizione_progetto;
drop function if exists check_data_edizione();

create function check_data_edizione() returns trigger as $BODY$
begin
	if(new.data_fine - current_date<0) then
		raise exception 'progetto gia finito';
	end if;
	return new;
end $BODY$ language plpgsql;

create trigger check_data_edizione
after insert on edizione_progetto
for each  row execute procedure check_data_edizione();

