drop database if exists samostan;
create database samostan;

# c:\xampp\mysql\bin -uedunova -pedunova --default_character_set=utf8 < C:\Users\hrvoj\Desktop\PP24SQL\zadaci\samostan\samostan.sql

use samostan;

create table svecenik (
    sifra       int not null primary key auto_increment,
    osoba       int not null,
    nadredeni   int not null
);

create table nadredeni (
    sifra int not null primary key auto_increment,
    osoba int not null
);

create table raspored (
    sifra       int not null primary key auto_increment,
    svecenik    int not null,
    posao       int not null,
    termin      datetime
);

create table posao (
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null
);

create table osoba (
    sifra       int not null primary key auto_increment,
    ime         varchar(50) not null,
    prezime     varchar(50) not null
);

alter table svecenik add foreign key (osoba) references osoba(sifra);
alter table svecenik add foreign key (nadredeni) references nadredeni(sifra);

alter table nadredeni add foreign key (osoba) references osoba(sifra);

alter table raspored add foreign key (svecenik) references svecenik(sifra);
alter table raspored add foreign key (posao) references posao(sifra);