drop database if exists postolar;
create database postolar;

# c:\xampp\mysql\bin -uedunova -pedunova --default_character_set=utf8 < C:\Users\hrvoj\Desktop\PP24\PP24SQL\zadaci\postolar\postolar.sql

use postolar;

create table popravak (
    sifra       int not null primary key auto_increment,
    obuca       int not null,
    segrt       int not null
);

create table obuca (
    sifra           int not null primary key auto_increment,
    korisnik        int not null
);

create table komadobuce (
    sifra   int not null primary key auto_increment,
    opis    varchar(50),
    obuca   int
);

create table postolar (
    sifra   int not null primary key auto_increment,
    osoba   int not null
);

create table korisnik (
    sifra       int not null primary key auto_increment,
    osoba       int not null,
    postolar    int not null
);

create table segrt (
    sifra int not null primary key auto_increment,
    osoba int not null
);

create table osoba (
    sifra       int not null primary key auto_increment,
    ime         varchar(50) not null,
    prezime     varchar(50) not null
);

alter table popravak add foreign key (obuca) references obuca(sifra);
alter table popravak add foreign key (segrt) references segrt(sifra);

alter table obuca add foreign key (korisnik) references korisnik(sifra);

alter table komadobuce add foreign key (obuca) references obuca(sifra);

alter table korisnik add foreign key (osoba) references osoba(sifra);
alter table korisnik add foreign key (postolar) references postolar(sifra);

alter table postolar add foreign key (osoba) references osoba(sifra);

alter table segrt add foreign key (osoba) references osoba(sifra);