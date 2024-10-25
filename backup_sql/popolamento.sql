INSERT INTO ente(codice_fiscale, denominazione, telefono, mail, nazione, regione, indirizzo) VALUES
('80000330656', 'Comune di Salerno','089662134', 'comunedisalerno@gmail.com', 'Italia', 'Campania', 'Via Roma 6, Salerno'),
('80000330723', 'Associazione Arcobaleno','+393248612339', 'associazionearcobaleno@gmail.com', 'Italia', 'Lombardia', 'Via Garibaldi 32, Milano'),
('80000456789', 'Restos du coeur','+333582367541', 'restosducoeur@gmail.com', 'Francia', 'Normandia', 'Rue des Vinaigraiers 44, Caen');

INSERT INTO lingua(nome) VALUES
('Italiano'),
('Francese'),
('Spagnolo'),
('Tedesco'),
('Arabo'),
('Ucraino'),
('Russo'),
('Inglese');

INSERT INTO conoscenza(lingua, rifugiato) VALUES
('Ucraino', 'IT3476889'),
('Inglese', 'IT3476889'),
('Russo', 'IT3476889'),
('Arabo', 'IT4512373'),
('Inglese', 'IT4512373'),
('Inglese', 'FR3256710');

INSERT INTO rifugiato(documento_identita, nome, cognome, data_nascita, sesso, paese_provenienza, religione, titolo_studio, vulnerabilita) VALUES
('IT3476889', 'Roman', 'Boyko', '12/05/1997', 'M', 'Ucraina', 'Cattolicesimo', 'Diploma', 'Disabilita');
INSERT INTO rifugiato(documento_identita, nome, cognome, data_nascita, sesso, paese_provenienza, religione, vulnerabilita) VALUES
('IT4512373', 'Aisha', 'Ahmed', '13/01/2012', 'F', 'Siria', 'Islam', 'Minore non accompagnato');
INSERT INTO rifugiato(documento_identita, nome, cognome, data_nascita, sesso, paese_provenienza, religione) VALUES
('FR3256710', 'Alfatih', 'Ali', '14/08/1990', 'M', 'Sudan', 'Islam');

INSERT INTO struttura_alloggiativa(cis, nome, indirizzo, citta, capienza, ospitalita_disabili, mensa) VALUES
('SA675421312S0000032', 'Residence Mare', 'Via Dante Alighieri 72', 'Salerno', 40, true, true),
('MI345412111S0000067', 'Hotel Marconi', 'Via Marconi 2', 'Milano', 37, true, true),
('NO658966512S0000021', 'CPH Denoyez', 'Rue Denoyez 21', 'Caen', 60, false, false);

INSERT INTO progetto(codice, titolo, ambito, area_territoriale, tipologia, tipo_vulnerabilita, ente_assegnatario) VALUES
('EU0x123456', 'No limits', 'Sociale', 'Sud Italia', 'Vulnerabilita', 'Disabilita', '80000330656'),
('EU0x762192', 'Bright future', 'Istruzione', 'Nord Italia', 'Vulnerabilita', 'Minore non accompagnato', '80000330723');
INSERT INTO progetto(codice, titolo, ambito, area_territoriale, tipologia, ente_assegnatario) VALUES
('EU0x540012', 'Restart', 'Lavorativo', 'Nord Francia', 'Ordinario', '80000456789');

