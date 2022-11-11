select *from unit;
select *from enrolment;
select *from student;
select *from audit_log;


CREATE OR REPLACE TRIGGER unit_upd_cascade AFTER
    UPDATE OF unit_code ON unit
    FOR EACH ROW
BEGIN
    UPDATE enrolment e
    SET
        e.unit_code = :new.unit_code
    WHERE
        e.unit_code = :old.unit_code;

END;
/


select * from enrolment;


update unit u set 
u.unit_code = 'FIT2004'
where u.unit_code = 'FIT9132';



CREATE OR REPLACE TRIGGER MAINTAIN_ENROLMENT 
after insert or DELETE ON ENROLMENT 
FOR EACH ROW    
BEGIN
    if inserting then
    update unit u set u.unit_no_student = u.unit_no_student +1
    where u.unit_code = :new.unit_code;
    end if;
    if deleting then
    update unit u set u.unit_no_student = u.unit_no_student -1
    where u.unit_code = :old.unit_code;
    end if;
END;
/


select * from enrolment;
INSERT INTO enrolment (
    stu_nbr,
    unit_code,
    enrol_year,
    enrol_semester,
    enrol_mark,
    enrol_grade
) VALUES (
    11111122,
    'FIT5057',
    2021,
    2,
    80,
    null
);

select * from enrolment;

DELETE FROM enrolment
WHERE
        stu_nbr = 11111122
    AND unit_code = 'FIT5057';
--    AND enrol_year = 2021
--    AND enrol_semester = 2
--    AND enrol_mark = 80
--    AND enrol_grade = null;
rollback;







