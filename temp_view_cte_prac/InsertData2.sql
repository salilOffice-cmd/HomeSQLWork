-- Create students table
CREATE TABLE students (
    student_id INT PRIMARY KEY IDENTITY(1,1),
    student_name VARCHAR(255),
    date_of_birth DATE
);

-- Create courses table
CREATE TABLE courses (
    course_id INT PRIMARY KEY IDENTITY(1,1),
    course_name VARCHAR(255)
);

-- Create enrollments table
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Insert some sample data into students table
INSERT INTO students (student_name, date_of_birth) VALUES
('John Doe', '2000-01-15'),
('Jane Smith', '1999-05-20'),
('Bob Johnson', '2001-03-05'),
('Emma Davis', '1998-07-10'),
('Andrew Brown', '2000-11-25'),
('Olivia Green', '1999-09-03'),
('Daniel Turner', '2001-02-18'),
('Sophia Anderson', '1998-04-30'),
('Grace Turner', '1997-08-15'),
('Liam Wilson', '2002-01-25'),
('Ava Brown', '2003-04-10');

-- Insert some sample data into courses table
INSERT INTO courses (course_name) VALUES
('Mathematics'),
('History'),
('Computer Science'),
('English');

-- Enroll students into courses
INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2023-01-01'),
(1, 3, '2023-02-15'),
(2, 2, '2023-03-01'),
(2, 4, '2023-04-01'),
(3, 3, '2023-05-15'),
(3, 1, '2023-06-01'),
(4, 1, '2023-06-15'),
(5, 2, '2023-07-01'),
(1, 4, '2023-08-10'),
(2, 3, '2023-09-05'),
(3, 4, '2023-10-15'),
(4, 2, '2023-11-01'),
(5, 1, '2023-12-01'),
(1, 3, '2024-01-15'),
(2, 4, '2024-02-01'),
(3, 1, '2024-03-10');
