/*==============================================================*/
/* Nom de SGBD :  PostgreSQL 7.3                                */
/* Date de création :  02/03/2017 08:36:42                      */
/*==============================================================*/


drop index ADMINISTRATEUR_PK;

drop table ADMINISTRATEUR;

drop index CATEGORIE_PK;

drop table CATEGORIE;

drop index CLIENT_PK;

drop table CLIENT;

drop index EMBALLAGE_PK;

drop table EMBALLAGE;

drop index FACTURE_PK;

drop table FACTURE;

drop index EMBALLAGEFORMAT_FK;

drop index FORMAT_PK;

drop table FORMAT;

drop index PRODUIT_CATEGORIE_FK;

drop index PRODUIT_PK;

drop table PRODUIT;

drop index PRODUIT_EMBALLAGE2_FK;

drop index PRODUIT_EMBALLAGE_FK;

drop index PRODUIT_EMBALLAGE_PK;

drop table PRODUIT_EMBALLAGE;

drop index VENTE_PK;

drop table VENTE;

drop index VENTECLIENT2_FK;

drop index VENTECLIENT_FK;

drop index VENTECLIENT_PK;

drop table VENTECLIENT;

drop index VENTEPRODUIT2_FK;

drop index VENTEPRODUIT_FK;

drop index VENTEPRODUIT_PK;

drop table VENTEPRODUIT;

/*==============================================================*/
/* Table : ADMINISTRATEUR                                       */
/*==============================================================*/
create table ADMINISTRATEUR (
ID_ADMINISTRATEUR    INT2                 not null,
NOM_ADMINISTRATEUR   VARCHAR(200)         null,
PRENOM_ADMINISTRATEUR VARCHAR(200)         null,
constraint PK_ADMINISTRATEUR primary key (ID_ADMINISTRATEUR)
);

/*==============================================================*/
/* Index : ADMINISTRATEUR_PK                                    */
/*==============================================================*/
create unique index ADMINISTRATEUR_PK on ADMINISTRATEUR (
ID_ADMINISTRATEUR
);

/*==============================================================*/
/* Table : CATEGORIE                                            */
/*==============================================================*/
create table CATEGORIE (
ID_CATEGORIE         INT4                 not null,
NOM_CATEGORIE        VARCHAR(150)         null,
constraint PK_CATEGORIE primary key (ID_CATEGORIE)
);

/*==============================================================*/
/* Index : CATEGORIE_PK                                         */
/*==============================================================*/
create unique index CATEGORIE_PK on CATEGORIE (
ID_CATEGORIE
);

/*==============================================================*/
/* Table : CLIENT                                               */
/*==============================================================*/
create table CLIENT (
ID_CLIENT            INT4                 not null,
NOM_CLIENT           VARCHAR(200)         null,
PRENOM_CLIENT        VARCHAR(200)         null,
CIN_CLIENT           VARCHAR(12)          null,
NUMERO_CLIENT        VARCHAR(15)          null,
ADRESSE_CLIENT       VARCHAR(250)         null,
constraint PK_CLIENT primary key (ID_CLIENT)
);

/*==============================================================*/
/* Index : CLIENT_PK                                            */
/*==============================================================*/
create unique index CLIENT_PK on CLIENT (
ID_CLIENT
);

/*==============================================================*/
/* Table : EMBALLAGE                                            */
/*==============================================================*/
create table EMBALLAGE (
ID_EMBALLAGE         INT2                 not null,
NOM_EMBALLAGE        VARCHAR(200)         null,
constraint PK_EMBALLAGE primary key (ID_EMBALLAGE)
);

/*==============================================================*/
/* Index : EMBALLAGE_PK                                         */
/*==============================================================*/
create unique index EMBALLAGE_PK on EMBALLAGE (
ID_EMBALLAGE
);

/*==============================================================*/
/* Table : FACTURE                                              */
/*==============================================================*/
create table FACTURE (
ID_FACTURE           INT8                 not null,
DATE_FACTURE         DATE                 null,
constraint PK_FACTURE primary key (ID_FACTURE)
);

/*==============================================================*/
/* Index : FACTURE_PK                                           */
/*==============================================================*/
create unique index FACTURE_PK on FACTURE (
ID_FACTURE
);

/*==============================================================*/
/* Table : FORMAT                                               */
/*==============================================================*/
create table FORMAT (
ID_FORMAT            INT2                 not null,
ID_EMBALLAGE         INT2                 not null,
QUANTITE_FORMAT      INT2                 null,
UNITE_FORMAT         VARCHAR(3)           null,
constraint PK_FORMAT primary key (ID_FORMAT)
);

/*==============================================================*/
/* Index : FORMAT_PK                                            */
/*==============================================================*/
create unique index FORMAT_PK on FORMAT (
ID_FORMAT
);

/*==============================================================*/
/* Index : EMBALLAGEFORMAT_FK                                   */
/*==============================================================*/
create  index EMBALLAGEFORMAT_FK on FORMAT (
ID_EMBALLAGE
);

/*==============================================================*/
/* Table : PRODUIT                                              */
/*==============================================================*/
create table PRODUIT (
ID_PRODUIT           INT4                 not null,
ID_CATEGORIE         INT4                 not null,
REF_PRODUIT          VARCHAR(25)          null,
NOM_PRODUIT          VARCHAR(150)         null,
constraint PK_PRODUIT primary key (ID_PRODUIT)
);

/*==============================================================*/
/* Index : PRODUIT_PK                                           */
/*==============================================================*/
create unique index PRODUIT_PK on PRODUIT (
ID_PRODUIT
);

