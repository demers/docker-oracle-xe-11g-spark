/***********************************************************
	Table "DEPARTEMENT"
***********************************************************/
CREATE TABLE DEPARTEMENT
(
    NOM_DEPARTEMENT		VARCHAR2(5)		NOT NULL,
    NOM_COMPLET			VARCHAR2(15)	NOT NULL,
    TELEPHONE			NUMERIC(10,0)	NULL,
    CONSTRAINT PK_DEPARTEMENT
					PRIMARY KEY (NOM_DEPARTEMENT),
    CONSTRAINT U1_DEPARTEMENT
					UNIQUE (NOM_COMPLET)
);

/***********************************************************
	Table "EMPLOYE"
***********************************************************/
CREATE TABLE EMPLOYE
(
    NO_EMPLOYE			SMALLINT		NOT NULL, /* sequence SEQ_EMPLOYE_NO_EMPLOYE */
    NAS					NUMERIC(9,0)	NOT NULL,
    NOM					VARCHAR2(10)	NOT NULL,
    PRENOM				VARCHAR2(10)	NOT NULL,
    SEXE				CHAR(1)			NOT NULL,
    DATE_NAISSANCE		DATE			NULL,
    DATE_EMBAUCHE		DATE			NOT NULL,
    FONCTION			VARCHAR2(15)	NOT NULL,
    SALAIRE				NUMERIC(6,0)	NULL,
    TELEPHONE_BUREAU	NUMERIC(10,0)	NULL,
    ADRESSE				VARCHAR2(15)	NULL,
    TELEPHONE_DOMICILE	NUMERIC(10,0)	NULL,
    NOM_DEPARTEMENT		VARCHAR2(5)		NULL,
    CONSTRAINT PK_EMPLOYE
					PRIMARY KEY (NO_EMPLOYE),
    CONSTRAINT U1_EMPLOYE
					UNIQUE (NAS),
    CONSTRAINT FK_EMP_DEPARTEMENT
					FOREIGN KEY (NOM_DEPARTEMENT)
					REFERENCES DEPARTEMENT (NOM_DEPARTEMENT)
);


/***********************************************************
	Séquence "SEQ_EMPLOYE_NO_EMPLOYE"
***********************************************************/
CREATE SEQUENCE SEQ_EMPLOYE_NO_EMPLOYE
			 INCREMENT BY 1
			 START WITH 1;


/* **********************************************************
	DML Insert
	Schéma MRD:	"Cas Projets Version 0"
	Auteur:		Sylvie Monjal - Cégep de Ste-Foy  	
********************************************************** */

/*===============================================================================
     Table DEPARTEMENT: 5 départements 
/*===============================================================================*/	

--=====================================================================================
-- Département 'Recherche'
INSERT INTO
	DEPARTEMENT
		(NOM_DEPARTEMENT,
		 NOM_COMPLET,
		 TELEPHONE)
	VALUES
		('RD',
		 'Recherche',
		 NULL);
--=====================================================================================
-- Département 'Finances'
INSERT INTO
	DEPARTEMENT
		(NOM_DEPARTEMENT,
		 NOM_COMPLET,
		 TELEPHONE)
	VALUES
		('Fin.',
		 'Finances',
		 NULL);
--=====================================================================================
-- Département 'Informatique'
INSERT INTO
	DEPARTEMENT
	VALUES
		('Info',
		 'Informatique',
		 NULL);
--=====================================================================================
-- Département 'Marketing'
INSERT INTO
	DEPARTEMENT
		(NOM_DEPARTEMENT,
		 NOM_COMPLET)
	VALUES
		('Markt',
		 'Marketing');
--=====================================================================================
-- Département 'Ventes'	 
INSERT INTO
	DEPARTEMENT
		(TELEPHONE,		
		 NOM_COMPLET,
		 NOM_DEPARTEMENT)
	VALUES
		(NULL,
		 'Ventes',
		 'Vente');


/*===============================================================================
     Table EMPLOYE: 18 employés
/*===============================================================================*/	

INSERT INTO
	EMPLOYE
		(NO_EMPLOYE,
		 NAS,
		 NOM,
		 PRENOM,
		 SEXE,
		 DATE_NAISSANCE,
		 DATE_EMBAUCHE,
		 FONCTION,
		 SALAIRE,
		 NOM_DEPARTEMENT,
		 TELEPHONE_BUREAU,
		 ADRESSE,
		 TELEPHONE_DOMICILE)
	VALUES
		(SEQ_EMPLOYE_NO_EMPLOYE.NEXTVAL,
		 398932209,
		 'Blow',
		 'Jow',
		 'M',
		 NULL ,
		 TO_DATE('1997-06-15','yyyy-mm-dd'),
		 'grand boss',
		 122000,
		 NULL,
		 NULL,
		 NULL,
		 NULL);		 
INSERT INTO
	EMPLOYE
		(NO_EMPLOYE,
		 NAS,
		 NOM,
		 PRENOM,
		 SEXE,
		 DATE_NAISSANCE,
		 DATE_EMBAUCHE,
		 FONCTION,
		 SALAIRE,
		 NOM_DEPARTEMENT,
		 TELEPHONE_BUREAU,
		 ADRESSE,
		 TELEPHONE_DOMICILE)
	VALUES
		(SEQ_EMPLOYE_NO_EMPLOYE.NEXTVAL,
		 32883809,
		 'Ban',
		 'Ray',
		 'M',
		 NULL, 
		 TO_DATE('1998-07-15','yyyy-mm-dd'),
		 'vice-roi',
		 105000,
		 NULL,
		 NULL,
		 NULL,
		 NULL);
	 
