select * from acteur;

/--Ex1--/
SET SERVEROUTPUT ON 
declare
cursor natio is select nationalite from acteur;
v_natio acteur.nationalite%TYPE;
begin
open natio;
LOOP
fetch natio into v_natio;
EXIT WHEN natio%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(v_natio);
END loop;
close natio;
end;


SET SERVEROUTPUT ON 
declare
cursor natio is select DISTINCT nationalite from acteur;
begin

 for natioF in natio LOOP
   DBMS_OUTPUT.PUT_LINE(natioF.nationalite);
 END loop;
end;


/--Ex2--/
select * from film;

select * from acteur;

select * from jouer;

SET SERVEROUTPUT ON 
declare
  cursor ListeAc is select a.nom from acteur a inner join jouer j on a.codea=j.codea
  group by a.nom having count(DISTINCT j.codef) >= 2;
  ac_nom acteur.nom%type;
begin
    open ListeAc;
    loop
      fetch ListeAc into ac_nom;
      exit when ListeAc%notfound;
      DBMS_OUTPUT.PUT_LINE(ac_nom);
      end loop;
    close ListeAc;
end;

/--Ex3--/

/--set SERVEROUTPut on 
/--declare
 /-- paysf varchar(30):= '&entrer_pays';
/-- type t_film IS TABLE OF VARCHAR2(100);
 /--cursor tMovies (p_pays varchar) is select titre from film where paysf=pays;
 /--i number;
/--begin
/-- i:=i+1;
/--open tMovies (paysf ) ;
 /--  loop fetch tMovies into t_film(i);
 /--  i:=i+1;
 /-- DBMS_OUTPUT.PUT_LINE(t_film(i));
 /--close tMovies;
/--end loop;
/--end;



SET SERVEROUTPUT ON 

DECLARE
  TYPE film IS TABLE OF VARCHAR2(100) INDEX BY BINARY_INTEGER;
  movies film;
  pays VARCHAR2(50) := '&pays'; -- variable de substitution pour le pays
  i INTEGER := 1; -- initialisation de l'indice pour la table movies
  
  CURSOR c3 (p_pays VARCHAR2) IS -- correction du paramètre du curseur
    SELECT titre FROM film
    WHERE pays = p_pays;
BEGIN
  -- initialisation de la table movies
  FOR j IN 1..movies.COUNT LOOP
    movies(j) := NULL;
  END LOOP;
  
  OPEN c3(pays);
  LOOP
    FETCH c3 INTO movies(i);
    EXIT WHEN c3%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(movies(i));
    i := i+1;
  END LOOP;
  CLOSE c3;
END;

select * from film;


