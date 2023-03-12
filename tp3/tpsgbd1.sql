SET SERVEROUTPUT ON 
DECLARE
    temperature NUMBER;
BEGIN
temperature := &entrer_temperature;
    IF (temperature <= 0) THEN
        DBMS_OUTPUT.PUT_LINE('Leau est solide');
    ELSIF (temperature < 100) THEN
        DBMS_OUTPUT.PUT_LINE('Leau est liquide ');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Leau est gazeuse');
    END IF;
END;



SET SERVEROUTPUT ON 
DECLARE
   codeAc NUMBER:= &entrer_codeAc;
    NomA VARCHAR2(20);
    sexe VARCHAR2(20);
BEGIN

  select Nom,sexe INTO NomA,sexe from acteur where codeAc=codea;
  
  case sexe
    when 'F' then
      DBMS_OUTPUT.PUT_LINE('L''actrice ' || nomA);
    else
      DBMS_OUTPUT.PUT_LINE('L''acteur ' || nomA);
  end case;
END;

SET SERVEROUTPUT ON 
declare 
   codeAc NUMBER:= &entrer_codeAc;
   NomA VARCHAR2(20);
   ageA number;
   ageAc number:=&entrer_ageA;
  BEGIN 
   select nom,age into NomA,ageA from acteur where codeAc=codea;
   if (ageAc=ageA) then
    DBMS_OUTPUT.PUT_LINE('oui l"age de '||NomA || ' est vrai');
    else 
    DBMS_OUTPUT.PUT_LINE('faux');
     END IF;
  END;



ALTER TABLE Film ADD (nbEntrees  NUMBER(10));

SET SERVEROUTPUT ON 
DECLARE
  codefilm NUMBER;
   nb NUMBER(10); 
BEGIN
  FOR i IN (select * FROM film) LOOP
    nb := DBMS_RANDOM.value(low => 100000, high => 10000000);
    update Film set nbEntrees = nb where codef=i.codef ;
  END LOOP;
END;


select * from film ;














CREATE TABLE RES
  (
    NO       NUMBER(4,0),
    CONSTRAINT RES_PK PRIMARY KEY (NO)
  );
  
SET SERVEROUTPUT ON 
 DECLARE
  chiffre number:=&entrer_chiffre;
  BEGIN 
  if (chiffre>0)then 
  INSERT INTO RES VALUES (chiffre);
  else
  DBMS_OUTPUT.PUT_LINE('donner un autre chiffre');
  END IF;
  END;
  
  
SET SERVEROUTPUT ON 
 DECLARE
 Numero number:=&entrer_nb;
 facto number:=1;
 begin
 while (Numero>0)loop
 facto:=Numero*facto;
  end LOOP;
 DBMS_OUTPUT.PUT_LINE(facto);
 end;
  
  select * from RES ;
  
  
  CREATE TABLE pos
  (
    nb       NUMBER(4,0),
    CONSTRAINT pos_PK PRIMARY KEY (nb)
  );
  
  
  CREATE TABLE neg
  (
    nb       NUMBER(4,0),
    CONSTRAINT neg_PK PRIMARY KEY (nb)
  );
  
  
  
  
 SET SERVEROUTPUT ON  
  DECLARE
  nbP NUMBER := 1;
  nbN NUMBER := -2;
BEGIN
  INSERT INTO pos(nb) VALUES(nbP);
  INSERT INTO neg(nb) VALUES(nbN);
END;



SET SERVEROUTPUT ON  
DECLARE
  chiff number:=&entrer_chiffre;
BEGIN
  WHILE chiff <= 100 LOOP
    INSERT INTO res(no) VALUES(chiff);
  END LOOP;
END;


ALTER TABLE res ADD nb NUMBER;
DECLARE
  somme NUMBER := 0;
BEGIN
  FOR i IN 1000..10000 LOOP
    somme := somme + i;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE(somme);
END;


select * from res;
SET SERVEROUTPUT ON  
declare
   Maximum Number ;
   Minimum number;
begin
   select max(no),min(no) into Maximum ,Minimum from res;
   DBMS_OUTPUT.PUT_line(Maximum);
    DBMS_OUTPUT.PUT_line(Minimum);
end;