--=====================================================================================
-- Département 'Recherche' --> aucun employé

--=====================================================================================
-- Département 'Finances' --> 2 employés
INSERT INTO
	EMPLOYE
		(NO_EMPLOYE,
		 NAS,
		 NOM,
		 PRENOM,
		 SEXE,
		 DATE_NAISSANCE,
		 DATE_EMBAUCHE,
		 FONCTION,
		 SALAIRE,
		 NOM_DEPARTEMENT,
		 TELEPHONE_BUREAU,
		 ADRESSE,
		 TELEPHONE_DOMICILE)
	VALUES
		(SEQ_EMPLOYE_NO_EMPLOYE.NEXTVAL,
		 384115666,
		 'Lacroix',
		 'Etienne',
		 'M',
		 NULL, 
		 TO_DATE('2000-09-02','yyyy-mm-dd'),
		 'financier',
		 95000,
		 'Fin.',
		 NULL,
		 NULL,
		 NULL);
INSERT INTO
	EMPLOYE
		(NO_EMPLOYE,
		 NAS,
		 NOM,
		 PRENOM,
		 SEXE,
		 DATE_NAISSANCE,
		 DATE_EMBAUCHE,
		 FONCTION,
		 SALAIRE,
		 NOM_DEPARTEMENT,
		 TELEPHONE_BUREAU,
		 ADRESSE,
		 TELEPHONE_DOMICILE)
	VALUES
		(SEQ_EMPLOYE_NO_EMPLOYE.NEXTVAL,
		 384115251,
		 'Gagnon',
		 'Eric',
		 'M',
		 NULL, 
		 TO_DATE('2003-01-21','yyyy-mm-dd'),
		 'comptable',
		 78400,
		 'Fin.',
		 NULL,
		 NULL,
		 NULL);

--=====================================================================================
-- Département 'Informatique' --> 9 employés
INSERT INTO
	EMPLOYE
		(NO_EMPLOYE,
		 NAS,
		 NOM,
		 PRENOM,
		 SEXE,
		 DATE_NAISSANCE,
		 DATE_EMBAUCHE,
		 FONCTION,
		 SALAIRE,
		 NOM_DEPARTEMENT,
		 TELEPHONE_BUREAU,
		 ADRESSE,
		 TELEPHONE_DOMICILE)
	VALUES
		(SEQ_EMPLOYE_NO_EMPLOYE.NEXTVAL,
		 331936209, 'Gates',
		 'Bill',
		 'M',
		 NULL, 
		 TO_DATE('1998-07-15','yyyy-mm-dd'),
		 'directeur',
		 78000,
		 'Info',
		 NULL,
		 NULL,
		 NULL);
INSERT INTO
	EMPLOYE
		(NO_EMPLOYE,
		 NAS,
		 NOM,
		 PRENOM,
		 SEXE,
		 DATE_NAISSANCE,
		 DATE_EMBAUCHE,
		 FONCTION,
		 SALAIRE,
		 NOM_DEPARTEMENT,
		 TELEPHONE_BUREAU,
		 ADRESSE,
		 TELEPHONE_DOMICILE)
	VALUES
		(SEQ_EMPLOYE_NO_EMPLOYE.NEXTVAL,
		 324114256,
		 'Monjal',
		 'Sylvie',
		 'F',
		 NULL, 
		 TO_DATE('1998-09-15','yyyy-mm-dd'),
		 'analyste',
		 45000,
		 'Info',
		 NULL,
		 NULL,
		 NULL);
INSERT INTO
	EMPLOYE
		(NO_EMPLOYE,
		 NAS,
		 NOM,
		 PRENOM,
		 SEXE,
		 DATE_NAISSANCE,
		 DATE_EMBAUCHE,
		 FONCTION,
		 SALAIRE,
		 NOM_DEPARTEMENT,
		 TELEPHONE_BUREAU,
		 ADRESSE,
		 TELEPHONE_DOMICILE)
	VALUES
		(SEQ_EMPLOYE_NO_EMPLOYE.NEXTVAL,
		 344444254,
		 'Nadeau',
		 'Michel',
		 'M',
		 NULL, 
		 TO_DATE('2004-01-15','yyyy-mm-dd'),
		 'analyste',
		 35000,
		 'Info',
		 NULL,
		 NULL,
		 NULL);
INSERT INTO
	EMPLOYE
		(NO_EMPLOYE,
		 NAS,
		 NOM,
		 PRENOM,
		 SEXE,
		 DATE_NAISSANCE,
		 DATE_EMBAUCHE,
		 FONCTION,
		 SALAIRE,
		 NOM_DEPARTEMENT,
		 TELEPHONE_BUREAU,
		 ADRESSE,
		 TELEPHONE_DOMICILE)
	VALUES
		(SEQ_EMPLOYE_NO_EMPLOYE.NEXTVAL,
		 144144254,
		 'Gagnon',
		 'Carmen',
		 'F',
		 NULL, 
		 TO_DATE('1999-09-15','yyyy-mm-dd'),
		 'analyste',
		 42000,
		 'Info',
		 NULL,
		 NULL,
		 NULL);
