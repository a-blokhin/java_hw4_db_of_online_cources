INSERT INTO teacher (name, work_place)
VALUES ('Иванов', 'myTarget'),
       ('Петров', 'Маруся'),
       ('Кошкин', 'Маруся'),
       ('Дорофеев', 'ТамТам'),
       ('Кузнецов', 'SuperAppKit'),
       ('Сидоров', 'Юла');

INSERT INTO student (name, study_place)
VALUES ('Михайлов', 'ВШЭ'),
       ('Карпов', 'МГУ'),
       ('Кулаков', 'МФТИ'),
       ('Матвеев', 'ВШЭ'),
       ('Тихонов', 'МГУ'),
       ('Волков', 'МФТИ');

INSERT INTO course (name, specification)
VALUES ('Тестирование игровых проектов', 'Автоматизация процессов и особенности тестирования мобильных и консольных приложений.'),
       ('Разработка игр на Unity', 'Инструменты, которые используют разработчики игр, и создание прототипа собственной игры.'),
       ('Java: от слов к делу', 'Работа с БД с использованием jOOQ. Практические знания, необходимые для создания HTTP-серверов и REST API.');

insert into lecture (course_id, date)
SELECT  (select id from course where name = 'Разработка игр на Unity'), TO_TIMESTAMP('10-05-21 18:00', 'MM-DD-YY HH24:MI')
UNION
SELECT  (select id from course where name = 'Разработка игр на Unity'), TO_TIMESTAMP('10-12-21 18:00', 'MM-DD-YY HH24:MI')
UNION
SELECT  (select id from course where name = 'Java: от слов к делу'), TO_TIMESTAMP('10-06-21 18:30', 'MM-DD-YY HH24:MI')
UNION
SELECT  (select id from course where name = 'Java: от слов к делу'), TO_TIMESTAMP('10-13-21 18:30', 'MM-DD-YY HH24:MI')
UNION
SELECT  (select id from course where name = 'Тестирование игровых проектов'), TO_TIMESTAMP('10-07-21 19:00', 'MM-DD-YY HH24:MI')
UNION
SELECT  (select id from course where name = 'Тестирование игровых проектов'), TO_TIMESTAMP('10-14-21 19:00', 'MM-DD-YY HH24:MI');

insert into lecture_teacher (teacher_id, lecture_id)
SELECT  (select id from teacher where name = 'Иванов'),
        (select id from lecture where course_id = (select id from course where name = 'Разработка игр на Unity') and date = '2021-10-05 18:00')
UNION
SELECT  (select id from teacher where name = 'Петров'),
        (select id from lecture where course_id = (select id from course where name = 'Разработка игр на Unity') and date = '2021-10-12 18:00')
UNION
SELECT  (select id from teacher where name = 'Кошкин'),
        (select id from lecture where course_id = (select id from course where name = 'Java: от слов к делу') and date = '2021-10-06 18:30')
UNION
SELECT  (select id from teacher where name = 'Дорофеев'),
        (select id from lecture where course_id = (select id from course where name = 'Java: от слов к делу') and date = '2021-10-13 18:30')
UNION
SELECT  (select id from teacher where name = 'Кузнецов'),
        (select id from lecture where course_id = (select id from course where name = 'Тестирование игровых проектов') and date = '2021-10-07 19:00')
UNION
SELECT  (select id from teacher where name = 'Сидоров'),
        (select id from lecture where course_id = (select id from course where name = 'Тестирование игровых проектов') and date = '2021-10-14 19:00');

insert into course_student (student_id, course_id)
SELECT  (select id from student where name = 'Михайлов'), (select id from course where name = 'Разработка игр на Unity')
UNION
SELECT  (select id from student where name = 'Карпов'), (select id from course where name = 'Разработка игр на Unity')
UNION
SELECT  (select id from student where name = 'Кулаков'), (select id from course where name = 'Java: от слов к делу')
UNION
SELECT  (select id from student where name = 'Матвеев'), (select id from course where name = 'Java: от слов к делу')
UNION
SELECT  (select id from student where name = 'Тихонов'), (select id from course where name = 'Тестирование игровых проектов')
UNION
SELECT  (select id from student where name = 'Волков'), (select id from course where name = 'Тестирование игровых проектов');


insert into attendance_mark (student_id, lecture_id, attendance, hw_mark)
SELECT  (select id from student where name = 'Михайлов'),
        (select id from lecture where course_id = (select id from course where name = 'Разработка игр на Unity') and date = '2021-10-05 18:00'),
        TRUE, 5
UNION
SELECT  (select id from student where name = 'Михайлов'),
        (select id from lecture where course_id = (select id from course where name = 'Разработка игр на Unity') and date = '2021-10-12 18:00'),
        TRUE, 10
UNION
SELECT  (select id from student where name = 'Карпов'),
        (select id from lecture where course_id = (select id from course where name = 'Разработка игр на Unity') and date = '2021-10-05 18:00'),
        TRUE, 9
UNION
SELECT  (select id from student where name = 'Карпов'),
        (select id from lecture where course_id = (select id from course where name = 'Разработка игр на Unity') and date = '2021-10-12 18:00'),
        FALSE, 7
UNION
SELECT  (select id from student where name = 'Кулаков'),
        (select id from lecture where course_id = (select id from course where name = 'Java: от слов к делу') and date = '2021-10-06 18:30'),
        TRUE, 9
UNION
SELECT  (select id from student where name = 'Кулаков'),
        (select id from lecture where course_id = (select id from course where name = 'Java: от слов к делу') and date = '2021-10-13 18:30'),
        TRUE, 8
UNION
SELECT  (select id from student where name = 'Матвеев'),
        (select id from lecture where course_id = (select id from course where name = 'Java: от слов к делу') and date = '2021-10-06 18:30'),
        TRUE, 10
UNION
SELECT  (select id from student where name = 'Матвеев'),
        (select id from lecture where course_id = (select id from course where name = 'Java: от слов к делу') and date = '2021-10-13 18:30'),
        TRUE, 5
UNION
SELECT  (select id from student where name = 'Тихонов'),
        (select id from lecture where course_id = (select id from course where name = 'Тестирование игровых проектов') and date = '2021-10-07 19:00'),
        TRUE, 10
UNION
SELECT  (select id from student where name = 'Тихонов'),
        (select id from lecture where course_id = (select id from course where name = 'Тестирование игровых проектов') and date = '2021-10-14 19:00'),
        TRUE, 10
UNION
SELECT  (select id from student where name = 'Волков'),
        (select id from lecture where course_id = (select id from course where name = 'Тестирование игровых проектов') and date = '2021-10-07 19:00'),
        FALSE, 10
UNION
SELECT  (select id from student where name = 'Волков'),
        (select id from lecture where course_id = (select id from course where name = 'Тестирование игровых проектов') and date = '2021-10-14 19:00'),
        FALSE, 10
