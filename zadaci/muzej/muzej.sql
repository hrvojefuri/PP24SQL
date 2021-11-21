drop database if exists muzej;
create database muzej;

# c:\xampp\mysql\bin -uedunova -pedunova --default_character_set=utf8 < C:\Users\hrvoj\Desktop\PP24SQL\zadaci\muzej\muzej.sql

use muzej;

create table kustos (
    sifra   int not null primary key auto_increment,
    osoba   int not null
);

create table izlozba (
    sifra       int not null primary key auto_increment,
    kustos      int not null,
    sponzor     int not null
);

create table djelo (
    sifra       int not null primary key auto_increment,
    naziv       varchar(50) not null,
    izlozba     int not null
);

create table sponzor (
    sifra   int not null primary key auto_increment,
    osoba   int not null,
    iznos   decimal(18,2)
);

create table osoba (
    sifra       int not null primary key auto_increment,
    ime         varchar(50) not null,
    prezime     varchar(50) not null
);

alter table kustos add foreign key (osoba) references osoba(sifra);

alter table izlozba add foreign key (kustos) references kustos(sifra);
alter table izlozba add foreign key (sponzor) references sponzor(sifra);

alter table djelo add foreign key (izlozba) references izlozba(sifra);

alter table sponzor add foreign key (osoba) references osoba(sifra);