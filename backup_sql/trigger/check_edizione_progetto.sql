drop trigger if exists check_edizione on edizione_progetto;
drop function if exists check_edizione();

create function check_edizione() returns trigger as $BODY$
begin
	if(not exists(select * from offerta where edizione_progetto = new.codice) and
	  not exists(select * from proposta where edizione_progetto = new.codice)) then
		raise exception 'edizione progetto deve offrire almeno un corso o un servizio';
	end if;
	return new;
end $BODY$ language plpgsql;

create trigger check_edizione
after insert on edizione_progetto
for each row execute procedure check_edizione();

