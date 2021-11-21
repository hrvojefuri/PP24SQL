drop database if exists urarsilvija;
create database urarsilvija;

# c:\xampp\mysql\bin -uedunova -pedunova --default_character_set=utf8 < C:\Users\hrvoj\Desktop\PP24SQL\zadaci\urarsilvija\urarsilvija.sql

use urarsilvija;

create table popravak (
    sifra   int not null primary key auto_increment,
    satovi  int not null,
    segrt   int not null
);

create table satovi (
    sifra       int not null primary key auto_increment,
    korisnik    int not null,
    sat         int not null
);

create table sat (
    sifra   int not null primary key auto_increment,
    satovi  int not null,
    model   varchar(50)
);

create table urar (
    sifra   int not null primary key auto_increment,
    osoba   int not null
);

create table korisnik (
    sifra   int not null primary key auto_increment,
    osoba   int not null,
    urar    int not null
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

alter table popravak add foreign key (satovi) references satovi(sifra);
alter table popravak add foreign key (segrt) references segrt(sifra);

alter table satovi add foreign key (korisnik) references korisnik(sifra);

alter table sat add foreign key (satovi) references satovi(sifra);

alter table korisnik add foreign key (osoba) references osoba(sifra);
alter table korisnik add foreign key (urar) references urar(sifra);

alter table segrt add foreign key (osoba) references osoba(sifra);