/*==============================================================*/
/* Index : PRODUIT_CATEGORIE_FK                                 */
/*==============================================================*/
create  index PRODUIT_CATEGORIE_FK on PRODUIT (
ID_CATEGORIE
);

/*==============================================================*/
/* Table : PRODUIT_EMBALLAGE                                    */
/*==============================================================*/
create table PRODUIT_EMBALLAGE (
ID_PRODUIT           INT4                 not null,
ID_EMBALLAGE         INT2                 not null,
constraint PK_PRODUIT_EMBALLAGE primary key (ID_PRODUIT, ID_EMBALLAGE)
);

/*==============================================================*/
/* Index : PRODUIT_EMBALLAGE_PK                                 */
/*==============================================================*/
create unique index PRODUIT_EMBALLAGE_PK on PRODUIT_EMBALLAGE (
ID_PRODUIT,
ID_EMBALLAGE
);

/*==============================================================*/
/* Index : PRODUIT_EMBALLAGE_FK                                 */
/*==============================================================*/
create  index PRODUIT_EMBALLAGE_FK on PRODUIT_EMBALLAGE (
ID_PRODUIT
);

/*==============================================================*/
/* Index : PRODUIT_EMBALLAGE2_FK                                */
/*==============================================================*/
create  index PRODUIT_EMBALLAGE2_FK on PRODUIT_EMBALLAGE (
ID_EMBALLAGE
);

/*==============================================================*/
/* Table : VENTE                                                */
/*==============================================================*/
create table VENTE (
ID_VENTE             INT8                 not null,
DATE_VENTE           DATE                 null,
constraint PK_VENTE primary key (ID_VENTE)
);

/*==============================================================*/
/* Index : VENTE_PK                                             */
/*==============================================================*/
create unique index VENTE_PK on VENTE (
ID_VENTE
);

/*==============================================================*/
/* Table : VENTECLIENT                                          */
/*==============================================================*/
create table VENTECLIENT (
ID_CLIENT            INT4                 not null,
ID_VENTE             INT8                 not null,
constraint PK_VENTECLIENT primary key (ID_CLIENT, ID_VENTE)
);

/*==============================================================*/
/* Index : VENTECLIENT_PK                                       */
/*==============================================================*/
create unique index VENTECLIENT_PK on VENTECLIENT (
ID_CLIENT,
ID_VENTE
);

/*==============================================================*/
/* Index : VENTECLIENT_FK                                       */
/*==============================================================*/
create  index VENTECLIENT_FK on VENTECLIENT (
ID_CLIENT
);

/*==============================================================*/
/* Index : VENTECLIENT2_FK                                      */
/*==============================================================*/
create  index VENTECLIENT2_FK on VENTECLIENT (
ID_VENTE
);

/*==============================================================*/
/* Table : VENTEPRODUIT                                         */
/*==============================================================*/
create table VENTEPRODUIT (
ID_PRODUIT           INT4                 not null,
ID_VENTE             INT8                 not null,
constraint PK_VENTEPRODUIT primary key (ID_PRODUIT, ID_VENTE)
);

/*==============================================================*/
/* Index : VENTEPRODUIT_PK                                      */
/*==============================================================*/
create unique index VENTEPRODUIT_PK on VENTEPRODUIT (
ID_PRODUIT,
ID_VENTE
);

/*==============================================================*/
/* Index : VENTEPRODUIT_FK                                      */
/*==============================================================*/
create  index VENTEPRODUIT_FK on VENTEPRODUIT (
ID_PRODUIT
);

/*==============================================================*/
/* Index : VENTEPRODUIT2_FK                                     */
/*==============================================================*/
create  index VENTEPRODUIT2_FK on VENTEPRODUIT (
ID_VENTE
);

alter table FORMAT
   add constraint FK_FORMAT_EMBALLAGE_EMBALLAG foreign key (ID_EMBALLAGE)
      references EMBALLAGE (ID_EMBALLAGE)
      on delete restrict on update restrict;

alter table PRODUIT
   add constraint FK_PRODUIT_PRODUIT_C_CATEGORI foreign key (ID_CATEGORIE)
      references CATEGORIE (ID_CATEGORIE)
      on delete restrict on update restrict;

alter table PRODUIT_EMBALLAGE
   add constraint FK_PRODUIT__PRODUIT_E_PRODUIT foreign key (ID_PRODUIT)
      references PRODUIT (ID_PRODUIT)
      on delete restrict on update restrict;

alter table PRODUIT_EMBALLAGE
   add constraint FK_PRODUIT__PRODUIT_E_EMBALLAG foreign key (ID_EMBALLAGE)
      references EMBALLAGE (ID_EMBALLAGE)
      on delete restrict on update restrict;

alter table VENTECLIENT
   add constraint FK_VENTECLI_VENTECLIE_CLIENT foreign key (ID_CLIENT)
      references CLIENT (ID_CLIENT)
      on delete restrict on update restrict;

alter table VENTECLIENT
   add constraint FK_VENTECLI_VENTECLIE_VENTE foreign key (ID_VENTE)
      references VENTE (ID_VENTE)
      on delete restrict on update restrict;

alter table VENTEPRODUIT
   add constraint FK_VENTEPRO_VENTEPROD_PRODUIT foreign key (ID_PRODUIT)
      references PRODUIT (ID_PRODUIT)
      on delete restrict on update restrict;

alter table VENTEPRODUIT
   add constraint FK_VENTEPRO_VENTEPROD_VENTE foreign key (ID_VENTE)
      references VENTE (ID_VENTE)
      on delete restrict on update restrict;