INSERT INTO
	EMPLOYE
		(NO_EMPLOYE,
		 NAS,
		 NOM,
		 PRENOM,
		 SEXE,
		 DATE_NAISSANCE,
		 DATE_EMBAUCHE,
		 FONCTION,
		 SALAIRE,
		 NOM_DEPARTEMENT,
		 TELEPHONE_BUREAU,
		 ADRESSE,
		 TELEPHONE_DOMICILE)
	VALUES
		(SEQ_EMPLOYE_NO_EMPLOYE.NEXTVAL,
		 342224254,
		 'Gagnon',
		 'Martine',
		 'F',
		 NULL, 
		 TO_DATE('1998-03-02','yyyy-mm-dd'),
		 'programmeur',
		 38000,
		 'Info',
		 NULL,
		 NULL,
		 NULL);
INSERT INTO
	EMPLOYE
		(NO_EMPLOYE,
		 NAS,
		 NOM,
		 PRENOM,
		 SEXE,
		 DATE_NAISSANCE,
		 DATE_EMBAUCHE,
		 FONCTION,
		 SALAIRE,
		 NOM_DEPARTEMENT,
		 TELEPHONE_BUREAU,
		 ADRESSE,
		 TELEPHONE_DOMICILE)
	VALUES
		(SEQ_EMPLOYE_NO_EMPLOYE.NEXTVAL,
		 842884254,
		 'VanHoute',
		 'Eloi',
		 'M',
		 NULL, 
		 TO_DATE('2002-05-12','yyyy-mm-dd'),
		 'programmeur',
		 28000,
		 'Info',
		 NULL,
		 NULL,
		 NULL);
INSERT INTO
	EMPLOYE
		(NO_EMPLOYE,
		 NAS,
		 NOM,
		 PRENOM,
		 SEXE,
		 DATE_NAISSANCE,
		 DATE_EMBAUCHE,
		 FONCTION,
		 SALAIRE,
		 NOM_DEPARTEMENT,
		 TELEPHONE_BUREAU,
		 ADRESSE,
		 TELEPHONE_DOMICILE)
	VALUES
		(SEQ_EMPLOYE_NO_EMPLOYE.NEXTVAL,
		 342221111,
		 'Souci',
		 'Marcel',
		 'M',
		 NULL, 
		 TO_DATE('2015-03-02','yyyy-mm-dd'),
		 'programmeur',
		 34300,
		 'Info',
		 NULL,
		 NULL,
		 NULL);
INSERT INTO
	EMPLOYE
		(NO_EMPLOYE,
		 NAS,
		 NOM,
		 PRENOM,
		 SEXE,
		 DATE_NAISSANCE,
		 DATE_EMBAUCHE,
		 FONCTION,
		 SALAIRE,
		 NOM_DEPARTEMENT,
		 TELEPHONE_BUREAU,
		 ADRESSE,
		 TELEPHONE_DOMICILE)
	VALUES
		(SEQ_EMPLOYE_NO_EMPLOYE.NEXTVAL,
		 992221999,
		 'Souci',
		 'Marcel',
		 'M',
		 NULL, 
		 TO_DATE('2014-08-28','yyyy-mm-dd'),
		 'rédacteur',
		 35100,
		 'Info',
		 NULL,
		 NULL,
		 NULL);
INSERT INTO
	EMPLOYE
		(NO_EMPLOYE,
		 NAS,
		 NOM,
		 PRENOM,
		 SEXE,
		 DATE_NAISSANCE,
		 DATE_EMBAUCHE,
		 FONCTION,
		 SALAIRE,
		 NOM_DEPARTEMENT,
		 TELEPHONE_BUREAU,
		 ADRESSE,
		 TELEPHONE_DOMICILE)
	VALUES
		(SEQ_EMPLOYE_NO_EMPLOYE.NEXTVAL,
		 399921991,
		 'Abott',
		 'Gino',
		 'M',
		 NULL, 
		 TO_DATE('2005-03-02','yyyy-mm-dd'),
		 'testeur',
		 40500,
		 'Info',
		 NULL,
		 NULL,
		 NULL);

--=====================================================================================
-- Département 'Marketing' --> 2 employés
INSERT INTO
	EMPLOYE
		(NO_EMPLOYE,
		 NAS,
		 NOM,
		 PRENOM,
		 SEXE,
		 DATE_NAISSANCE,
		 DATE_EMBAUCHE,
		 FONCTION,
		 SALAIRE,
		 NOM_DEPARTEMENT,
		 TELEPHONE_BUREAU,
		 ADRESSE,
		 TELEPHONE_DOMICILE)
	VALUES
		(SEQ_EMPLOYE_NO_EMPLOYE.NEXTVAL,
		 392935550,
		 'Hey',
		 'Heidi',
		 'F',
		 NULL , 
		 TO_DATE('2015-07-22','yyyy-mm-dd'),
		 'cadre direction',
		 45000,
		 'Markt',
		 NULL,
		 NULL,
		 NULL);
INSERT INTO
	EMPLOYE
		(NO_EMPLOYE,
		 NAS,
		 NOM,
		 PRENOM,
		 SEXE,
		 DATE_NAISSANCE,
		 DATE_EMBAUCHE,
		 FONCTION,
		 SALAIRE,
		 NOM_DEPARTEMENT,
		 TELEPHONE_BUREAU,
		 ADRESSE,
		 TELEPHONE_DOMICILE)
	VALUES
		(SEQ_EMPLOYE_NO_EMPLOYE.NEXTVAL,
		 444421991,
		 'Colin',
		 'Maillard',
		 'M',
		 NULL, 
		 TO_DATE('2005-03-02','yyyy-mm-dd'),
		 'analyste',
		 44500,
		 'Markt',
		 NULL,
		 NULL,
		 NULL);

