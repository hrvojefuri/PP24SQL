drop database if exists taksisluzba;
create database taksisluzba;

# c:\xampp\mysql\bin -uedunova -pedunova --default_character_set=utf8 < C:\Users\hrvoj\Desktop\PP24\PP24SQL\zadaci\taksisluzba\taksisluzba.sql

use taksisluzba;

create table vozilo (
    sifra       int not null primary key auto_increment,
    vozac       int not null,
    brojvozila  char(3) not null
);

create table vozac (
    sifra   int not null primary key auto_increment,
    osoba   int not null
);

create table voznja (
    sifra   int not null primary key auto_increment,
    vozac   int not null,
    grupa   int not null
);

create table grupa (
    sifra         int not null primary key auto_increment,
    polaziste     varchar(50),
    odrediste     varchar(50)
);

create table putnik (
    sifra int not null primary key auto_increment,
    osoba int not null,
    grupa int not null
);

create table osoba (
    sifra       int not null primary key auto_increment,
    ime         varchar(50) not null,
    prezime     varchar(50) not null,
    oib         char(11)
);

alter table vozilo add foreign key (vozac) references vozac(sifra);

alter table vozac add foreign key (osoba) references osoba(sifra);

alter table voznja add foreign key (vozac) references vozac(sifra);
alter table voznja add foreign key (grupa) references grupa(sifra);

alter table putnik add foreign key (osoba) references osoba(sifra);
alter table putnik add foreign key (grupa) references grupa(sifra);