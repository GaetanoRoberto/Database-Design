drop trigger if exists aggiorna_partecipanti on partecipazione;
drop function if exists aggiorna_partecipanti();

create function aggiorna_partecipanti() returns trigger as $BODY$
declare
	c integer;
begin
	select count(*) into c from partecipazione where edizione_progetto=new.edizione_progetto;
	
	update edizione_progetto
	set numero_partecipanti=c
	where codice=new.edizione_progetto;
return new;
end $BODY$ language plpgsql;

create trigger aggiorna_partecipanti
after insert on partecipazione
for each row execute procedure aggiorna_partecipanti();