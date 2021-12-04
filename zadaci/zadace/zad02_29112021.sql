drop database if exists zad02_29112021;
create database zad02_29112021;

# c:\xampp\mysql\bin -uedunova -pedunova --default_character_set=utf8 < C:\Users\hrvoj\Desktop\PP24\PP24SQL\zadaci\zadace\zad02_29112021.sql

use zad02_29112021;

create table brat (
    sifra       int not null primary key auto_increment,
    suknja      varchar(47),
    ogrlica     int not null,
    asocijalno  bit not null,
    neprijatelj int not null
);

create table neprijatelj (
    sifra           int not null primary key auto_increment,
    majica          varchar(32),
    haljina         varchar(43) not null,
    lipa            decimal(16,8),
    modelnaocala    varchar(49) not null,
    kuna            decimal(12,6) not null,
    jmbag           char(11),
    cura            int
);

create table cura (
    sifra       int not null primary key auto_increment,
    haljina     varchar(33) not null,
    drugiputa   datetime not null,
    suknja      varchar(38),
    narukvica   int,
    introvertno bit,
    majica      varchar(40) not null,
    decko       int
);

create table decko (
    sifra           int not null primary key auto_increment,
    indiferentno    bit,
    vesta           varchar(34),
    asocijalno      bit not null
);

create table decko_zarucnica (
    sifra       int not null primary key auto_increment,
    decko       int not null,
    zarucnica   int not null
);

create table zarucnica (
    sifra           int not null primary key auto_increment,
    narukvica       int,
    bojakose        varchar(37) not null,
    novcica         decimal(15,9),
    lipa            decimal(15,8) not null,
    indiferentno    bit not null
);

create table svekar (
    sifra       int not null primary key auto_increment,
    stilfrizura varchar(48),
    ogrlica     int not null,
    asocijalno  bit not null
);

create table prijatelj (
    sifra           int not null primary key auto_increment,
    modelnaocala    varchar(37),
    treciputa       datetime not null,
    ekstrovertno    bit not null,
    prviputa        datetime,
    svekar          int not null
);

alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);

alter table neprijatelj add foreign key (cura) references cura(sifra);

alter table cura add foreign key (decko) references decko(sifra);

alter table decko_zarucnica add foreign key (decko) references decko(sifra);
alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);

alter table prijatelj add foreign key (svekar) references svekar(sifra);


# zadatak 1_1

# U tablice neprijatelj, cura i decko_zarucnica unesite po 3 retka

select * from neprijatelj;
select * from cura;
select * from decko_zarucnica;
select * from decko;
select * from zarucnica;

insert into decko (sifra,indiferentno,vesta,asocijalno) values
(null,0,'karirana',0),
(null,1,'prugasta',1),
(null,1,'šarena',1);

insert into cura (sifra,haljina,drugiputa,suknja,narukvica,introvertno,majica,decko) values
(null,'crvena','2021-03-07','plava',5,0,'Ramones',1),
(null,'crna','2021-10-03','smeđa',13,1,'Sex Pistols',2),
(null,'plava','2021-09-23','siva',20,1,'Anarchy',3);

insert into neprijatelj (sifra,majica,haljina,lipa,modelnaocala,kuna,jmbag,cura) values
(null,'Metallica','crna',149.86,'Rayban',364.28,'12345678901',1),
(null,'Tankard','plava',5149.86,'Police',4.28,'23456789012',2),
(null,'Pantera','siva',49.86,'Rayban',1364.28,'34567890123',3);

insert into zarucnica (sifra,narukvica,bojakose,novcica,lipa,indiferentno) values
(null,2,'crvena',154.73,2648.52,0),
(null,15,'smeđa',1254.73,648.52,1),
(null,26,'crna',14.73,28.52,1);

insert into decko_zarucnica (sifra,decko,zarucnica) values
(null,1,1),
(null,2,2),
(null,3,3);


# zadatak 2_2

# U tablici prijatelj postavite svim zapisima kolonu treciputa na vrijednost 30. travnja 2020.

select * from prijatelj;
select* from svekar;

insert into svekar (sifra,stilfrizura,ogrlica,asocijalno) values
(null,'vojna',13,0),
(null,'talijanka',3,1),
(null,'duga',62,0);

insert into prijatelj (sifra,modelnaocala,treciputa,ekstrovertno,prviputa,svekar) values
(null,'Rayban','2021-07-03',0,'2021-02-26',1),
(null,'Police','2021-10-21',0,'2021-08-13',2),
(null,'Rayban','2021-08-28',1,'2021-04-06',3);

update prijatelj set treciputa='2020-04-30';


# zadatak 2_3

# U tablici brat obrišite sve zapise čija je vrijednost kolone ogrlica različito od 14.

select * from brat;

insert into brat (sifra,suknja,ogrlica,asocijalno,neprijatelj) values
(null,'crvena',14,0,1),
(null,'plava',5,1,2),
(null,'siva',22,0,3);

delete from brat where ogrlica<>14;