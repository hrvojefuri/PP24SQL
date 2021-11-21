#Ovo je komentar i ne utječe na izvođenje
drop database if exists edunovapp24;
create database edunovapp24 character set utf8;

# c:\xampp\mysql\bin -uedunova -pedunova --default_character_set=utf8 < C:\Users\hrvoj\Desktop\PP24SQL\zadaci\skriptapp24\skriptapp24.sql

use edunovapp24;

create table smjer (
    sifra           int not null primary key auto_increment,
    naziv           varchar(50) not null,
    trajanje        int not null,
    cijena          decimal(18,2),
    certificiran    boolean
);

create table osoba (
    sifra           int not null primary key auto_increment,
    ime             varchar(50) not null,
    prezime         varchar(50) not null,
    oib             char (11),
    email           varchar (50)
);

create table grupa (
    sifra           int not null primary key auto_increment,
    naziv           varchar(50) not null,
    smjer           int not null,
    predavac        int,
    datumpocetka    datetime
);

create table predavac (
    sifra           int not null primary key auto_increment,
    osoba           int not null,
    iban            varchar(50)
);

create table polaznik (
    sifra           int not null primary key auto_increment,
    osoba           int not null,
    brojugovora     varchar(50)
);

create table clan (
    grupa           int not null,
    polaznik        int not null
);


alter table grupa add foreign key (smjer) references smjer(sifra);
alter table grupa add foreign key (predavac) references predavac(sifra);

alter table predavac add foreign key (osoba) references osoba(sifra);

alter table polaznik add foreign key (osoba) references osoba(sifra);

alter table clan add foreign key (grupa) references grupa(sifra);
alter table clan add foreign key (polaznik) references polaznik(sifra);

