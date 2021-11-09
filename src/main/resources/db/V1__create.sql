CREATE TABLE teacher
(
    id         SERIAL  NOT NULL,
    name       VARCHAR NOT NULL,
    work_place VARCHAR NOT NULL,
    CONSTRAINT teacher_pk PRIMARY KEY (id)
);

CREATE TABLE student
(
    id          SERIAL  NOT NULL,
    name        VARCHAR NOT NULL,
    study_place VARCHAR NOT NULL,
    CONSTRAINT student_pk PRIMARY KEY (id)
);

CREATE TABLE course
(
    id   SERIAL  NOT NULL,
    name VARCHAR NOT NULL,
    specification VARCHAR NOT NULL,
    CONSTRAINT course_pk PRIMARY KEY (id)
);

CREATE TABLE lecture
(
    id          SERIAL NOT NULL,
    course_id   INT    NOT NULL REFERENCES course (id) ON UPDATE CASCADE ON DELETE CASCADE,
    date        TIMESTAMP without time zone    NOT NULL,
    CONSTRAINT lecture_pk PRIMARY KEY (id)
);

CREATE TABLE lecture_teacher
(
    teacher_id INT NOT NULL REFERENCES teacher (id) ON UPDATE CASCADE ON DELETE CASCADE,
    lecture_id INT NOT NULL REFERENCES lecture (id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE course_student
(
    course_id   INT NOT NULL REFERENCES course (id) ON UPDATE CASCADE ON DELETE CASCADE,
    student_id   INT NOT NULL REFERENCES student (id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE attendance_mark
(
    student_id   INT NOT NULL REFERENCES student (id) ON UPDATE CASCADE ON DELETE CASCADE,
    lecture_id INT NOT NULL REFERENCES lecture (id) ON UPDATE CASCADE ON DELETE CASCADE,
    attendance BOOLEAN NOT NULL,
    hw_mark    INT NOT NULL,
    CONSTRAINT attendance_mark_pk PRIMARY KEY (student_id, lecture_id)
);
