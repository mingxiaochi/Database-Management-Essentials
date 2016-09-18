-- 2.
SELECT empname, department, email, phone
FROM Employee
WHERE phone LIKE '3%';

-- 3.
SELECT *
FROM ResourceTbl
WHERE rate BETWEEN 10 AND 20
ORDER BY rate;

-- 4.
SELECT eventno, status, dateauth
FROM EventRequest
WHERE (status IN ('Approved', 'Denied')) and (dateauth BETWEEN '01-Jul-2013' AND '31-Jul-2013');

-- 5.
SELECT locno, locname
FROM Location INNER JOIN Facility
ON Location.facno=Facility.facno
WHERE Facility.facname='Basketball arena';

-- 6.
SELECT planno, COUNT(lineno), SUM(numberfld)
FROM EventPlanLine
GROUP BY planno;

-- Week3 practice problem2
-- 1.
SELECT eventno, dateheld, Facilicy.facno, Customer.custno, custname, facname
FROM EventRequest INNER JOIN Customer ON EventRequest.custno=Customer.custno, 
EventRequest INNER JOIN Facilicy ON Facilicy.facno=EventRequest.facno
WHERE city='Boulder'
AND dateheld BETWEEN '1-Jan-2013' AND '31-Dec-2013';
SELECT EventNo, DateHeld, Customer.CustNo, CustName,
               Facility.FacNo, FacName
  FROM EventRequest, Customer, Facility
  WHERE City = 'Boulder' AND DateHeld BETWEEN '1-Jan-2013' AND '31-Dec-2013'
        AND EventRequest.CustNo = Customer.CustNo 
        AND EventRequest.FacNo = Facility.FacNo;ORA-00942: table or view does not exist
SELECT EventRequest.eventno, EventRequest.dateheld, Facility.facno, Customer.custno, Customer.custname, Facility.facname
FROM EventRequest INNER JOIN Customer ON EventRequest.custno=Customer.custno, 
EventRequest INNER JOIN Facility ON Facility.facno=EventRequest.facno
WHERE Customer.city='Boulder'
AND EventRequest.dateheld BETWEEN '1-Jan-2013' AND '31-Dec-2013';
SELECT EventRequest.eventno, EventRequest.dateheld, Facility.facno, Customer.custno, Customer.custname, Facility.facname
FROM EventRequest INNER JOIN Customer ON EventRequest.custno=Customer.custno, 
EventRequest INNER JOIN Facility ON Facility.facno=EventRequest.facno
WHERE Customer.city='Boulder'
AND EventRequest.dateheld BETWEEN '1-Jan-2013' AND '31-Dec-2013';

-- 2.
SELECT EventRequest.eventno, EventRequest.dateheld, EventRequest.facno, EventRequest.custno, Customer.custname, Facilicy.facname, (estcost/estaudience) AS estcostperperson
FROM EventRequest, Customer, Facilicy
WHERE Facilicy.facno=EventRequest.facno
AND EventRequest.custno=Customer.custno
AND EventRequest.dateheld BETWEEN '1-Jan-2013' AND '31-Dec-2013';
HAVING (estcost/estaudience) AS estcostperperson<0.2;

-- 3.
SELECT Customer.custno, Customer.custname, SUM(estcost) AS totalcost
FROM Customer INNER JOIN EventRequest
ON Customer.custno=EventRequest.custno
WHERE status='Approved'
GROUP BY Customer.custno, Customer.custname;

-- 4.
INSERT INTO Customer (custno,custname,address,internal,contact,phone,city,state,zip)
VALUES ('123','christina','wilshire','y','sam','2134793','la','ca','90010');

-- Week 3 quiz 2
-- 1.
SELECT EventRequest.eventno, EventRequest.dateheld, COUNT(EventPlan.planno)
FROM EventRequest INNER JOIN EventPlan
ON EventRequest.eventno=EventPlan.eventno
WHERE EventPlan.workdate BETWEEN '01-dec-2013' AND '31-dec-2013'
GROUP BY EventRequest.eventno, EventRequest.dateheld
HAVING COUNT(EventPlan.planno)>1;

-- 2.
SELECT EventPlan.eventno, EventPlan.planno, EventPlan.workdate, EventPlan.activity
FROM EventRequest, EventPlan, Facility
WHERE EventRequest.eventno=EventPlan.eventno 
AND EventRequest.facno=Facility.facno
AND EventPlan.workdate BETWEEN '01-dec-2013' AND '31-dec-2013'
AND Facility.facname='Basketball arena';

-- 3.
SELECT EventRequest.eventno, EventRequest.dateheld, EventRequest.status, EventRequest.estcost
FROM EventRequest, EventPlan, Facility, Employee
WHERE EventRequest.eventno=EventPlan.eventno 
AND EventRequest.facno=Facility.facno
AND EventPlan.empno=Employee.empno
AND EventRequest.dateheld BETWEEN '01-oct-2013' AND '31-dec-2013'
AND Facility.facname='Basketball arena'
AND Employee.empname='Mary Manager'

-- 4.
SELECT EventPlanLine.planno, EventPlanLine.lineno, ResourceTbl.resname, EventPlanLine.NumberFld, Location.locname, EventPlanLine.timestart, EventPlanLine.timeend
FROM EventPlanLine, ResourceTbl, Location, Facility, EventPlan,EventRequest
WHERE Facility.facno=Location.facno
AND Location.locno=EventPlanLine.locno
AND EventPlanLine.resno=ResourceTbl.resno
AND EventPlanLine.planno=EventPlan.planno
AND EventPlan.eventno=EventRequest.eventno
AND EventRequest.dateheld BETWEEN '01-oct-2013' AND '31-dec-2013'
AND Facility.facname='Basketball arena'
AND EventPlan.activity='Operation'

-- 5.
INSERT INTO Facility (facno, facname)
VALUES ('F104','Swimming Pool')

-- 6.
INSERT INTO Location (locno,facno,locname)
VALUES ('L107','F104','Door')

-- 7.
INSERT INTO Location (locno,facno,locname)
VALUES ('L108','F104','Locker Room')

-- 8.
UPDATE Location
SET locname='Gate'
WHERE locno='L107'

-- 9.
DELETE FROM Location
WHERE locno='L108';
