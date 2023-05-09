drop database if exists gestionachat;

create database if not exists gestionachat;
use gestionachat;
# -----------------------------------------------------------------------------
#       table : client
# -----------------------------------------------------------------------------

create table if not exists client
 (
   codeclient smallint(1) not null auto_increment ,
   nom varchar(128) not null  ,
   email varchar(128) null  ,
   sexe char(2) not null  ,
   login varchar(128) not null  ,
   password varchar(128) not null  ,
   datenaiss datetime null  
   , primary key (codeclient) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       table : produit
# -----------------------------------------------------------------------------

create table if not exists produit
 (
   codeproduit smallint(1) not null auto_increment ,
   label varchar(128) not null  ,
   pu decimal(10,2) not null  ,
   qtestock integer(2) not null  ,
   qteseuil integer(2) not null  
   , primary key (codeproduit) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       table : acheter
# -----------------------------------------------------------------------------

create table if not exists acheter
 (
   codeclient smallint(1) not null auto_increment ,
   codeproduit smallint(1) not null  ,
   codeachat integer(2) not null  ,
   qte integer(2) not null  ,
   dateachat datetime not null  
   , primary key (codeclient,codeproduit,codeachat) 
 ) 
 comment = "";


# -----------------------------------------------------------------------------
#       creation des references de table
# -----------------------------------------------------------------------------


alter table acheter 
  add foreign key fk_acheter_client (codeclient)
      references client (codeclient) ;


alter table acheter 
  add foreign key fk_acheter_produit (codeproduit)
      references produit (codeproduit) ;

