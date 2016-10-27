--Jefferson Zhumi
--CIS 205
--Assignment:Student Course Registration

1.

SELECT distinct S.fName, s.lName
FROM student S, registration R, course C
WHERE S.sid = R.sid AND R.crn = C.crn
AND (C.dept ='CIS' OR C.dept ='HIS');

2.

SELECT S1.fName, s1.lName
FROM Student S1, Registration R1, Course C1
WHERE S1.sid = R1.sid AND R1.crn = C1.crn AND c1.dept ="CIS"
AND S1.sid IN (SELECT S2.sid From Student S2, Registration R2, course C2
WHERE S2.sid = R2.sid AND R2.crn = C2.crn AND c2.dept ="HIS"); 

3.

SELECT distinct S1.fName, s1.lName
FROM Student S1, Registration R1, Course C1
WHERE S1.sid = R1.sid AND R1.crn = C1.crn
AND c1.dept ="CIS"
AND S1.sid Not IN (SELECT S2.sid From Student S2, Registration R2, course C2
WHERE S2.sid = R2.sid AND R2.crn = C2.crn AND c2.dept ="HIS");

