drop database if exists furiousvortex;
create database furiousvortex;

# c:\xampp\mysql\bin -uedunova -pedunova --default_character_set=utf8 < C:\Users\hrvoj\Desktop\PP24\PP24SQL\zavrsnirad\furiousvortex.sql

use furiousvortex;

create table kupac (
    sifra   int not null primary key auto_increment,
    osoba   int not null,
    adresa  int not null
);

create table osoba (
    sifra       int not null primary key auto_increment,
    ime         varchar(50) not null,
    prezime     varchar(50) not null,
    adresa      int not null,
    email       varchar(50)
);

create table adresa (
    sifra           int not null primary key auto_increment,
    ulica           varchar(50) not null,
    kucnibroj       varchar(5) not null,
    grad            varchar(50) not null,
    postanskibroj   char(5) not null
);

create table narudzba (
    sifra           int not null primary key auto_increment,
    kupac           int not null,
    iznos           decimal(18,2) not null,
    dostava         int not null,
    datumnarudzbe   datetime not null,
    placanje        int not null
);

create table dostava (
    sifra           int not null primary key auto_increment,
    adresadostave   int not null,
    dostavnasluzba  varchar(50) not null,
    datumdostave    datetime
);

create table adresadostave (
    sifra           int not null primary key auto_increment,
    ulica           varchar(50) not null,
    kucnibroj       varchar(5) not null,
    grad            varchar(50) not null,
    postanskibroj   char(5) not null
);

create table placanje (
    sifra int not null primary key auto_increment,
    vrsta varchar(50) not null,
    brojkartice char(16) not null,
    cvv char(3) not null
);

create table kosarica (
    sifra       int not null primary key auto_increment,
    narudzba    int not null,
    proizvod    int not null,
    kolicina    char(2) not null
);

create table proizvod (
    sifra           int not null primary key auto_increment,
    naziv           varchar(50) not null,
    kategorija      int not null,
    izvodac         int not null,
    cijena          decimal(18,2) not null,
    izdavackakuca   varchar(50) not null,
    zaliha          char(4) not null
);

create table izvodac (
    sifra   int not null primary key auto_increment,
    naziv   varchar(50) not null,
    web     varchar(50)
);

create table kategorija (
    sifra   int not null primary key auto_increment,
    naziv   varchar(50) not null
);

alter table kupac add foreign key (osoba) references osoba(sifra);
alter table kupac add foreign key (adresa) references adresa(sifra);

alter table narudzba add foreign key (kupac) references kupac(sifra);
alter table narudzba add foreign key (dostava) references dostava(sifra);
alter table narudzba add foreign key (placanje) references placanje(sifra);

alter table dostava add foreign key (adresadostave) references adresadostave(sifra);

alter table kosarica add foreign key (narudzba) references narudzba(sifra);
alter table kosarica add foreign key (proizvod) references proizvod(sifra);

alter table proizvod add foreign key (kategorija) references kategorija(sifra);
alter table proizvod add foreign key (izvodac) references izvodac(sifra);