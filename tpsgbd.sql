SET SERVEROUTPUT ON 
DECLARE
  v_num1 NUMBER := &num1; 
  v_num2 NUMBER := &num2; 
  v_result NUMBER;
BEGIN
  v_result := (v_num1 * v_num2);
  DBMS_OUTPUT.PUT_LINE('Le résultat est : ' || v_result); 
END;


drop table jouer;
drop table acteur;
drop table film;

CREATE TABLE ACTEUR
  (
    CODEA       NUMBER(4,0),
    NOM         VARCHAR2(30 BYTE),
    NATIONALITE VARCHAR2(30 BYTE),
    AGE         NUMBER(2,0),
    SEXE        CHAR(1 BYTE),
    CONSTRAINT ACTEUR_CK CHECK (age> 0) ,
    CONSTRAINT ACTEUR_PK PRIMARY KEY (CODEA),
    CONSTRAINT ACTEUR_CK2 CHECK (sexe IN ('M', 'F')) 
  );
  
Insert into ACTEUR  values (1000,'Daniel Craig','Britannique',47,'M');
Insert into ACTEUR  values (1001,'Lotfi Abdelli','Tunisienne',45,'M');
Insert into ACTEUR  values (1002,'Samy Naceri','Française',54,'M');
Insert into ACTEUR  values (1003,'Mouna Noureddine','Tunisienne',78,'F');
Insert into ACTEUR  values (1004,'Aicha Attia','Tunisienne',28,'F');
Insert into ACTEUR  values (1005,'Penelope Cruz','Espagnole',42,'F');
Insert into ACTEUR  values (1006,'Hichem Rostom','Tunisienne',70,'M');

CREATE TABLE film
  (
    codeF NUMBER(3),
    titre VARCHAR2(30),
    date_sortie date default sysdate,
    pays VARCHAR2(30),
    realisateur VARCHAR2(30),
    genre VARCHAR2(30), 
    CONSTRAINT film_pk PRIMARY KEY (codeF) ,
    CONSTRAINT film_ck CHECK (genre IN ('Action', 'Drame', 'Horreur', 'Comédie', 'Western')) 
  );
  
  CREATE TABLE jouer
  (
    codeA NUMBER(4),
    codeF NUMBER(3),
    salaire NUMBER(10,3),
    CONSTRAINT jouer_pk PRIMARY KEY (codeA,codeF),
    CONSTRAINT jouer_fk1 FOREIGN KEY (codeA) REFERENCES acteur ON DELETE CASCADE,
    CONSTRAINT jouer_fk2 FOREIGN KEY (codeF) REFERENCES film ON DELETE CASCADE,
    CONSTRAINT jouer_ck CHECK (salaire > 0) 
  );
  
  
  
  -- insertion dans Film
Insert into FILM values (100,'Spectre','06/10/15','UK-US','Sam Mendes','Action');
Insert into FILM values (101,'Taxi','08/04/98','France','Gérard Pirès','Comédie');
Insert into FILM values 
(102,'Les frontières du ciel','03/12/15','Tunisie','Fares Naanaa','Drame');
Insert into FILM values (103,'Sahara','04/04/05','US','Breck Eisner','Action');
Insert into FILM values 
(104,'Or noir','07/11/11','France','Jean-Jacques Annaud','Drame');
Insert into FILM values 
(105,'Dream House','05/11/11','US','Jim Sheridan','Horreur');
Insert into FILM values
 (106,'Making of','10/06/08','Tunisie','Nouri Bouzid','Drame');
-- insertion dans Jouer
Insert into JOUER values (1001,102,2500);
Insert into JOUER values (1002,101,5000);
Insert into JOUER values (1000,100,null);
Insert into JOUER values (1006,103,250);
Insert into JOUER values (1005,104,4300);
Insert into JOUER values (1001,106,1050);
Insert into JOUER values (1000,105,3900);


desc Film;
select * from Film ;

select * from acteur;
select Max(age) from acteur ;

select * from jouer;

select sum (salaire) from jouer;




SET SERVEROUTPUT ON 
DECLARE
  natio VARCHAR2(30) := '& natio'; 
  salaire number :=0;
BEGIN
  select SUM(salaire) into salaire from jouer inner join acteur on jouer.codea = acteur.codea where nationalite= natio;
  DBMS_OUTPUT.PUT_LINE('La somme de salaire de la nationalite : '  || natio || ' est ' || salaire); 
END;


CREATE TABLE employe AS SELECT * from hr.employees ;



select * from Film ;

 