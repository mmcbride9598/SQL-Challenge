-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/yu5YvV
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Departments] (
    [Dept_no] int  NOT NULL ,
    [Dept_Name] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED (
        [Dept_no] ASC
    )
)

CREATE TABLE [Dept_Employees] (
    [Emp_No] int  NOT NULL ,
    [Dept_no] int  NOT NULL ,
    CONSTRAINT [PK_Dept_Employees] PRIMARY KEY CLUSTERED (
        [Emp_No] ASC
    )
)

CREATE TABLE [Dept_Manager] (
    [Dept_no] int  NOT NULL ,
    [emp_no] int  NOT NULL ,
    CONSTRAINT [PK_Dept_Manager] PRIMARY KEY CLUSTERED (
        [Dept_no] ASC
    )
)

CREATE TABLE [Employees] (
    [Emp_no] int  NOT NULL ,
    [Emp_Title_id] txt  NOT NULL ,
    [birth_date] DATE  NOT NULL ,
    [first_name] varchar(50)  NOT NULL ,
    [last_name] varchar(50)  NOT NULL ,
    [sex] txt  NOT NULL ,
    [hire_date] DATE  NOT NULL ,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED (
        [Emp_no] ASC
    )
)

CREATE TABLE [Salaries] (
    [Emp_no] int  NOT NULL ,
    [salary] int  NOT NULL ,
    CONSTRAINT [PK_Salaries] PRIMARY KEY CLUSTERED (
        [Emp_no] ASC
    )
)

CREATE TABLE [titles] (
    [title_id] int  NOT NULL ,
    [title] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_titles] PRIMARY KEY CLUSTERED (
        [title_id] ASC
    )
)

ALTER TABLE [Departments] WITH CHECK ADD CONSTRAINT [FK_Departments_Dept_no] FOREIGN KEY([Dept_no])
REFERENCES [Dept_Employees] ([Dept_no])

ALTER TABLE [Departments] CHECK CONSTRAINT [FK_Departments_Dept_no]

ALTER TABLE [Dept_Employees] WITH CHECK ADD CONSTRAINT [FK_Dept_Employees_Dept_no] FOREIGN KEY([Dept_no])
REFERENCES [Dept_Manager] ([Dept_no])

ALTER TABLE [Dept_Employees] CHECK CONSTRAINT [FK_Dept_Employees_Dept_no]

ALTER TABLE [Dept_Manager] WITH CHECK ADD CONSTRAINT [FK_Dept_Manager_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([Emp_no])

ALTER TABLE [Dept_Manager] CHECK CONSTRAINT [FK_Dept_Manager_emp_no]

ALTER TABLE [Employees] WITH CHECK ADD CONSTRAINT [FK_Employees_Emp_no] FOREIGN KEY([Emp_no])
REFERENCES [Salaries] ([Emp_no])

ALTER TABLE [Employees] CHECK CONSTRAINT [FK_Employees_Emp_no]

ALTER TABLE [titles] WITH CHECK ADD CONSTRAINT [FK_titles_title_id] FOREIGN KEY([title_id])
REFERENCES [Employees] ([Emp_Title_id])

ALTER TABLE [titles] CHECK CONSTRAINT [FK_titles_title_id]

COMMIT TRANSACTION QUICKDBD