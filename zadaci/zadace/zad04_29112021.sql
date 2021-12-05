drop database if exists zad04_29112021;
create database zad04_29112021;

# c:\xampp\mysql\bin -uedunova -pedunova --default_character_set=utf8 < C:\Users\hrvoj\Desktop\PP24\PP24SQL\zadaci\zadace\zad04_29112021.sql

use zad04_29112021;

create table prijatelj (
    sifra   int not null primary key auto_increment,
    eura    decimal(16,9),
    prstena int not null,
    gustoca decimal(16,5),
    jmbag   char(11) not null,
    suknja  varchar(47) not null,
    becar   int not null
);

create table becar (
    sifra           int not null primary key auto_increment,
    novcica         decimal(14,8),
    kratkamajica    varchar(48) not null,
    bojaociju       varchar(36) not null,
    snasa           int not null
);

create table snasa (
    sifra       int not null primary key auto_increment,
    introvertno bit,
    treciputa   datetime,
    haljina     varchar(44) not null,
    zena        int not null
);

create table zena (
    sifra   int not null primary key auto_increment,
    suknja  varchar(39) not null,
    lipa    decimal(18,7),
    prstena int not null
);

create table zena_mladic (
    sifra   int not null primary key auto_increment,
    zena    int not null,
    mladic  int not null
);

create table mladic (
    sifra       int not null primary key auto_increment,
    kuna        decimal(15,9),
    lipa        decimal(18,5),
    nausnica    int,
    stilfrizura varchar(49),
    vesta       varchar(34) not null
);

create table punac (
    sifra       int not null primary key auto_increment,
    treciputa   datetime,
    majica      varchar(46),
    jmbag       char(11) not null,
    novcica     decimal(18,7) not null,
    maraka      decimal(12,6) not null,
    ostavljen   int not null
);

create table ostavljen (
    sifra           int not null primary key auto_increment,
    modelnaocala    varchar(43),
    introvertno     bit,
    kuna            decimal(14,10)
);

alter table prijatelj add foreign key (becar) references becar(sifra);

alter table becar add foreign key (snasa) references snasa(sifra);

alter table snasa add foreign key (zena) references zena(sifra);

alter table zena_mladic add foreign key (zena) references zena(sifra);
alter table zena_mladic add foreign key (mladic) references mladic(sifra);

alter table punac add foreign key (ostavljen) references ostavljen(sifra);


# zadatak 4_1

# tablice becar, snasa i zena_mladic unesite po 3 retka.

select * from becar;
select * from snasa;
select * from zena_mladic;
select * from mladic;
select * from zena;

insert into zena(sifra,suknja,lipa,prstena) values
(null,'crvena',164.79,12),
(null,'žuta',64.79,1),
(null,'plava',1264.79,52);

insert into mladic (sifra,kuna,lipa,nausnica,stilfrizura,vesta) values
(null,1824.61,529.88,15,'vojna','siva'),
(null,824.61,59.88,5,'talijanka','crna'),
(null,84.61,5.88,25,'duga','plava');

insert into zena_mladic (sifra,zena,mladic) values
(null,1,1),
(null,2,2),
(null,3,3);

insert into snasa (sifra,introvertno,treciputa,haljina,zena) values
(null,1,'2021-08-09','crvena',1),
(null,0,'2021-05-21','plava',2),
(null,0,'2021-01-17','žuta',3);

insert into becar (sifra,novcica,kratkamajica,bojaociju,snasa) values
(null,154.90,'Overkill','plava',1),
(null,14.90,'Metallica','smeđa',2),
(null,1524.90,'Tankard','zelena',3);


# zadatak 4_2

# U tablici punac postavite svim zapisima kolonu majica na vrijednost Osijek.

select * from punac;
select * from ostavljen;

insert into ostavljen (sifra,modelnaocala,introvertno,kuna) values
(null,'Rayban',0,154.62),
(null,'Police',1,54.62),
(null,'Police',1,1254.62);

insert into punac (sifra,treciputa,majica,jmbag,novcica,maraka,ostavljen) values
(null,'2021-10-21','Sodom','12345678901',154.37,621.15,1),
(null,'2021-12-27','Destruction','23456789012',54.37,61.15,2),
(null,'2021-07-03','Tankard','34567890123',4.37,6.15,3);

update punac set majica='Osijek';


# zadatak 4_3

# U tablici prijatelj obrišite sve zapise čija je vrijednost kolone prstena veće od 17.

select * from prijatelj;

insert into prijatelj (sifra,eura,prstena,gustoca,jmbag,suknja,becar) values
(null,128.19,24,82.4,'12345678901','crvena',1),
(null,18.19,2,182.4,'23456789012','plava',2),
(null,1280.19,36,182.4,'34567890123','siva',3);

delete from prijatelj where prstena > 17;


# zadatak 4_4

# Izlistajte haljina iz tablice snasa uz uvjet da vrijednost kolone treciputa nepoznate.

select haljina from snasa where treciputa is null;


# zadatak 4_5

# Prikažite nausnica iz tablice mladic, jmbag iz tablice prijatelj te kratkamajica iz tablice becar uz uvjet da su vrijednosti kolone 
# treciputa iz tablice snasa poznate te da su vrijednosti kolone lipa iz tablice zena različite od 29. Podatke posložite po kratkamajica 
# iz tablice becar silazno.

select a.nausnica, f.jmbag, e.kratkamajica
from mladic a
inner join zena_mladic b on b.mladic=a.sifra 
inner join zena c on c.sifra=b.zena 
inner join snasa d on d.zena=c.sifra 
inner join becar e on e.snasa=d.sifra 
inner join prijatelj f on f.becar=e.sifra
where d.treciputa is not null and c.lipa != 29
order by e.kratkamajica desc;

# zadatak 4_6

# Prikažite kolone lipa i prstena iz tablice zena čiji se primarni ključ ne nalaze u tablici zena_mladic.

select lipa, prstena from zena where sifra not in (select distinct sifra from zena_mladic);