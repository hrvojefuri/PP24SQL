drop database if exists djecjivrtic;
create database djecjivrtic;

# c:\xampp\mysql\bin -uedunova -pedunova --default_character_set=utf8 < C:\Users\hrvoj\Desktop\PP24\PP24SQL\zadaci\djecjivrtic\djecjivrtic.sql

use djecjivrtic;

create table odgajateljica (
    sifra           int not null primary key auto_increment,
    strucnasprema   int not null,
    osoba           int not null
);

create table strucnasprema (
    sifra           int not null primary key auto_increment,
    naziv           varchar(50) not null
);

create table skupina (
    sifra           int not null primary key auto_increment,
    naziv           varchar(50) not null,
    odgajateljica   int
);

create table dijete (
    sifra       int not null primary key auto_increment,
    osoba       int not null,
    skupina     int not null
);

create table osoba (
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null
);

alter table odgajateljica add foreign key (strucnasprema) references strucnasprema(sifra);
alter table odgajateljica add foreign key (osoba) references osoba(sifra);

alter table skupina add foreign key (odgajateljica) references odgajateljica(sifra);

alter table dijete add foreign key (osoba) references osoba(sifra);
alter table dijete add foreign key (skupina) references skupina(sifra);