--=====================================================================================
-- Département 'Ventes' --> 3 employés
INSERT INTO
	EMPLOYE
		(NO_EMPLOYE,
		 NAS,
		 NOM,
		 PRENOM,
		 SEXE,
		 DATE_NAISSANCE,
		 DATE_EMBAUCHE,
		 FONCTION,
		 SALAIRE,
		 NOM_DEPARTEMENT,
		 TELEPHONE_BUREAU,
		 ADRESSE,
		 TELEPHONE_DOMICILE)
	VALUES
		(SEQ_EMPLOYE_NO_EMPLOYE.NEXTVAL,
		 311111150,
		 'Halou',
		 'Jean',
		 'F',
		 NULL , 
		 TO_DATE('2001-02-28','yyyy-mm-dd'),
		 'cadre direction',
		 80000,
		 'Vente',
		 NULL,
		 NULL,
		 NULL);
INSERT INTO
	EMPLOYE
		(NO_EMPLOYE,
		 NAS,
		 NOM,
		 PRENOM,
		 SEXE,
		 DATE_NAISSANCE,
		 DATE_EMBAUCHE,
		 FONCTION,
		 SALAIRE,
		 NOM_DEPARTEMENT,
		 TELEPHONE_BUREAU,
		 ADRESSE,
		 TELEPHONE_DOMICILE)
	VALUES
		(SEQ_EMPLOYE_NO_EMPLOYE.NEXTVAL,
		 555521991,
		 'Bazoo',
		 'Marc',
		 'M', NULL, 
		 TO_DATE('2000-01-02','yyyy-mm-dd'),
		 'vendeur',
		 41500,
		 'Vente',
		 NULL,
		 NULL,
		 NULL);
INSERT INTO
	EMPLOYE
		(NO_EMPLOYE,
		 NAS,
		 NOM,
		 PRENOM,
		 SEXE,
		 DATE_NAISSANCE,
		 DATE_EMBAUCHE,
		 FONCTION,
		 SALAIRE,
		 NOM_DEPARTEMENT,
		 TELEPHONE_BUREAU,
		 ADRESSE,
		 TELEPHONE_DOMICILE)
	VALUES
		(SEQ_EMPLOYE_NO_EMPLOYE.NEXTVAL,
		 666621991,
		 'Zouzou',
		 'Corinne',
		 'M',
		 NULL, 
		 TO_DATE('2005-08-01','yyyy-mm-dd'),
		 'vendeur',
		 25500,
		 'Vente',
		 NULL,
		 NULL,
		 NULL);
		 
-- Sauvegarde des données
COMMIT;

/* EXERCICE 1 */
/* ========== */
			 
/***********************************************************
	Table "CLIENT"
***********************************************************/
CREATE TABLE CLIENT
(
    NOM_CLIENT			VARCHAR2(10)	NOT NULL,
    NO_ENREGISTREMENT	SMALLINT		NOT NULL,
    RUE					VARCHAR2(10)	NULL,
    VILLE				VARCHAR2(10)	NOT NULL,
    CODE_POSTAL			VARCHAR2(6)		NOT NULL,
    TELEPHONE			NUMERIC(10,0)	NULL,
    CONSTRAINT PK_CLIENT
					PRIMARY KEY (NOM_CLIENT),
    CONSTRAINT U1_CLIENT
					UNIQUE (NO_ENREGISTREMENT)
);

		 
/*===============================================================================
  3. Table CLIENT: 8 clients
/*===============================================================================*/	
INSERT INTO
	CLIENT
		(NOM_CLIENT,
		 NO_ENREGISTREMENT,
		 RUE ,
		 VILLE,
		 CODE_POSTAL,
		 TELEPHONE)
	VALUES
		('Navel',
		 14237,
		 NULL,
		 'Québec',
		 'G1R3X4',
		 NULL);
INSERT INTO
	CLIENT
		(NOM_CLIENT,
		 NO_ENREGISTREMENT,
		 RUE ,
		 VILLE,
		 CODE_POSTAL,
		 TELEPHONE)
	VALUES
		('Grahams',
		 12228,
		 NULL,
		 'Québec',
		 'G2T3Y4',
		 NULL);
INSERT INTO
	CLIENT
		(NOM_CLIENT,
		 NO_ENREGISTREMENT,
		 RUE ,
		 VILLE,
		 CODE_POSTAL,
		 TELEPHONE)
	VALUES
		('Bazoo',
		 5774,
		 NULL,
		 'Québec',
		 'S1F2Y4',
		 NULL);
INSERT INTO
	CLIENT
		(NOM_CLIENT,
		 NO_ENREGISTREMENT,
		 RUE ,
		 VILLE,
		 CODE_POSTAL,
		 TELEPHONE)
	VALUES
		('Durivage',
		 3774,
		 NULL,
		 'Québec',
		 'P5F2Z4',
		 NULL);
INSERT INTO
	CLIENT
		(NOM_CLIENT,
		 NO_ENREGISTREMENT,
		 RUE ,
		 VILLE,
		 CODE_POSTAL,
		 TELEPHONE)
 	VALUES
		('Leblanc',
		 4561,
		 NULL,
		 'Montréal',
		 'D8F2Y4',
		 NULL);
