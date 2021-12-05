drop database if exists zad03_29112021;
create database zad03_29112021;

# c:\xampp\mysql\bin -uedunova -pedunova --default_character_set=utf8 < C:\Users\hrvoj\Desktop\PP24\PP24SQL\zadaci\zadace\zad0_29112021.sql

use zad03_29112021;

create table brat (
    sifra           int not null primary key auto_increment,
    jmbag           char(11),
    ogrlica         int not null,
    ekstrovertno    bit not null
);

create table prijatelj_brat (
    sifra       int not null primary key auto_increment,
    prijatelj   int not null,
    brat        int not null
);

create table prijatelj (
    sifra           int not null primary key auto_increment,
    kuna            decimal(16,10),
    haljina         varchar(37),
    lipa            decimal(13,10),
    dukserica       varchar(31),
    indiferentno    bit not null
);

create table ostavljena (
    sifra           int not null primary key auto_increment,
    kuna            decimal(17,5),
    lipa            decimal(15,6),
    majica          varchar(36),
    modelnaocala    varchar(31) not null,
    prijatelj       int
);

create table snasa (
    sifra           int not null primary key auto_increment,
    introvertno     bit,
    kuna            decimal(15,6) not null,
    eura            decimal(12,9) not null,
    treciputa       datetime,
    ostavljena      int not null
);

create table punica (
    sifra           int not null primary key auto_increment,
    asocijalno      bit,
    kratkamajica    varchar(44),
    kuna            decimal(13,8) not null,
    vesta           varchar(32) not null,
    snasa           int
);

create table cura (
    sifra       int not null primary key auto_increment,
    dukserica   varchar(49),
    maraka      decimal(13,7),
    drugiputa   datetime,
    majica      varchar(49),
    novcica     decimal(15,8),
    ogrlica     int not null
);

create table svekar (
    sifra       int not null primary key auto_increment,
    novcica     decimal(16,8) not null,
    suknja      varchar(44) not null,
    bojakose    varchar(36),
    prstena     int,
    narukvica   int not null,
    cura        int not null
);

alter table prijatelj_brat add foreign key (brat) references brat(sifra);
alter table prijatelj_brat add foreign key (prijatelj) references prijatelj(sifra);

alter table ostavljena add foreign key (prijatelj) references prijatelj(sifra);

alter table snasa add foreign key (ostavljena) references ostavljena(sifra);

alter table punica add foreign key (snasa) references snasa(sifra);

alter table svekar add foreign key (cura) references cura(sifra);


# zadatak 3_1

# U tablice snasa, ostavljena i prijatelj_brat unesite po 3 retka.

select * from snasa;
select * from ostavljena;
select * from prijatelj;
select * from brat;
select * from prijatelj_brat;

insert into prijatelj (sifra,kuna,haljina,lipa,dukserica,indiferentno) values
(null,1987.56,'crvena',168.97,'Adidas crna',1),
(null,15.56,'plava',68.97,'Nike plava',0),
(null,187.56,'žuta',16.97,'Puma siva',1);

insert into brat (sifra,jmbag,ogrlica,ekstrovertno) values
(null,'12345678901',153,0),
(null,'23456789012',13,1),
(null,'34567890123',3,0);

insert into prijatelj_brat (sifra,prijatelj,brat) values
(null,1,1),
(null,2,2),
(null,3,3);

insert into ostavljena (sifra,kuna,lipa,majica,modelnaocala,prijatelj) values
(null,1549.27,826.15,'crvena','Rayban',1),
(null,149.27,86.15,'plava','Police',2),
(null,19.27,1826.15,'žuta','Rayban',1);

insert into snasa (sifra,introvertno,kuna,eura,treciputa,ostavljena) values
(null,0,128.17,623.49,'2021-04-15',1),
(null,1,18.17,23.49,'2021-10-30',2),
(null,1,1258.17,23.49,'2021-07-22',3);


# zadatak 3_2

# U tablici svekar postavite svim zapisima kolonu suknja na vrijednost Osijek.

select * from svekar;
select * from cura;

insert into cura (sifra,dukserica,maraka,drugiputa,majica,novcica,ogrlica) values
(null,'Adidas crna',153.87,'2021-02-23','Ramones',269.13,26),
(null,'Nike plava',2153.87,'2021-03-07','Sank',1269.13,6),
(null,'Puma siva',53.87,'2021-10-20','Mortal Kombat',9.13,16);

insert into svekar (sifra,novcica,suknja,bojakose,prstena,narukvica,cura) values
(null,156.18,'plava','crna',15,3,1),
(null,56.18,'crvena','smeđa',5,23,2),
(null,1356.18,'siva','crvena',35,18,3);

update svekar set suknja='Osijek';