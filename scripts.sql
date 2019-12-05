USE [ExaminationSystemDB]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 11/30/2019 5:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Body] [nvarchar](200) NULL,
	[QuestionID] [int] NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 11/30/2019 5:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOt NULL UNIQUE,
	[Description] [nvarchar](700) NULL,
	[DepartmentID] [int] NULL,
	[InstructorID] [int] NULL,
	[Photo] [varchar](1000) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses_Students]    Script Date: 11/30/2019 5:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses_Students](
	[CourseID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[Grade] [int] NULL,
 CONSTRAINT [PK_Courses_Students] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC,
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 11/30/2019 5:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL UNIQUE,
	[Photo] [varchar](1000) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exams]    Script Date: 11/30/2019 5:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exams](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Duration] [int] NULL,
	[CreationDateTime] [datetime] NULL,
	[CourseID] [int] NULL,
	[TFQuestionsNumber] [int] NULL,
	[MCQQuestionsNumber] [int] NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exams_Questions]    Script Date: 11/30/2019 5:00:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exams_Questions](
	[ExamID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
 CONSTRAINT [PK_Exams_Questions] PRIMARY KEY CLUSTERED 
(
	[ExamID] ASC,
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructors]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) Not NULL,
	[Username] [nvarchar](200) not NULL UNIQUE,
	[Password] [nvarchar](100)not NULL,
	[DepartmentID] [int] NULL,
	[IsAdmin] [bit] NULL,
	[Photo] [varchar](500) NULL,
	[Bio] [nvarchar](700) NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question_Types]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_Types](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Question_Types] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Body] [nvarchar](500) Not NULL,
	[CourseID] [int] NULL,
	[TypeID] [int] NULL,
	[Right_AnswerID] [int] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) not NULL,
	[Username] [nvarchar](200) not NULL UNIQUE,
	[Password] [nvarchar](200) not NULL UNIQUE,
	[DepartmentID] [int] NULL,
	[Photo] [varchar](500) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students_Exams_Answers]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students_Exams_Answers](
	[StudentID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[ExamID] [int] NOT NULL,
	[AnswerID] [int] NULL,
	[Grade] [int] NULL,
 CONSTRAINT [PK_Students_Exams_Answers] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[QuestionID] ASC,
	[ExamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) not NULL UNIQUE,
	[CourseID] [int] NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exams] ADD  CONSTRAINT [DF_Exams_CreationDateTime]  DEFAULT (getdate()) FOR [CreationDateTime]
GO
ALTER TABLE [dbo].[Instructors] ADD  CONSTRAINT [DF_Instructors_IsAdmin]  DEFAULT ((0)) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Questions] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Questions]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Departments]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Instructors] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Instructors] ([ID])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Instructors]
GO
ALTER TABLE [dbo].[Courses_Students]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Students_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Courses_Students] CHECK CONSTRAINT [FK_Courses_Students_Courses]
GO
ALTER TABLE [dbo].[Courses_Students]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Students_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([ID])
GO
ALTER TABLE [dbo].[Courses_Students] CHECK CONSTRAINT [FK_Courses_Students_Students]
GO
ALTER TABLE [dbo].[Exams]  WITH CHECK ADD  CONSTRAINT [FK_Exams_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exams] CHECK CONSTRAINT [FK_Exams_Courses]
GO
ALTER TABLE [dbo].[Exams_Questions]  WITH CHECK ADD  CONSTRAINT [FK_Exams_Questions_Exams] FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exams] ([ID])
GO
ALTER TABLE [dbo].[Exams_Questions] CHECK CONSTRAINT [FK_Exams_Questions_Exams]
GO
ALTER TABLE [dbo].[Exams_Questions]  WITH CHECK ADD  CONSTRAINT [FK_Exams_Questions_Questions] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exams_Questions] CHECK CONSTRAINT [FK_Exams_Questions_Questions]
GO
ALTER TABLE [dbo].[Instructors]  WITH CHECK ADD  CONSTRAINT [FK_Instructors_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Instructors] CHECK CONSTRAINT [FK_Instructors_Departments]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Courses]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Question_Types] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Question_Types] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Question_Types]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Departments1] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Departments1]
GO
ALTER TABLE [dbo].[Students_Exams_Answers]  WITH CHECK ADD  CONSTRAINT [FK_Students_Exams_Answers_Answers] FOREIGN KEY([AnswerID])
REFERENCES [dbo].[Answers] ([ID])
GO
ALTER TABLE [dbo].[Students_Exams_Answers] CHECK CONSTRAINT [FK_Students_Exams_Answers_Answers]
GO
ALTER TABLE [dbo].[Students_Exams_Answers]  WITH CHECK ADD  CONSTRAINT [FK_Students_Exams_Answers_Exams] FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exams] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Students_Exams_Answers] CHECK CONSTRAINT [FK_Students_Exams_Answers_Exams]
GO
ALTER TABLE [dbo].[Students_Exams_Answers]  WITH CHECK ADD  CONSTRAINT [FK_Students_Exams_Answers_Questions] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([ID])
GO
ALTER TABLE [dbo].[Students_Exams_Answers] CHECK CONSTRAINT [FK_Students_Exams_Answers_Questions]
GO
ALTER TABLE [dbo].[Students_Exams_Answers]  WITH CHECK ADD  CONSTRAINT [FK_Students_Exams_Answers_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([ID])
GO
ALTER TABLE [dbo].[Students_Exams_Answers] CHECK CONSTRAINT [FK_Students_Exams_Answers_Students]
GO
ALTER TABLE [dbo].[Topics]  WITH CHECK ADD  CONSTRAINT [FK_Topics_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Topics] CHECK CONSTRAINT [FK_Topics_Courses]
GO
/****** Object:  StoredProcedure [dbo].[correct_exam]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- match student answers with model answer
CREATE proc [dbo].[correct_exam] (@examID int,@studentID int)
as

declare c cursor
	for select Right_AnswerID,AnswerID,CourseID
	from Students_Exams_Answers, Questions
	where QuestionID = ID

declare @right_answer int
declare @student_answer int
declare @courseID int
declare @sum int = 0

open c 
fetch c into @right_answer,@student_answer,@courseID
While @@fetch_status=0
begin
	if(@right_answer = @student_answer)
	begin
		set @sum += 1
		update Students_Exams_Answers set Grade = 1
		where current of c 
	end
	fetch c into @right_answer,@student_answer,@courseID
end
close c
deallocate c

update Courses_Students set Grade += @sum where StudentID = @studentID and CourseID = @courseID 
GO
/****** Object:  StoredProcedure [dbo].[delete_answer]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[delete_answer] @id int
as
begin
delete from Answers where id=@id 
end
GO
/****** Object:  StoredProcedure [dbo].[delete_Courses]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delete_Courses]   @coursesid int
as
delete Topics where CourseID=@coursesid
delete Courses_Students where CourseID=@coursesid
delete Exams where CourseID=@coursesid
delete Questions where CourseID=@coursesid
delete Courses  where ID=@coursesid
GO
/****** Object:  StoredProcedure [dbo].[delete_courses_students]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delete_courses_students]  @courseid int, @studentid int
as
delete Courses_Students  where CourseID=@courseid and StudentID=@studentid
GO
/****** Object:  StoredProcedure [dbo].[delete_department]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[delete_department]
@dept_id int
as
begin

/* in relational with student-coures-student_courses-exams-instructor */
delete from Students where ID=@dept_id
delete from Departments where ID=@dept_id

end
GO
/****** Object:  StoredProcedure [dbo].[delete_exams]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[delete_exams]
@id int
as
begin

/*                         Easly Add By Add Another Delete Before The Base*/
/*delete Exam_Questions NOT (Student_Exams_Answers)*/
delete from Students_Exams_Answers where ExamID=@id
delete from Exams_Questions where ExamID=@id
delete from Exams
where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[delete_instructor]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[delete_instructor] @id int
as
delete from Instructors where ID = @id
GO
/****** Object:  StoredProcedure [dbo].[delete_question]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[delete_question] @q int 
as
delete from Students_Exams_Answers where QuestionID=@q
delete from Exams_Questions where QuestionID = @q
delete from Answers where QuestionID = @q
delete from Questions where ID = @q
GO
/****** Object:  StoredProcedure [dbo].[delete_questionsTypes]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[delete_questionsTypes]
@id int
as
begin
/*will delete (questions & answers)  NOT DELETE (Exam_Questions & Student_Exam_Answers) Hint + Based On It +*/
delete from Question_Types where ID=@id

end

GO
/****** Object:  StoredProcedure [dbo].[delete_Students]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delete_Students]   @studentid int
as
delete Courses_Students  where StudentID=@studentid
delete Students_Exams_Answers  where StudentID=@studentid
delete Students  where ID=@studentid
GO
/****** Object:  StoredProcedure [dbo].[delete_students_exams_answers]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[delete_students_exams_answers] @studentid int , @questionid int , @examid int
as
begin
delete from dbo.Students_Exams_Answers where studentid=@studentid and QuestionID=@questionid and ExamID=@examid 
end
GO
/****** Object:  StoredProcedure [dbo].[delete_topics]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delete_topics]   @topicid int
as
delete Topics  where ID=@topicid
GO
/****** Object:  StoredProcedure [dbo].[generate_exam]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- generate random exam with specific TF and MCQ questions
CREATE proc [dbo].[generate_exam] (@courseID int, @tf_number int, @mcq_number int,@duration int,@title nvarchar(200))
as
begin Tran
begin try	
	insert into Exams values (@title,@duration,GETDATE(),@courseID)
	declare @examID int = @@identity

	-- get random @tf_number of TF questions
	insert into Exams_Questions
	select @examID,ID
	from (
		select ID,ROW_NUMBER() over(order by newid()) as rn 
		from Questions
		where CourseID = @courseID and TypeID = 1
	) as newtable
	where rn <= @tf_number

	-- get random @mcq_number of MCQ questions
	insert into Exams_Questions
	select @examID,ID
	from (
		select ID,ROW_NUMBER() over(order by newid()) as rn 
		from Questions
		where CourseID = @courseID and TypeID = 2
	) as newtable
	where rn <= @mcq_number
	commit
end try
begin catch
	rollback
end catch
GO
/****** Object:  StoredProcedure [dbo].[get_Courses_by_departmentid]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[get_Courses_by_departmentid]  @departmentid int
as
select * from Courses where DepartmentID=@departmentid
GO
/****** Object:  StoredProcedure [dbo].[get_Courses_by_instructorid]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[get_Courses_by_instructorid]  @instructorid int
as
select * from Courses where InstructorID=@instructorid
GO
/****** Object:  StoredProcedure [dbo].[get_courses_students]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[get_courses_students]  @courseid int, @studentid int
as
select Grade from Courses_Students  where CourseID=@courseid and StudentID=@studentid
GO
/****** Object:  StoredProcedure [dbo].[get_courses_students_by_StudentID]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[get_courses_students_by_StudentID]  @studentid int
as
select Grade from Courses_Students  where  StudentID=@studentid
GO
/****** Object:  StoredProcedure [dbo].[get_courses_students_number_by_instructorid]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[get_courses_students_number_by_instructorid]  @instructorid int
as
select c.Name,count(cs.StudentID) as 'Number of Student' from Courses_Students cs,Courses c
where c.ID=cs.CourseID and cs.CourseID in(select c.ID from Instructors ins,Courses c
where ins.ID=@instructorid)
group by c.Name
GO
/****** Object:  StoredProcedure [dbo].[get_department]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[get_department]
as
begin

select * from Departments

end
GO
/****** Object:  StoredProcedure [dbo].[get_exams]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[get_exams]
as
begin

select * from Exams

end
GO
/****** Object:  StoredProcedure [dbo].[get_exams_questions]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[get_exams_questions]
as
begin

/***********/
/* insert - delete - update */
/* BASED ON ANOTHER TABLES */
/***********/

select * from Exams_Questions

end
GO
/****** Object:  StoredProcedure [dbo].[get_questions_by_ExamID]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[get_questions_by_ExamID]
@exam_id int
as
begin

select * from Questions q
		 join Exams_Questions eq on q.ID=eq.QuestionID and eq.ExamID=@exam_id

end
GO
/****** Object:  StoredProcedure [dbo].[get_questionsTypes]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[get_questionsTypes]
as
begin
select * from Question_Types
end
GO
/****** Object:  StoredProcedure [dbo].[get_student_answers]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[get_student_answers] @exam_id int , @student_id int
as 
select q.Body, rightanswer.Body, an.Body
from Exams e inner join Students_Exams_Answers eq on e.ID = eq.ExamID 
inner join Students s on s.ID = eq.StudentID
inner join Questions q on q.ID = eq.QuestionID 
inner join Answers an on an.ID = eq.AnswerID 
inner join Answers rightanswer on rightanswer.ID = q.Right_AnswerID
where e.ID = @exam_id and s.ID = @student_id 
GO
/****** Object:  StoredProcedure [dbo].[get_student_info_by_departmentid]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[get_student_info_by_departmentid]  @departmentid int
as
select s.name , s.Username , d.Name as 'Department' 
from Students s inner join Departments d on s.DepartmentID = d.ID 
where d.id=@departmentid
GO
/****** Object:  StoredProcedure [dbo].[get_Students_by_departmentid]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[get_Students_by_departmentid] @departmentid int 
as
select * from Students  where DepartmentID=@departmentid
GO
/****** Object:  StoredProcedure [dbo].[get_Students_by_studentid]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[get_Students_by_studentid] @studentid int 
as
select * from Students  where ID=@studentid
GO
/****** Object:  StoredProcedure [dbo].[get_topics_by_courseid]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[get_topics_by_courseid]   @courseid int
as
select * from Topics  where CourseID=@courseid
GO
/****** Object:  StoredProcedure [dbo].[insert_Course]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insert_Course]  @name varchar(40),@departmentid int,@instructorid int
as
insert into Courses(Name,DepartmentID,InstructorID) values(@name,@departmentid,@instructorid)
GO
/****** Object:  StoredProcedure [dbo].[insert_courses_students]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insert_courses_students] @courseid int, @studentid int, @grade int
as
insert into Courses_Students(CourseID,StudentID,Grade) values(@courseid,@studentid,@grade)
GO
/****** Object:  StoredProcedure [dbo].[insert_department]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insert_department]
@name nvarchar(200)
as
begin
insert into Departments(Name)
values(@name)
end
GO
/****** Object:  StoredProcedure [dbo].[insert_exam]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insert_exam]
@title nvarchar(200),
@duration int,
@CreationDateTime datetime,
@courseid int
as
begin

insert into Exams(Title,Duration,CreationDateTime,CourseID)
values(@title,@duration,@CreationDateTime,@courseid)

end
GO
/****** Object:  StoredProcedure [dbo].[insert_questionsTypes]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insert_questionsTypes]
@name nvarchar(200)
as
begin

insert into Question_Types(Name)
values (@name)

end
GO
/****** Object:  StoredProcedure [dbo].[insert_Student]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insert_Student]  @name varchar(40),@username varchar(20),@password varchar(20),@departmentid int
as
insert into Students(Name,Username,Password,DepartmentID) values(@name,@username,@password,@departmentid)
GO
/****** Object:  StoredProcedure [dbo].[insert_topic]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insert_topic]  @name varchar(40),@courseid int
as
insert into Topics(Name,CourseID) values(@name,@courseid)
GO
/****** Object:  StoredProcedure [dbo].[update_Courses]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[update_Courses]   @name varchar(40),@departmentid int,@instructorid int, @coursesid int
as
update Courses set Name=@name,DepartmentID=@departmentid,InstructorID=@instructorid where ID=@coursesid
GO
/****** Object:  StoredProcedure [dbo].[update_courses_students]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[update_courses_students]  @courseid int, @studentid int, @grade int
as
update Courses_Students set Grade=@grade where CourseID=@courseid and StudentID=@studentid
GO
/****** Object:  StoredProcedure [dbo].[update_department]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[update_department]
@id int,
@name nvarchar(200)
as
begin

update Departments
set Name=@name
where ID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[update_exam]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[update_exam]
@id int,
@title nvarchar(200)
as
begin

update Exams 
set Title=@title
where ID=@id

end
GO
/****** Object:  StoredProcedure [dbo].[update_questionsTypes]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[update_questionsTypes]
@id int,
@name nvarchar(200)
as
begin
UPDATE Question_Types
set Name=@name
where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[update_Student]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[update_Student]  @name varchar(40),@username varchar(20),@password varchar(20),@departmentid int, @studentid int
as
update Students set Name=@name, Username=@username, Password=@password,DepartmentID=@departmentid where ID=@studentid
GO
/****** Object:  StoredProcedure [dbo].[update_topic]    Script Date: 11/30/2019 5:00:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[update_topic]  @name varchar(40),@courseid int, @topicid int
as
update Topics set Name=@name,CourseID=@courseid where ID=@topicid
GO