INSERT INTO
	CLIENT
		(NOM_CLIENT,
		 NO_ENREGISTREMENT,
		 RUE ,
		 VILLE,
		 CODE_POSTAL,
		 TELEPHONE)
 	VALUES
		('GMC',
		 12,
		 NULL,
		 'Montréal',
		 'S7F2W4',
		 NULL);
INSERT INTO
	CLIENT
		(NOM_CLIENT,
		 NO_ENREGISTREMENT,
		 RUE ,
		 VILLE,
		 CODE_POSTAL,
		 TELEPHONE)
	VALUES
		('KPMG',
		 11223,
		 NULL,
		 'Montréal',
		 'B1V2R4',
		 NULL);
INSERT INTO
	CLIENT
		(NOM_CLIENT,
		 NO_ENREGISTREMENT,
		 RUE ,
		 VILLE,
		 CODE_POSTAL,
		 TELEPHONE)
	VALUES
		('ArcBec',
		 4456,
		 NULL,
		 'Lévis',
		 'T1T2M4',
		 NULL);
COMMIT;

/***********************************************************
	Table "PROJET"
***********************************************************/
CREATE TABLE PROJET
(
    NOM_PROJET			VARCHAR2(10)	NOT NULL,
    NOM_CLIENT			VARCHAR2(10)	NOT NULL,
    DATE_DEBUT_PREVUE	DATE			NULL,
    DATE_DEBUT_REELLE	DATE			NULL,
    DATE_FIN_PREVUE		DATE			NULL,
    DATE_FIN_REELLE		DATE			NULL,
    BUDGET				NUMERIC(6,0)	NULL,
    NO_GESTIONNAIRE		SMALLINT		NOT NULL,
    NO_CONTACT_CLIENT	SMALLINT		NULL,
    CONSTRAINT PK_PROJET
					PRIMARY KEY (NOM_CLIENT, NOM_PROJET),	
    CONSTRAINT FK_PRJ_CLIENT
					FOREIGN KEY (NOM_CLIENT)
					REFERENCES CLIENT (NOM_CLIENT),
    CONSTRAINT FK_PRJ_EMPLOYE_GESTION
					FOREIGN KEY (NO_GESTIONNAIRE)
					REFERENCES EMPLOYE (NO_EMPLOYE),
    CONSTRAINT FK_PRJ_EMPLOYE_CONTACT
					FOREIGN KEY (NO_CONTACT_CLIENT)
					REFERENCES EMPLOYE (NO_EMPLOYE)
);

/*===============================================================================
  4. Table PROJET: 10 projets
/*===============================================================================*/	
-- Client Navel: 3 projets
INSERT INTO
	PROJET
		(NOM_PROJET,
		 NOM_CLIENT,
		 BUDGET,
		 DATE_DEBUT_PREVUE,
		 DATE_DEBUT_REELLE,
		 DATE_FIN_PREVUE,
		 DATE_FIN_REELLE,
		 NO_GESTIONNAIRE,
		 NO_CONTACT_CLIENT)
    VALUES
		('RH',
		 'Navel',
		 12000,
		 TO_DATE('2015-09-01','yyyy-mm-dd'),
		 TO_DATE('2015-09-01','yyyy-mm-dd'),
		 TO_DATE('2015-12-01','yyyy-mm-dd'),
		 TO_DATE('2016-01-18','yyyy-mm-dd'),
		 2,
		 NULL);
INSERT INTO
	PROJET
		(NOM_PROJET,
		 NOM_CLIENT,
		 BUDGET,
		 DATE_DEBUT_PREVUE,
		 DATE_DEBUT_REELLE,
		 DATE_FIN_PREVUE,
		 DATE_FIN_REELLE,
		 NO_GESTIONNAIRE,
		 NO_CONTACT_CLIENT)
    VALUES
		('EnLigne',
		 'Navel',
		 25000,
		 TO_DATE('2016-01-06','yyyy-mm-dd'),
		 TO_DATE('2016-02-02','yyyy-mm-dd'),
		 TO_DATE('2016-08-02','yyyy-mm-dd'),
		 NULL,
		 6,
		 NULL);
INSERT INTO
	PROJET
		(NOM_PROJET,
		 NOM_CLIENT,
		 BUDGET,
		 DATE_DEBUT_PREVUE,
		 DATE_DEBUT_REELLE,
		 DATE_FIN_PREVUE,
		 DATE_FIN_REELLE,
		 NO_GESTIONNAIRE,
		 NO_CONTACT_CLIENT)
    VALUES
		('Production',
		 'Navel',
		 6000,
		 TO_DATE('2016-06-01','yyyy-mm-dd'),
		 NULL,
		 TO_DATE('2016-12-12','yyyy-mm-dd'),
		 NULL,
		 7,
		 NULL);

--=====================================================================================
-- Client Grahams: 1 projet
INSERT INTO
	PROJET
		(NOM_PROJET,
		 NOM_CLIENT,
		 BUDGET,
		 DATE_DEBUT_PREVUE,
		 DATE_DEBUT_REELLE,
		 DATE_FIN_PREVUE,
		 DATE_FIN_REELLE,
		 NO_GESTIONNAIRE,
		 NO_CONTACT_CLIENT)
    VALUES
		('RH',
		 'Grahams',
		 NULL,
		 TO_DATE('2016-02-01','yyyy-mm-dd'),
		 NULL,
		 TO_DATE('2016-06-12','yyyy-mm-dd'),
		 NULL,
		 10,
		 NULL);

