drop database if exists teretana;
create database teretana;
use teretana;

create table smjer(
	sifra int not null primary key auto_increment,
	naziv varchar(50) not null,
	cijena decimal(18,2) not null,
	trajanje int not null
);

create table osoba(
	sifra int not null primary key auto_increment,
	ime varchar(50) not null,
	prezime varchar(50) not null,
	oib char(11),
	email varchar(50)
);

create table zaposlenik(
	sifra int not null primary key auto_increment,
	osoba int,
	iban varchar(32) not null
);

create table polaznik(
	sifra int not null primary key auto_increment,
	osoba int
);

create table clanarina(
	sifra int not null primary key auto_increment,
	smjer int,
	polaznik int,
	uplata boolean not null
);

alter table zaposlenik add foreign key (osoba) references osoba(sifra);

alter table polaznik add foreign key (osoba) references osoba(sifra);

alter table clanarina add foreign key (smjer) references smjer(sifra);
alter table clanarina add foreign key (polaznik) references polaznik(sifra);

insert into smjer(naziv, cijena, trajanje)
values('Kardio', 49.99, 30),('Leða/trbuh',49.99, 30),('Gornji dio tijela',59.99,30),('Noge',39.99,30);

insert into osoba(ime, prezime, oib, email)
values('Michael', 'Jordan', '3336669991', 'mjordan@email.com'),
('Heath', 'Ledger', '2224446667', 'hledger@email.com'),
('Michael', 'Caine', '1113335556', 'mcaine@email.com'),
('Anne', 'Hathaway', '1113332224', 'ahathaway@email.com'),
('Danijela', 'Martinoviæ', '7778886669', 'dmartinovic@email.com'),
('Raymond', 'Reddington', '1122332211', 'rred@email.com')
('Elizabeth', 'Keen', '1111122222', 'ekeen@email.com')
('Luka', 'Modric', '8768768765', 'lmodric@email.com')
('Ivan', 'Rakitic', '2102102105', 'irakitic@email.com')
('Juergen', 'Klopp', '1010101010', 'najboljitrener@email.com')
('Diogo', 'Jota', 'JOTA111111', 'djota@email.com')
('Bobby', 'Firmino', 'FIRMINO777', 'Rfirmino@email.com');

insert into zaposlenik(osoba, iban)
values(5,'HR11 2222 3333 4444 55'),(6, 'HR11 3333 4444 5555 66');

insert into polaznik(osoba)
values(4),(2),(1),(3);

insert into clanarina(smjer, polaznik, uplata)
values(2,2,1),
(4,3,0),
(1,4,0),
(3,1,1);

update osoba set email='petargraso@gmail.com' where prezime='Grašo';






