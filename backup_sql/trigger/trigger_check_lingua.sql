drop trigger if exists check_lingua on rifugiato;
drop function if exists lingua_rifugiato();

create function lingua_rifugiato() returns trigger as $BODY$
begin
if(not exists(select * from conoscenza where rifugiato = new.documento_identita)) then
raise exception 'Inserire lingua';
end if;
return new;
end
$BODY$ language plpgsql;

create trigger check_lingua
after insert on rifugiato
for each row execute procedure lingua_rifugiato();