--=====================================================================================
-- Client Bazoo: 2 projets
INSERT INTO
	PROJET
		(NOM_PROJET,
		 NOM_CLIENT,
		 BUDGET,
		 DATE_DEBUT_PREVUE,
		 DATE_DEBUT_REELLE,
		 DATE_FIN_PREVUE,
		 DATE_FIN_REELLE,
		 NO_GESTIONNAIRE,
		 NO_CONTACT_CLIENT)
    VALUES
		('Stocks',
		 'Bazoo',
		 7000,
		 TO_DATE('2015-11-01','yyyy-mm-dd'),
		 TO_DATE('2015-11-21','yyyy-mm-dd'),
		 TO_DATE('2016-03-12','yyyy-mm-dd'),
		 TO_DATE('2016-02-03','yyyy-mm-dd'),
		 17,
		 NULL);
INSERT INTO
	PROJET
		(NOM_PROJET,
		 NOM_CLIENT,
		 BUDGET,
		 DATE_DEBUT_PREVUE,
		 DATE_DEBUT_REELLE,
		 DATE_FIN_PREVUE,
		 DATE_FIN_REELLE,
		 NO_GESTIONNAIRE,
		 NO_CONTACT_CLIENT)
    VALUES
		('Ventes',
		 'Bazoo',
		 NULL,
		 TO_DATE('2016-04-15','yyyy-mm-dd'),
		 TO_DATE('2016-01-17','yyyy-mm-dd'),
		 TO_DATE('2016-02-05','yyyy-mm-dd'),
		 NULL,
		 8,
		 NULL);

--=====================================================================================
-- Client GMC: 1 projet
INSERT INTO
	PROJET
		(NOM_PROJET,
		 NOM_CLIENT,
		 BUDGET,
		 DATE_DEBUT_PREVUE,
		 DATE_DEBUT_REELLE,
		 DATE_FIN_PREVUE,
		 DATE_FIN_REELLE,
		 NO_GESTIONNAIRE,
		 NO_CONTACT_CLIENT)
    VALUES
		('Inventaire',
		 'GMC',
		 85000,
		 TO_DATE('2015-01-06','yyyy-mm-dd'),
		 TO_DATE('2015-02-01','yyyy-mm-dd'),
		 TO_DATE('2016-04-02','yyyy-mm-dd'),
		 NULL,
		 8,
		 NULL);
--=====================================================================================
-- Client KPMG: 3 projets
INSERT INTO
	PROJET
		(NOM_PROJET,
		 NOM_CLIENT,
		 BUDGET,
		 DATE_DEBUT_PREVUE,
		 DATE_DEBUT_REELLE,
		 DATE_FIN_PREVUE,
		 DATE_FIN_REELLE,
		 NO_GESTIONNAIRE,
		 NO_CONTACT_CLIENT)
    VALUES
		('RH',
		 'KPMG',
		 100000,
		 TO_DATE('2015-04-01','yyyy-mm-dd'),
		 TO_DATE('2015-04-08','yyyy-mm-dd'),
		 TO_DATE('2016-04-01','yyyy-mm-dd'),
		 TO_DATE('2016-01-18','yyyy-mm-dd'),
		 8,
		 NULL);
INSERT INTO
	PROJET
		(NOM_PROJET,
		 NOM_CLIENT,
		 BUDGET,
		 DATE_DEBUT_PREVUE,
		 DATE_DEBUT_REELLE,
		 DATE_FIN_PREVUE,
		 DATE_FIN_REELLE,
		 NO_GESTIONNAIRE,
		 NO_CONTACT_CLIENT)
    VALUES
		('Bottin',
		 'KPMG',
		 52000,
		 TO_DATE('2016-01-02','yyyy-mm-dd'),
		 TO_DATE('2016-01-02','yyyy-mm-dd'),
		 TO_DATE('2016-05-25','yyyy-mm-dd'),
		 NULL,
		 15,
		 NULL);
INSERT INTO
	PROJET
		(NOM_PROJET,
		 NOM_CLIENT,
		 BUDGET,
		 DATE_DEBUT_PREVUE,
		 DATE_DEBUT_REELLE,
		 DATE_FIN_PREVUE,
		 DATE_FIN_REELLE,
		 NO_GESTIONNAIRE,
		 NO_CONTACT_CLIENT)
    VALUES
		('Pilotage',
		 'KPMG',
		 NULL,
		 TO_DATE('2016-08-01','yyyy-mm-dd'),
		 NULL,
		 TO_DATE('2016-12-01','yyyy-mm-dd'),
		 NULL,
		 5,
		 NULL);
 
COMMIT;

/***********************************************************
	Table DOCUMENT_PRJ
***********************************************************/
CREATE TABLE DOCUMENT_PRJ
(
    NO_DOCUMENT			SMALLINT		NOT NULL,
    NOM_PROJET			VARCHAR2(10)	NOT NULL,
    NOM_CLIENT			VARCHAR2(10)	NOT NULL,
    TITRE				VARCHAR2(15)	NOT NULL,
    TYPE_DOC			CHAR(1)			NOT NULL,
    DESCRIPTION			VARCHAR2(15)	NULL,
    CONSTRAINT PK_DOCUMENT_PRJ
			PRIMARY KEY (NO_DOCUMENT, NOM_PROJET, NOM_CLIENT),
    CONSTRAINT FK_DOC_PROJET
			FOREIGN KEY (NOM_CLIENT, NOM_PROJET)
			REFERENCES PROJET (NOM_CLIENT, NOM_PROJET)
);

