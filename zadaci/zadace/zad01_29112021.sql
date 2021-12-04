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
    ekstrovertno    bit not null,
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


# zadatak 1_1

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


# zadatak 1_2

# U tablici cura postavite svim zapisima kolonu gustoca na vrijednost 15,77.

select * from cura;
select * from punac;

insert into punac (sifra,ogrlica,gustoca,hlace) values
(null,6,23.77,'jeans'),
(null,13,153.77,'trenirka'),
(null,6,9.77,'samt');

insert into cura (sifra,novcica,gustoca,lipa,ogrlica,bojakose,suknja,punac) values
(null,143.45,64.52,45.29,4,'crvena','kožna',1),
(null,589.45,123.52,845.29,18,'crna','jeans',2),
(null,4687.45,6.52,11.29,2,'smeđa','svilena',3);

update cura set gustoca=15.77;


# 1_3

# U tablici mladic obrišite sve zapise čija je vrijednost kolone kuna veće od 15,78.

select * from mladic;

insert into mladic (sifra,suknja,kuna,drugiputa,asocijalno,ekstrovertno,dukserica,muskarac) values
(null,'jeans',1469.32,'2021-07-03',1,0,'Adidas plava',1),
(null,'samt',1.32,'2021-10-21',0,1,'Nike crna',2),
(null,'trenirka',14.32,'2021-12-28',1,1,'Puma bijela',3);

delete from mladic where kuna>15.78;


# 1_4

# Izlistajte kratkamajica iz tablice zena uz uvjet da vrijednost kolone hlace sadrže slova ana.

select kratkamajica from zena where hlace like '%ana%';


# 1_5

# Prikažite dukserica iz tablice svekar, asocijalno iz tablice mladic te hlace iz tablice muskarac uz uvjet da su vrijednosti kolone hlace
# iz tablice zena počinju slovom a te da su vrijednosti kolone haljina iz tablice sestra sadrže niz znakova ba. Podatke posložite po hlace
# iz tablice muskarac silazno.

select a.dukserica, f.asocijalno, e.hlace
from svekar a
inner join sestra_svekar b on b.svekar=a.sifra
inner join sestra c on c.sifra=b.sestra
inner join zena d on d.sestra=c.sifra
inner join muskarac e on e.zena=d.sifra
inner join mladic f on f.muskarac=e.sifra
where d.hlace like 'a%' and c.haljina like '%ba%'
group by e.hlace desc;