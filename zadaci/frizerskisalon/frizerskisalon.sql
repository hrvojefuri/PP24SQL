drop database if exists frizerskisalon;
create database frizerskisalon character set utf8;

# c:\xampp\mysql\bin -uedunova -pedunova --default_character_set=utf8 < C:\Users\hrvoj\Desktop\PP24\PP24SQL\zadaci\frizerskisalon\frizerskisalon.sql

use frizerskisalon;

create table djelatnica (
    sifra   int not null primary key auto_increment,
    osoba   int not null
);

create table korisnik (
    sifra   int not null primary key auto_increment,
    osoba   int not null
);

create table usluga (
    sifra   int not null primary key auto_increment,
    naziv   varchar(50) not null,
    cijena  decimal(18,2) not null
);

create table posjet (
    sifra       int not null primary key auto_increment,
    korisnik    int not null,
    usluga      int not null
);

create table termin (
    sifra           int not null primary key auto_increment,
    posjet          int not null,
    djelatnica      int not null,
    datumpocetka    datetime not null
);

create table osoba (
    sifra       int not null primary key auto_increment,
    ime         varchar(50) not null,
    prezime     varchar(50) not null
);

alter table djelatnica add foreign key (osoba) references osoba(sifra);

alter table korisnik add foreign key (osoba) references osoba(sifra);

alter table posjet add foreign key (korisnik) references korisnik(sifra);
alter table posjet add foreign key (usluga) references usluga(sifra);

alter table termin add foreign key (posjet) references posjet(sifra);
alter table termin add foreign key (djelatnica) references djelatnica(sifra);