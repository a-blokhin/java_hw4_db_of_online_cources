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

INSERT INTO course (name)
VALUES ('Тестирование игровых проектов'),
       ('Разработка игр на Unity'),
       ('Java: от слов к делу');

insert into lecture (teacher_id, course_id, date, time)
SELECT  (select id from teacher where name = 'Иванов'), (select id from course where name = 'Разработка игр на Unity'), '2021-10-05', '18-00'
UNION
SELECT  (select id from teacher where name = 'Петров'), (select id from course where name = 'Разработка игр на Unity'), '2021-10-12', '18-00'
UNION
SELECT  (select id from teacher where name = 'Кошкин'), (select id from course where name = 'Java: от слов к делу'), '2021-10-06', '18-30'
UNION
SELECT  (select id from teacher where name = 'Дорофеев'), (select id from course where name = 'Java: от слов к делу'), '2021-10-13', '18-30'
UNION
SELECT  (select id from teacher where name = 'Кузнецов'), (select id from course where name = 'Тестирование игровых проектов'), '2021-10-07', '19-00'
UNION
SELECT  (select id from teacher where name = 'Сидоров'), (select id from course where name = 'Тестирование игровых проектов'), '2021-10-14', '19-00';

insert into course_teacher (teacher_id, course_id)
SELECT  (select id from teacher where name = 'Иванов'), (select id from course where name = 'Разработка игр на Unity')
UNION
SELECT  (select id from teacher where name = 'Петров'), (select id from course where name = 'Разработка игр на Unity')
UNION
SELECT  (select id from teacher where name = 'Кошкин'), (select id from course where name = 'Java: от слов к делу')
UNION
SELECT  (select id from teacher where name = 'Дорофеев'), (select id from course where name = 'Java: от слов к делу')
UNION
SELECT  (select id from teacher where name = 'Кузнецов'), (select id from course where name = 'Тестирование игровых проектов')
UNION
SELECT  (select id from teacher where name = 'Сидоров'), (select id from course where name = 'Тестирование игровых проектов');

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


insert into attendance_mark (student_id, course_id, lecture_id, attendance, hw_mark)
SELECT  (select id from student where name = 'Михайлов'), (select id from course where name = 'Разработка игр на Unity'),
        (select id from lecture where course_id = (select id from course where name = 'Разработка игр на Unity') and date = '2021-10-05'),
        1, 5
UNION
SELECT  (select id from student where name = 'Михайлов'), (select id from course where name = 'Разработка игр на Unity'),
        (select id from lecture where course_id = (select id from course where name = 'Разработка игр на Unity') and date = '2021-10-12'),
        1, 10
UNION
SELECT  (select id from student where name = 'Карпов'), (select id from course where name = 'Разработка игр на Unity'),
        (select id from lecture where course_id = (select id from course where name = 'Разработка игр на Unity') and date = '2021-10-05'),
        1, 9
UNION
SELECT  (select id from student where name = 'Карпов'), (select id from course where name = 'Разработка игр на Unity'),
        (select id from lecture where course_id = (select id from course where name = 'Разработка игр на Unity') and date = '2021-10-12'),
        0, 7
UNION
SELECT  (select id from student where name = 'Кулаков'), (select id from course where name = 'Java: от слов к делу'),
        (select id from lecture where course_id = (select id from course where name = 'Java: от слов к делу') and date = '2021-10-06'),
        1, 9
UNION
SELECT  (select id from student where name = 'Кулаков'), (select id from course where name = 'Java: от слов к делу'),
        (select id from lecture where course_id = (select id from course where name = 'Java: от слов к делу') and date = '2021-10-13'),
        1, 8
UNION
SELECT  (select id from student where name = 'Матвеев'), (select id from course where name = 'Java: от слов к делу'),
        (select id from lecture where course_id = (select id from course where name = 'Java: от слов к делу') and date = '2021-10-06'),
        1, 10
UNION
SELECT  (select id from student where name = 'Матвеев'), (select id from course where name = 'Java: от слов к делу'),
        (select id from lecture where course_id = (select id from course where name = 'Java: от слов к делу') and date = '2021-10-13'),
        1, 5
UNION
SELECT  (select id from student where name = 'Тихонов'), (select id from course where name = 'Тестирование игровых проектов'),
        (select id from lecture where course_id = (select id from course where name = 'Тестирование игровых проектов') and date = '2021-10-07'),
        1, 10
UNION
SELECT  (select id from student where name = 'Тихонов'), (select id from course where name = 'Тестирование игровых проектов'),
        (select id from lecture where course_id = (select id from course where name = 'Тестирование игровых проектов') and date = '2021-10-14'),
        1, 10
UNION
SELECT  (select id from student where name = 'Волков'), (select id from course where name = 'Тестирование игровых проектов'),
        (select id from lecture where course_id = (select id from course where name = 'Тестирование игровых проектов') and date = '2021-10-07'),
        0, 10
UNION
SELECT  (select id from student where name = 'Волков'), (select id from course where name = 'Тестирование игровых проектов'),
        (select id from lecture where course_id = (select id from course where name = 'Тестирование игровых проектов') and date = '2021-10-14'),
        0, 10
