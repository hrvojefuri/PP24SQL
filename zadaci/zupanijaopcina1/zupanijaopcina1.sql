drop database if exists zupanijaopcina1;
create database zupanijaopcina1 character set utf8;

# c:\xampp\mysql\bin -uedunova -pedunova --default_character_set=utf8 < C:\Users\hrvoj\Desktop\PP24SQL\zadaci\zupanijaopcina1\zupanijaopcina1.sql

use zupanijaopcina1;

create table zupanija (
    sifra   int not null primary key auto_increment,
    naziv   varchar(50) not null,
    zupan   varchar(50)
);

create table opcina (
    sifra       int not null primary key auto_increment,
    zupanija    int not null,
    naziv       varchar(50)
);

alter table opcina add foreign key (zupanija) references zupanija(sifra);