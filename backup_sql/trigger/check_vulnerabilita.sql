drop trigger if exists check_vulnerabilita on edizione_progetto;
drop function if exists check_vulnerabilita;

create function check_vulnerabilita() returns trigger as $BODY$
begin
	if(exists(select * from progetto where codice=new.progetto and tipologia='Vulnerabilita' and tipo_vulnerabilita='Disabilita')) then
	   if(select ospitalita_disabili from struttura_alloggiativa where new.struttura=cis) then
	   		return new;
		else
			raise exception 'struttura non in grado di ospitare disabili';
	   end if;
	end if;
	return new;
end $BODY$ language plpgsql;	   

create trigger check_vulnerabilita
after insert on edizione_progetto
for each row execute procedure check_vulnerabilita();