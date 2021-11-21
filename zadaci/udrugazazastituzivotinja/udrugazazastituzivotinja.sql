drop database if exists udrugazazastituzivotinja;
create database udrugazazastituzivotinja;

# c:\xampp\mysql\bin -uedunova -pedunova --default_character_set=utf8 < C:\Users\hrvoj\Desktop\PP24SQL\zadaci\udrugazazastituzivotinja\udrugazazastituzivotinja.sql

use udrugazazastituzivotinja;

create table osoba (
    sifra       int not null primary key auto_increment,
    ime         varchar(50),
    prezime     varchar(50)
);

create table sticenik (
    sifra       int not null primary key auto_increment,
    zivotinja   int not null,
    osoba       int not null
);

create table zivotinja (
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    vrsta varchar(50)
);

create table prostor (
    sifra       int not null primary key auto_increment,
    sticenik    int not null,
    oznaka      int not null
);

alter table sticenik add foreign key (zivotinja) references zivotinja(sifra);
alter table sticenik add foreign key (osoba) references osoba(sifra);

alter table prostor add foreign key (sticenik) references sticenik(sifra);