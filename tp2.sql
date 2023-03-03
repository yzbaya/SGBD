GRANT SELECT ON employees TO tpsgbd ;

CREATE TABLE employe AS SELECT * from employees ;

select * from employe;


SET SERVEROUTPUT ON 
 DECLARE
   v_numEmp NUMBER := &numEmp; 
   enregistrement emlpoye%ROWTYPE;
 BEGIN
  select * into enregistrement 
  FROM employe where employe.employee_id = v_numEmp ;

    DBMS_OUTPUT.PUT_LINE( enregistrement.first_name); 

 END;


DECLARE

v_numEmp NUMBER := &numEmp;
   enregistrement emlpoye%ROWTYPE;
 BEGIN
  select * into enregistrement 
  FROM employe where employe.employee_id = v_numEmp ;

    DBMS_OUTPUT.PUT_LINE( enregistrement.first_name); 

 END;
 
 DECLARE
  v_salary NUMBER(10,2);
  v_commission NUMBER(10,2);
  v_annual_salary NUMBER(10,2);
BEGIN
  SELECT salary, commission_pct INTO v_salary, v_commission FROM employe WHERE
  first_name = 'Tayler' AND last_name = 'Fox';
  
  v_annual_salary := (v_salary * 12) + (v_salary * 12 * v_commission);

  DBMS_OUTPUT.PUT_LINE('Le salaire annuel de Tayler Fox est : ' || v_annual_salary);
END;