/***********************************************************
	Table AFFECTATION_TRAVAIL
***********************************************************/
CREATE TABLE AFFECTATION_TRAVAIL
(
    NOM_CLIENT			VARCHAR2(10)	NOT NULL,
    NOM_PROJET			VARCHAR2(10)	NOT NULL,
    NO_EMPLOYE			SMALLINT		NOT NULL,
    DATE_AFFECTATION	DATE			NOT NULL,
    CONSTRAINT PK_AFFECTATION_TRAVAIL
			PRIMARY KEY (NOM_CLIENT, NOM_PROJET, NO_EMPLOYE),
    CONSTRAINT FK_AFFECTATION_PROJET
			FOREIGN KEY (NOM_CLIENT, NOM_PROJET)
			REFERENCES PROJET (NOM_CLIENT, NOM_PROJET),
    CONSTRAINT FK_AFFECTATION_EMPLOYE
			FOREIGN KEY (NO_EMPLOYE)
			REFERENCES EMPLOYE (NO_EMPLOYE)
);

/*===============================================================================
  Table AFFECTATION_TRAVAIL: 22 affectations
/*===============================================================================*/	
--=====================================================================================
-- Projet 'RH', 'Navel': 2 affectations de travail
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('RH',
		 'Navel',
		 2,
		 TO_DATE('2015-09-01','yyyy-mm-dd'));
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('RH',
		 'Navel',
		 3,
		 TO_DATE('2015-09-01','yyyy-mm-dd'));
--=====================================================================================
-- Projet 'EnLigne', 'Navel': 5 affectations de travail
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('EnLigne',
		'Navel',
		8,
		TO_DATE('2016-01-06','yyyy-mm-dd'));
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('EnLigne',
		 'Navel',
		 10,
		 TO_DATE('2016-01-06','yyyy-mm-dd'));
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('EnLigne',
		 'Navel',
		 12,
		 TO_DATE('2016-01-12','yyyy-mm-dd'));
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('EnLigne',
		 'Navel',
		 14,
		 TO_DATE('2016-02-18','yyyy-mm-dd'));
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('EnLigne',
		 'Navel',
		 16,	
		 TO_DATE('2016-02-18','yyyy-mm-dd'));
--=====================================================================================
-- Projet 'Production', 'Navel': 0 affectations de travail
--=====================================================================================
-- Projet 'RH', 'Grahams': 2 affectations de travail
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('RH',
		 'Grahams',
		 10,
		 TO_DATE('2016-02-01','yyyy-mm-dd'));
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('RH',
		 'Grahams',
		 13,
		 TO_DATE('2016-04-01','yyyy-mm-dd'));
--=====================================================================================
-- Projet 'Stocks', 'Bazoo': 3 affectations de travail
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('Stocks',
		 'Bazoo',
		 8,
		 TO_DATE('2015-12-01','yyyy-mm-dd'));
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('Stocks',
		 'Bazoo',
		 3,
		 TO_DATE('2015-11-21','yyyy-mm-dd'));
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('Stocks',
		 'Bazoo',
		 17,
		 TO_DATE('2015-01-01','yyyy-mm-dd'));
--=====================================================================================
-- Projet 'Ventes', 'Bazoo': 4 affectations de travail
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('Ventes',
		 'Bazoo',
		 8,
		 TO_DATE('2016-03-17','yyyy-mm-dd'));
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('Ventes',
		 'Bazoo',
		 10,
		 TO_DATE('2016-03-17','yyyy-mm-dd'));
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('Ventes',
		 'Bazoo',
		 9,
		 TO_DATE('2016-03-24','yyyy-mm-dd'));
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('Ventes',
		 'Bazoo',
		 14,
		 TO_DATE('2016-04-18','yyyy-mm-dd'));
--=====================================================================================
-- Projet 'Inventaire', 'GMC': 4 affectations de travail
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('Inventaire',
		 'GMC',
		 4,
		 TO_DATE('2015-02-01','yyyy-mm-dd'));
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('Inventaire',
		 'GMC',
		 10,
		 TO_DATE('2015-03-19','yyyy-mm-dd'));
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('Inventaire',
		 'GMC',
		 11,
		 TO_DATE('2015-11-22','yyyy-mm-dd'));
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('Inventaire',
		 'GMC',
		 8,
		 TO_DATE('2015-03-22','yyyy-mm-dd'));
--=====================================================================================
-- Projet 'RH', 'KPMG': 2 affectations de travail
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('RH',
		 'KPMG',
		 4,
		 TO_DATE('2015-04-01','yyyy-mm-dd'));
INSERT INTO
	AFFECTATION_TRAVAIL
		(NOM_PROJET,
		 NOM_CLIENT,
		 NO_EMPLOYE,
		 DATE_AFFECTATION)
	VALUES
		('RH',
		 'KPMG',
		 10,
		 TO_DATE('2015-10-01','yyyy-mm-dd'));	
--=====================================================================================
-- Projet 'Pilotage', 'KPMG': 0 affectations de travail	
	
/*===============================================================================
  Table DOCUMENT_PRJ: 12 documents
/*===============================================================================*/	
--=====================================================================================
-- Projet 'RH', 'Navel': 5 documents
INSERT INTO
	DOCUMENT_PRJ
		(NO_DOCUMENT,
		 NOM_PROJET,
		 NOM_CLIENT,
		 TYPE_DOC,
		 TITRE,
		 DESCRIPTION)
	VALUES
		(1,
		 'RH',
		 'Navel',
		 'A',
		 'Analyse',
		 NULL);
