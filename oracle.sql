-- ************************************************************
--   Nom de la base   :  BASE_TP_SOIN                          
--   Nom de SGBD      :  ORACLE Version 9.2.0                    
--   Date de mdification:  05/10/2016   17:34                       
--   Auteur :  Valentin BOTTE    
-- ************************************************************

drop table Dossier cascade constraints
/

drop table Prestation cascade constraints
/

drop table Intervenant cascade constraints
/

drop table IntervenantExterne cascade constraints
/


-- ************************************************************
--   Table : DOSSIER                                             
-- ************************************************************
create table Dossier
(
	 numPatient				 	INTEGER				 	NOT NULL,
     nomPatient   			 	VARCHAR2(60)            NOT NULL,
     prenomPatient			 	VARCHAR2(60)            NOT NULL,
     dateNaissancePatient      TIMESTAMP     			NOT NULL,
    
	 constraint PK_DOSSIER primary key (numPatient)
)
/


-- ************************************************************
--   Table : INTERVENANTEXTERNE                                           
-- ************************************************************
create table IntervenantExterne
(
    id        			INTEGER               not null,
    specialite        	varchar(80)           not null,
    adresse     		varchar(60)           not null,
    tel         		varchar(20)           not null,
    
    constraint PK_InterEx primary key (id)
)
/


-- ************************************************************
--   Table : INTERVENANT                                         
-- ************************************************************
create table Intervenant
(
    id     integer           not null,
    nom     varchar2(60)            not null,
    prenom  varchar2(60)                    not null,
    constraint PK_INTERVENANT primary key (id),
	constraint FK_Intervenant_InterEx foreign key (id) references IntervenantExterne (id)
)
/


-- ************************************************************
--   Table : PRESTATION                                            
-- ************************************************************
create table Prestation
(
	id 					INTEGER					not null,
    libelle		    	VARCHAR2(40)            not null,
    datePrestation      TIMESTAMP  	        	not null,
    idDossier     		INTEGER			   		not null,
    idIntervenant       INTEGER                 not null,
    constraint PK_PRESTATION primary key (id),
	constraint FK_Prestation_Intervenant foreign key (idIntervenant) references Intervenant(id)
)
/
