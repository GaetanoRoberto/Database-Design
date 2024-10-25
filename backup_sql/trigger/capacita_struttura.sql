drop trigger if exists verifica_capacita on partecipazione;
drop function if exists verifica_capacita();

create function verifica_capacita() returns trigger as $BODY$
declare
	part integer;
	cap integer;
begin
	select numero_partecipanti into part from edizione_progetto where codice=new.edizione_progetto;
	select capienza into cap
		from struttura_alloggiativa join edizione_progetto on cis=struttura
		where codice=new.edizione_progetto;
	if((part)>cap) then --trigger per aggiornamento partecipanti creato prima, quindi viene eseguito prima
		raise exception 'struttura alloggiativa piena';
	end if;
	return new;
end $BODY$ language plpgsql;

create trigger verifica_capacita
after insert on partecipazione
for each row execute procedure verifica_capacita();
