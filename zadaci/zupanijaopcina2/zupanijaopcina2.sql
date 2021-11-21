drop database if exists zupanijaopcina2;
create database zupanijaopcina2 character set utf8;

# c:\xampp\mysql\bin -uedunova -pedunova --default_character_set=utf8 < C:\Users\hrvoj\Desktop\PP24SQL\zadaci\zupanijaopcina2\zupanijaopcina2.sql

use zupanijaopcina2;

create table zupan (
    sifra       int not null primary key auto_increment,
    ime         varchar(50),
    prezime     varchar(50)
);

create table zupanija (
    sifra   int not null primary key auto_increment,
    naziv   varchar(50) not null,
    zupan   int not null
);

create table opcina (
    sifra       int not null primary key auto_increment,
    zupanija    int not null,
    naziv       varchar(50) not null
);

create table mjesto (
    sifra   int not null primary key auto_increment,
    opcina  int not null,
    naziv   varchar(50) not null
);

alter table zupanija add foreign key (zupan) references zupan(sifra);

alter table opcina add foreign key (zupanija) references zupanija(sifra);

alter table mjesto add foreign key (opcina) references opcina(sifra);