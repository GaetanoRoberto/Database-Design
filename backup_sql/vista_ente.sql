drop view if exists proposta_enti;
create view proposta_enti(ente,num_corsi,vulnerabilita) as
	select denominazione,count(distinct corso),prog.tipo_vulnerabilita
	from ente join progetto prog on codice_fiscale=ente_assegnatario
		join edizione_progetto ed on prog.codice=ed.progetto
		join proposta prop on ed.codice=prop.edizione_progetto
		where prog.tipologia<>'Ordinario'
	group by codice_fiscale, prog.tipo_vulnerabilita ;
	
select vulnerabilita,ente,num_corsi
from proposta_enti tab
group by vulnerabilita,ente,num_corsi
having num_corsi >= all(select num_corsi from proposta_enti where vulnerabilita=tab.vulnerabilita)
