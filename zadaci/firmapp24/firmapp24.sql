drop database if exists firmapp24;
create database firmapp24;
# c:\xampp\mysql\bin -uedunova -pedunova --default_character_set=utf8 < C:\Users\hrvoj\Desktop\PP24\PP24SQL\zadaci\firmapp24\firmapp24.sql


use firmapp24;

create table projekt (
    sifra   int not null primary key auto_increment,
    naziv   varchar(50),
    cijena  decimal(18,2)
);

create table programer (
    sifra           int not null primary key auto_increment,
    ime             varchar(50),
    prezime         varchar(50),
    datumrodenja    datetime,
    placa           decimal(18,2)
);

create table sudjeluje (
    projekt         int,
    programer       int,
    datumpocetka    datetime,
    datumkraja      datetime
);

alter table sudjeluje add foreign key (projekt) references projekt(sifra);
alter table sudjeluje add foreign key (programer) references programer(sifra);