INSERT INTO corso(codice, descrizione, durata_ore, materia, rilascio_attestato, locazione) VALUES
('c1', 'Corso di creatività artistica', 72, 'Arte', false, 'Associazione Art  - Salerno - Italia'),
('c2', 'Corso di narrativa in inglese', 48, 'Inglese', true, 'IC Giovanni Paolo II - Salerno - Italia'),
('c3', 'Corso di italiano base', 72, 'Italiano', true, 'Scuola Galileo - Milano - Italia'),
('c4', 'Corso di matematica base', 72, 'Matematica', true, 'Scuola Galileo - Milano - Italia'),
('c5', 'Corso di francese base', 72, 'Francese', true, 'Institut Lemmonier - Caen - Francia'),
('c6', 'Corso sui diritti del lavoratore', 48, 'Cittadinanza', false, 'Institut Lemmonier - Caen - Francia');
INSERT INTO corso(codice, descrizione, durata_ore, materia, qualifica_conseguita, rilascio_attestato, locazione) VALUES
('c7', 'Corso per operaio metalmeccanico', 200, 'Lavoro', 'Operaio base', true, 'Renault - Caen - Francia');

INSERT INTO servizio(codice, tipologia, attivita, individuale, locazione) VALUES
('s1', 'Sport', 'Pallacanestro in carrozzina', false, 'Asd Basket - Salerno - Italia'),
('s2', 'Assistenza', 'Seduta psicologica', true, 'Studio de Bellis - Angri - Italia'),
('s3', 'Sport', 'Varie attivita sportive', false, 'Centro sportivo - Pavia - Italia'),
('s4', 'Assistenza', 'Accoglienza in famiglia', false, 'Family first - Milano - Italia'),
('s5', 'Assistenza', 'Seduta psicologica', true, 'Scuola Galileo - Milano - Italia'),
('s6', 'Assistenza', 'Seduta psicologica', true, 'Anne Petite - Rouen - Francia'),
('s7', 'Assistenza', 'Inserimento lavorativo', false, 'Pole Employ - Caen - Francia'),
('s8', 'Assistenza', 'Assistenza legale per il lavoro', true, 'Cabinet pour le travail - Caen - Francia');

INSERT INTO proposta(corso, edizione_progetto) VALUES
('c1', 'EU0x123456.1'),
('c2', 'EU0x123456.1'),
('c1', 'EU0x123456.2'),
('c3', 'EU0x762192.1'),
('c4', 'EU0x762192.2'),
('c5', 'EU0x540012.1'),
('c6', 'EU0x540012.1'),
('c7', 'EU0x540012.2');

INSERT INTO offerta(servizio, edizione_progetto) VALUES
('s1', 'EU0x123456.2'),
('s2', 'EU0x123456.1'),
('s2', 'EU0x123456.2'),
('s3', 'EU0x762192.1'),
('s4', 'EU0x762192.1'),
('s3', 'EU0x762192.2'),
('s5', 'EU0x762192.2'),
('s6', 'EU0x540012.1'),
('s6', 'EU0x540012.2'),
('s7', 'EU0x540012.1'),
('s7', 'EU0x540012.2'),
('s8', 'EU0x540012.2');

INSERT INTO edizione_progetto(codice, progetto, data_inizio, data_fine, numero_partecipanti, struttura) VALUES
('EU0x123456.1', 'EU0x123456', '12/01/2019', '12/03/2019', 1, 'SA675421312S0000032'),
('EU0x123456.2', 'EU0x123456', '20/04/2019', '20/06/2019', 1, 'SA675421312S0000032'),
('EU0x762192.1', 'EU0x762192', '15/09/2020', '31/12/2020', 1, 'MI345412111S0000067'),
('EU0x762192.2', 'EU0x762192', '18/01/2021', '18/05/2021', 1, 'MI345412111S0000067'),
('EU0x540012.1', 'EU0x540012', '01/01/2022', '20/03/2022', 1, 'NO658966512S0000021'),
('EU0x540012.2', 'EU0x540012', '10/04/2022', '10/06/2022', 1, 'NO658966512S0000021');

INSERT INTO partecipazione(rifugiato, edizione_progetto) VALUES
('IT3476889', 'EU0x123456.1'),
('IT3476889', 'EU0x123456.2'),
('IT4512373', 'EU0x762192.1'),
('IT4512373', 'EU0x762192.2'),
('FR3256710', 'EU0x540012.1'),
('FR3256710', 'EU0x540012.2');

















