drop database if exists furiousvortex;
create database furiousvortex;

# c:\xampp\mysql\bin -uedunova -pedunova --default_character_set=utf8 < C:\Users\hrvoj\Desktop\PP24\PP24SQL\zavrsnirad\furiousvortex.sql

use furiousvortex;

create table kupac (
    sifra           int not null primary key auto_increment,
    ime             varchar(50) not null,
    prezime         varchar(50) not null,
    ulica           varchar(50) not null,
    kucnibroj       varchar(5) not null,
    grad            varchar(50) not null,
    postanskibroj   char(5) not null,
    email           varchar(50)
);

create table narudzba (
    sifra           int not null primary key auto_increment,
    kupac           int not null,
    iznos           decimal(18,2) not null,
    datumnarudzbe   datetime not null,
    nacinplacanja   varchar(50) not null,
    dostavnasluzba  varchar(50) not null,
    datumdostave    datetime,
    isporuceno      boolean
);

create table kosarica (
    sifra       int not null primary key auto_increment,
    narudzba    int not null,
    proizvod    int not null,
    kolicina    char(2) not null,
    cijenasuma  decimal(18,2) not null
);

create table proizvod (
    sifra           int not null primary key auto_increment,
    zanr            int not null,
    izvodac         int not null,
    naziv           varchar(50) not null,
    cijena          decimal(18,2) not null,
    izdavackakuca   varchar(50) not null,
    naslovnica      varchar(50),
    zaliha          int not null
);

create table izvodac (
    sifra   int not null primary key auto_increment,
    naziv   varchar(50) not null,
    web     varchar(50)
);

create table zanr (
    sifra   int not null primary key auto_increment,
    naziv   varchar(50) not null
);

alter table narudzba add foreign key (kupac) references kupac(sifra);

alter table kosarica add foreign key (narudzba) references narudzba(sifra);
alter table kosarica add foreign key (proizvod) references proizvod(sifra);

alter table proizvod add foreign key (zanr) references zanr(sifra);
alter table proizvod add foreign key (izvodac) references izvodac(sifra);

# inserti u tablice 23_11_2021

# 1-4
insert into zanr values
(null,'Heavy Metal'),
(null,'Power Metal'),
(null,'Thrash Metal'),
(null,'Death Metal');

# 1-4
insert into izvodac values
(null,'Iron Maiden','https://www.ironmaiden.com/'),
(null,'Judas Priest','https://www.judaspriest.com/'),
(null,'Black Sabbath','https://www.blacksabbath.com/'),
(null,'Motorhead','https://imotorhead.com/'),
# 5-8
(null,'Blind Guardian','https://www.blind-guardian.com/'),
(null,'Helloween','https://www.helloween.org/'),
(null,'Gamma Ray','https://www.gammaray.org/en/'),
(null,'Manowar','https://manowar.com/'),
# 9-12
(null,'Metallica','https://www.metallica.com/'),
(null,'Megadeth','https://megadeth.com/'),
(null,'Slayer','https://www.slayer.net/'),
(null,'Anthrax','https://www.anthrax.com/'),
# 13-16
(null,'Morbid Angel','http://www.morbidangel.com/'),
(null,'Entombed','https://www.entombedad.com/'),
(null,'Suffocation','https://www.suffocationofficial.com/'),
(null,'Obituary','https://www.obituary.cc/');