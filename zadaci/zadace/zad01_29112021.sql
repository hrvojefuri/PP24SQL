drop database if exists zad01_29112021;
create database zad01_29112021;

# c:\xampp\mysql\bin -uedunova -pedunova --default_character_set=utf8 < C:\Users\hrvoj\Desktop\PP24\PP24SQL\zadaci\zadace\zad01_29112021.sql

use zad01_29112021;

create table cura (
    sifra       int not null  primary key auto_increment,
    novcica     decimal(16,5) not null,
    gustoca     decimal(18,6) not null,
    lipa        decimal(13,10),
    ogrlica     int not null,
    bojakose    varchar(38),
    suknja      varchar(36),
    punac       int
);

create table punac (
    sifra       int not null primary key auto_increment,
    ogrlica     int,
    gustoca     decimal(14,9),
    hlace       varchar(41) not null
);

create table mladic (
    sifra           int not null primary key auto_increment,
    suknja          varchar(50) not null,
    kuna            decimal(16,8) not null,
    drugiputa       datetime,
    asocijalno      bit,
    ekstorvertno    bit not null,
    dukserica       varchar(48) not null,
    muskarac        int
);

create table muskarac (
    sifra           int not null primary key auto_increment,
    bojaociju       varchar(50) not null,
    hlace           varchar(30),
    modelnaocala    varchar(43),
    maraka          decimal(14,5) not null,
    zena            int not null
);

create table zena (
    sifra           int not null primary key auto_increment,
    treciputa       datetime,
    hlace           varchar(46),
    kratkamajica    varchar(31) not null,
    jmbag           char(11) not null,
    bojaociju       varchar(39) not null,
    haljina         varchar(46),
    sestra          int not null
);

create table svekar (
    sifra       int not null primary key auto_increment,
    bojaociju   varchar(40) not null,
    prstena      int,
    dukserica   varchar(41),
    lipa        decimal(13,8),
    eura        decimal(12,7),
    majica      varchar(35)
);

create table sestra_svekar (
    sifra   int not null primary key auto_increment,
    sestra  int not null,
    svekar  int not null
);

create table sestra (
    sifra       int not null primary key auto_increment,
    introvertno bit,
    haljina     varchar(31) not null,
    maraka      decimal(16,6),
    hlace       varchar(46) not null,
    narukvica   int not null
);

alter table cura add foreign key (punac) references punac(sifra);

alter table mladic add foreign key (muskarac) references muskarac(sifra);

alter table muskarac add foreign key (zena) references zena(sifra);

alter table zena add foreign key (sestra) references sestra(sifra);

alter table sestra_svekar add foreign key (sestra) references sestra(sifra);
alter table sestra_svekar add foreign key (svekar) references svekar(sifra);

# zadatak 1_2

# U tablice muskarac, zena i sestra_svekar unesite po 3 retka.

select * from muskarac;
select * from zena;
select * from sestra;
select * from sestra_svekar;
select * from svekar;

insert into sestra (sifra,introvertno,haljina,maraka,hlace,narukvica) values
(null,0,'ljubičasta',1549.99,'tajice',7),
(null,1,'crna',199.65,'jeans',3),
(null,0,'cvjetna',529.99,'samt',12);

insert into zena (sifra,treciputa,hlace,kratkamajica,jmbag,bojaociju,haljina,sestra) values
(null,'2021-03-12','jeans','Tankard',12345678901,'zelena','',1),
(null,'2021-02-23','samt','Ramones',23456789012,'smeđa','cvjetna',2),
(null,'2021-10-03','tajice','Metallica',34567890123,'plava','',3);


insert into muskarac (sifra,bojaociju,hlace,modelnaocala,maraka,zena) values
(null,'plava','jeans','Police',289.99,1),
(null,'zelena','samt','Rayban',1289.99,2),
(null,'smeđa','trenirka','',589.99,3);

insert into svekar (sifra,bojaociju,prstena,dukserica,lipa,eura,majica) values
(null,'plava',8,'Adidas crna',149.59,56.99,'Overkill'),
(null,'zelena',2,'Nike plava',49.59,156.99,'Metalfest'),
(null,'smeđa',1,'Puma smeđa',1549.59,856.99,'Motorhead');

insert into sestra_svekar (sifra,sestra,svekar) values
(null,1,1),
(null,2,2),
(null,3,3);