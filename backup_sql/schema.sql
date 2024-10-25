drop table if exists ente cascade;
drop table if exists rifugiato cascade;
drop table if exists lingua cascade;
drop table if exists conoscenza cascade;
drop table if exists struttura_alloggiativa cascade;
drop table if exists progetto cascade;
drop table if exists edizione_progetto cascade;
drop table if exists corso cascade;
drop table if exists servizio cascade;
drop table if exists partecipazione cascade;
drop table if exists offerta cascade;
drop table if exists proposta cascade;
drop domain if exists dominioVulnerabilita cascade;

create domain dominioVulnerabilita as varchar(30)
default 'Nessuna vulnerabilita'
check (value in ('Disabilita', 'Donna in gravidanza', 'Minore non accompagnato', 'Nessuna vulnerabilita'));

create table ente(
	codice_fiscale varchar(11) primary key,
	denominazione varchar(60) not null,
	telefono varchar(13) not null,
	mail varchar(60) not null,
	nazione varchar(30) not null,
	citta varchar(30) not null
);

create table rifugiato(
	documento_identita varchar(9) primary key,
	nome varchar(100) not null,
	cognome varchar(100) not null,
	data_nascita date not null,
	sesso char(1) not null check(sesso = 'M' or sesso = 'F'),
	paese_provenienza varchar(30) not null,
	religione varchar(20) not null,
	titolo_studio varchar(100) default 'Nessun titolo',
	qualifica_professionale varchar(100) default 'Nessuna qualifica',
	vulnerabilita dominioVulnerabilita
);

create table lingua(
	nome varchar(30) primary key
);

create table conoscenza(
	lingua varchar(30) references lingua(nome) on update restrict on delete restrict,
	rifugiato varchar(10) references rifugiato(documento_identita) on update restrict on delete restrict deferrable initially deferred,
	primary key(lingua,rifugiato)
);

create table struttura_alloggiativa(
	cis varchar(19) primary key,
	nome varchar(100) not null,
	via varchar(200) not null,
	citta varchar(60) not null,
	capienza integer not  null,
	ospitalita_disabili boolean not null,
	mensa boolean not null
);

create table progetto(
	codice varchar(10) primary key,
	titolo varchar(50) not null,
	ambito varchar(50) not null,
	area_territoriale varchar(30) not null,
	tipologia varchar(30) not null check(tipologia = 'Ordinario' or tipologia = 'Vulnerabilita'),
	vulnerabilita dominioVulnerabilita,
	ente_assegnatario varchar(11) not null references ente(codice_fiscale) on update restrict on delete restrict,
	unique(titolo,ente_assegnatario)
);

create table edizione_progetto(
	codice varchar(12) primary key,
	progetto varchar(10) not null references progetto(codice) on update restrict on delete restrict,
	data_inizio date not null,
	data_fine date not null,
	numero_partecipanti integer not null,
	struttura varchar(19) not null references struttura_alloggiativa(cis) on update restrict on delete restrict,
	unique(data_inizio,progetto)
);

create table corso(
	codice varchar(10) primary key,
	descrizione varchar(500) not null,
	durata_ore integer not null,
	materia varchar(60) not null,
	qualifica_conseguita varchar(40) default 'Nessuna qualifica',
	rilascio_attestato boolean not null,
	luogo varchar(60) not null
);

create table servizio(
	codice varchar(10) primary key,
	tipologia varchar(50) not null,
	attivita varchar(100) not null,
	individuale boolean not null,
	luogo varchar(100) not  null
);

create table partecipazione(
	rifugiato varchar(10) references rifugiato(documento_identita) on update cascade on delete restrict,
	edizione_progetto varchar(12) references edizione_progetto(codice) on update restrict on delete restrict, 
	primary key(rifugiato, edizione_progetto)
);

create table offerta(
	servizio varchar(10) references servizio(codice) on update restrict on delete restrict, 
	edizione_progetto varchar(12) references edizione_progetto(codice) on update restrict on delete restrict deferrable initially deferred,
	primary key(servizio,edizione_progetto)
);

create table proposta(
	corso varchar(10) references corso(codice) on update restrict on delete restrict, 
	edizione_progetto varchar(12) references edizione_progetto(codice) on update restrict on delete restrict deferrable initially deferred,
	primary key(corso,edizione_progetto)
);























