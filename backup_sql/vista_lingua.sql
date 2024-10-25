create view conoscenza_lingua(lingua,num_rifugiato) as
	select lingua,count(*) as num_rifugiati
	from conoscenza
	group by lingua;

select lingua
from conoscenza_lingua
where num_rifugiato = (select max(num_rifugiato) from conoscenza_lingua)