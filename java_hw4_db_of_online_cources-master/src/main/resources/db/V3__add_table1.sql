CREATE TABLE timetable_of_week
(
    course_id     INT     NOT NULL REFERENCES course (id)  ON UPDATE CASCADE ON DELETE CASCADE,
    day_of_week VARCHAR NOT NULL,
    time        VARCHAR NOT NULL
);

INSERT INTO timetable_of_week (course_id, day_of_week, time)
select (select id from course where name = 'Тестирование игровых проектов'), 'Thursday', '19-00'
UNION
select (select id from course where name = 'Разработка игр на Unity'), 'Tuesday', '18-00'
UNION
select (select id from course where name = 'Java: от слов к делу'), 'Wednesday', '18-30';