INSERT INTO
	DOCUMENT_PRJ
		(NO_DOCUMENT,
		 NOM_PROJET,
		 NOM_CLIENT,
		 TYPE_DOC,
		 TITRE,
		 DESCRIPTION)
	VALUES
		(2,
		 'RH',
		 'Navel',
		 'A',
		 'Backlog',
		  NULL);
INSERT INTO
	DOCUMENT_PRJ
		(NO_DOCUMENT,
		 NOM_PROJET,
		 NOM_CLIENT,
		 TYPE_DOC,
		 TITRE,
		 DESCRIPTION)
	VALUES
		(3,
		 'RH',
		 'Navel',
		 'P',
		 'Planification',
		 NULL);
INSERT INTO
	DOCUMENT_PRJ
		(NO_DOCUMENT,
		 NOM_PROJET,
		 NOM_CLIENT,
		 TYPE_DOC,
		 TITRE,
		 DESCRIPTION)
	VALUES
		(4,
		 'RH',
		 'Navel',
		 'G',
		 'User Guide',
		 NULL);
INSERT INTO
	DOCUMENT_PRJ
		(NO_DOCUMENT,
		 NOM_PROJET,
		 NOM_CLIENT,
		 TYPE_DOC,
		 TITRE,
		 DESCRIPTION)
	VALUES
		(99,
		 'RH',
		 'Navel',
		 'C',
		 'Bilan',
		 NULL);
--=====================================================================================
-- Projet 'EnLigne', 'Navel': 1 document		 
INSERT INTO
	DOCUMENT_PRJ
		(NO_DOCUMENT,
		 NOM_PROJET,
		 NOM_CLIENT,
		 TYPE_DOC,
		 TITRE,
		 DESCRIPTION)
	VALUES
		(1,
		 'EnLigne',
		 'Navel',
		 'A',
		 'Analyse',
		 NULL);
--=====================================================================================
-- Projet 'Production', 'Navel': 0 documents
--=====================================================================================
-- Projet 'RH', 'Grahams': 2 documents
INSERT INTO
	DOCUMENT_PRJ
		(NO_DOCUMENT,
		 NOM_PROJET,
		 NOM_CLIENT,
		 TYPE_DOC,
		 TITRE,
		 DESCRIPTION)
	VALUES
		(1,
		 'RH',
		 'Grahams',
		 'A',
		 'Backlog',
		 NULL);
INSERT INTO
	DOCUMENT_PRJ
		(NO_DOCUMENT,
		 NOM_PROJET,
		 NOM_CLIENT,
		 TYPE_DOC,
		 TITRE,
		 DESCRIPTION)
	VALUES
		(2,
		 'RH',
		 'Grahams',
		 'P',
		 'Planification',
		  NULL);
--=====================================================================================
-- Projet 'Stocks', 'Bazoo': 0 document
--=====================================================================================
-- Projet 'Ventes', 'Bazoo': 1 document
INSERT INTO
	DOCUMENT_PRJ
		(NO_DOCUMENT,
		 NOM_PROJET,
		 NOM_CLIENT,
		 TYPE_DOC,
		 TITRE,
		 DESCRIPTION)
	VALUES
		(99,
		 'Ventes',
		 'Bazoo',
		 'C',
		 'Bilan',
		 NULL);
--=====================================================================================
-- Projet 'Inventaire', 'GMC': 0 documents	
--=====================================================================================
-- Projet 'RH', 'KPMG': 3 documents
INSERT INTO
	DOCUMENT_PRJ
		(NO_DOCUMENT,
		 NOM_PROJET,
		 NOM_CLIENT,
		 TYPE_DOC,
		 TITRE,
		 DESCRIPTION)
	VALUES
		(1,
		 'RH',
		 'KPMG',
		 'A',
		 'Analyse',
		 NULL);
INSERT INTO
	DOCUMENT_PRJ
		(NO_DOCUMENT,
		 NOM_PROJET,
		 NOM_CLIENT,
		 TYPE_DOC,
		 TITRE,
		 DESCRIPTION)
	VALUES
		(2,
		 'RH',
		 'KPMG',
		 'P',
		 'Planification',
		  NULL);
INSERT INTO
	DOCUMENT_PRJ
		(NO_DOCUMENT,
		 NOM_PROJET,
		 NOM_CLIENT,
		 TYPE_DOC,
		 TITRE,
		 DESCRIPTION)
	VALUES
		(3,
		 'RH',
		 'KPMG',
		 'P',
		 'MRD',
		  NULL);
--=====================================================================================
-- Projet 'Pilotage', 'KPMG': 0 documents

COMMIT;

ALTER TABLE EMPLOYE
ADD -- column
	NO_SUPERVISEUR	SMALLINT	NULL;

ALTER TABLE EMPLOYE
ADD CONSTRAINT FK_EMPLOYE_SUPERVISEUR
					FOREIGN KEY (NO_SUPERVISEUR)
					REFERENCES EMPLOYE (NO_EMPLOYE);
					
----------------------					
					
UPDATE
	EMPLOYE
SET
	NO_SUPERVISEUR = 4
WHERE
	UPPER(NOM_DEPARTEMENT) = 'INFO';

UPDATE
	EMPLOYE
SET
	NO_SUPERVISEUR = 8
WHERE
	UPPER(NOM_DEPARTEMENT) = 'VENTE';
	
COMMIT;

ALTER TABLE EMPLOYE
  ADD COURRIEL VARCHAR2(50) NULL;

exit
/
