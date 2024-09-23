USE [Pms_DB]
GO
/****** Object:  Table [dbo].[tblAddEmployee]    Script Date: 9/23/2024 6:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAddEmployee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyRegistrationNumber] [varchar](50) NULL,
	[EmployeeID] [int] NULL,
 CONSTRAINT [PK_tblAddEmployee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCity]    Script Date: 9/23/2024 6:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCity](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NULL,
	[StateID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCompanyIndustry]    Script Date: 9/23/2024 6:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCompanyIndustry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IndustryName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCompanyRegistration1]    Script Date: 9/23/2024 6:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCompanyRegistration1](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NULL,
	[CompanyRegistrationNumber] [int] NULL,
	[CompanyIndustry] [varchar](50) NULL,
	[CompanyPersonName] [varchar](50) NULL,
	[CompanyPersonNumber] [varchar](50) NULL,
	[CompanyPersonEmailID] [varchar](50) NULL,
	[CompanyState] [varchar](50) NULL,
	[CompanyCity] [varchar](50) NULL,
	[CompanyAddress] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDepartment]    Script Date: 9/23/2024 6:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepartment](
	[DepartmentID] [int] NOT NULL,
	[DepartmentName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployeeRegistration1]    Script Date: 9/23/2024 6:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployeeRegistration1](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyRegistrationNumber] [int] NULL,
	[EmployeeID] [int] NULL,
	[SelectEmployeeShift] [varchar](50) NULL,
	[SelectEmployeeDepartment] [varchar](50) NULL,
	[SelectEmployeePosition] [varchar](50) NULL,
	[DateOfJJoining] [date] NULL,
	[EmployeeFullName] [varchar](50) NULL,
	[EmployeeNumber] [varchar](50) NULL,
	[EmployeeEmail] [varchar](50) NULL,
	[SelectEmployeeGender] [varchar](50) NULL,
	[SelectEmployeeState] [varchar](50) NULL,
	[SelectEmployeeCity] [varchar](50) NULL,
	[EmployeeAddress] [varchar](50) NULL,
	[EmployeeCTC] [decimal](12, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPosition]    Script Date: 9/23/2024 6:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPosition](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NULL,
	[PositionName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblState]    Script Date: 9/23/2024 6:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblState](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCity] ON 
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (1, N'Bhopal', 1)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (2, N'Indore', 1)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (3, N'Gwalior', 1)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (4, N'Jabalpur', 1)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (5, N'Ujjain', 1)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (6, N'Mumbai', 2)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (7, N'Pune', 2)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (8, N'Nagpur', 2)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (9, N'Nashik', 2)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (10, N'Aurangabad', 2)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (11, N'Lucknow', 3)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (12, N'Kanpur', 3)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (13, N'Agra', 3)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (14, N'Varanasi', 3)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (15, N'Meerut', 3)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (16, N'Jaipur', 4)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (17, N'Udaipur', 4)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (18, N'Jodhpur', 4)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (19, N'Ajmer', 4)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (20, N'Kota', 4)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (21, N'Ahmedabad', 5)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (22, N'Surat', 5)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (23, N'Vadodara', 5)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (24, N'Rajkot', 5)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (25, N'Bhavnagar', 5)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (26, N'Bangalore', 6)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (27, N'Mysore', 6)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (28, N'Mangalore', 6)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (29, N'Hubli', 6)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (30, N'Belgaum', 6)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (31, N'Chennai', 7)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (32, N'Coimbatore', 7)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (33, N'Madurai', 7)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (34, N'Tiruchirappalli', 7)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (35, N'Salem', 7)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (36, N'Kolkata', 8)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (37, N'Asansol', 8)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (38, N'Siliguri', 8)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (39, N'Durgapur', 8)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (40, N'Howrah', 8)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (41, N'Patna', 9)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (42, N'Gaya', 9)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (43, N'Bhagalpur', 9)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (44, N'Muzaffarpur', 9)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (45, N'Darbhanga', 9)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (46, N'Thiruvananthapuram', 10)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (47, N'Kochi', 10)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (48, N'Kozhikode', 10)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (49, N'Thrissur', 10)
GO
INSERT [dbo].[tblCity] ([CityID], [CityName], [StateID]) VALUES (50, N'Kollam', 10)
GO
SET IDENTITY_INSERT [dbo].[tblCity] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCompanyIndustry] ON 
GO
INSERT [dbo].[tblCompanyIndustry] ([ID], [IndustryName]) VALUES (1, N'Technology')
GO
INSERT [dbo].[tblCompanyIndustry] ([ID], [IndustryName]) VALUES (2, N'Healthcare')
GO
INSERT [dbo].[tblCompanyIndustry] ([ID], [IndustryName]) VALUES (3, N'Finance')
GO
INSERT [dbo].[tblCompanyIndustry] ([ID], [IndustryName]) VALUES (4, N'Education')
GO
INSERT [dbo].[tblCompanyIndustry] ([ID], [IndustryName]) VALUES (5, N'Manufacturing')
GO
SET IDENTITY_INSERT [dbo].[tblCompanyIndustry] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCompanyRegistration1] ON 
GO
INSERT [dbo].[tblCompanyRegistration1] ([ID], [CompanyName], [CompanyRegistrationNumber], [CompanyIndustry], [CompanyPersonName], [CompanyPersonNumber], [CompanyPersonEmailID], [CompanyState], [CompanyCity], [CompanyAddress]) VALUES (19, N'SFA Technologies', 1000, N'Technology', N'Mohit Jha', N'9584453704', N'mohit.jha@sfa.com', N'Madhya Pradesh', N'Bhopal', N'H.No. 02, Kolua Road, Semra Kalan, Bhopal, Madhya')
GO
INSERT [dbo].[tblCompanyRegistration1] ([ID], [CompanyName], [CompanyRegistrationNumber], [CompanyIndustry], [CompanyPersonName], [CompanyPersonNumber], [CompanyPersonEmailID], [CompanyState], [CompanyCity], [CompanyAddress]) VALUES (20, N'Startek', 1001, N'Technology', N'Rahul Kumar', N'9856322154', N'rahul.kumar@startek.com', N'West Bengal', N'Asansol', N'H.55, Sector-C, Patnaganj, Asansol, WB, 551020')
GO
INSERT [dbo].[tblCompanyRegistration1] ([ID], [CompanyName], [CompanyRegistrationNumber], [CompanyIndustry], [CompanyPersonName], [CompanyPersonNumber], [CompanyPersonEmailID], [CompanyState], [CompanyCity], [CompanyAddress]) VALUES (21, N'Agrigator', 1003, N'Manufacturing', N'Aninash Marko', N'9586958695', N'avinash.marko@agrigator.com', N'West Bengal', N'Durgapur', N'H.265, Colony avadhpuri, Narela, Huzur, Bhopal, Ma')
GO
INSERT [dbo].[tblCompanyRegistration1] ([ID], [CompanyName], [CompanyRegistrationNumber], [CompanyIndustry], [CompanyPersonName], [CompanyPersonNumber], [CompanyPersonEmailID], [CompanyState], [CompanyCity], [CompanyAddress]) VALUES (22, N'Google', 1005, N'Technology', N'Mohit Jha', N'9584453704', N'rahul.bhawsar@agrigator.com', N'Uttar Pradesh', N'Kanpur', N'jcbkcbkzc lkzxnclkznc')
GO
INSERT [dbo].[tblCompanyRegistration1] ([ID], [CompanyName], [CompanyRegistrationNumber], [CompanyIndustry], [CompanyPersonName], [CompanyPersonNumber], [CompanyPersonEmailID], [CompanyState], [CompanyCity], [CompanyAddress]) VALUES (23, N'Google', 1006, N'Technology', N'zccvczxc', N'9896532325', N'mohit.jha@realme.com', N'West Bengal', N'Siliguri', N'zcxxczc nvcvmc cnvmxcbmv')
GO
INSERT [dbo].[tblCompanyRegistration1] ([ID], [CompanyName], [CompanyRegistrationNumber], [CompanyIndustry], [CompanyPersonName], [CompanyPersonNumber], [CompanyPersonEmailID], [CompanyState], [CompanyCity], [CompanyAddress]) VALUES (24, N'jvbhcbv', 1008, N'Technology', N'xczxcc', N'9999999999', N'ashish.rathore@apple.com', N'Tamil Nadu', N'Coimbatore', N'jcbkcbkzc lkzxnclkznc')
GO
SET IDENTITY_INSERT [dbo].[tblCompanyRegistration1] OFF
GO
INSERT [dbo].[tblDepartment] ([DepartmentID], [DepartmentName]) VALUES (1, N'HR')
GO
INSERT [dbo].[tblDepartment] ([DepartmentID], [DepartmentName]) VALUES (2, N'IT')
GO
INSERT [dbo].[tblDepartment] ([DepartmentID], [DepartmentName]) VALUES (3, N'Production')
GO
INSERT [dbo].[tblDepartment] ([DepartmentID], [DepartmentName]) VALUES (4, N'Sales')
GO
INSERT [dbo].[tblDepartment] ([DepartmentID], [DepartmentName]) VALUES (5, N'Quality Control')
GO
INSERT [dbo].[tblDepartment] ([DepartmentID], [DepartmentName]) VALUES (6, N'Finance')
GO
INSERT [dbo].[tblDepartment] ([DepartmentID], [DepartmentName]) VALUES (7, N'Logistics')
GO
INSERT [dbo].[tblDepartment] ([DepartmentID], [DepartmentName]) VALUES (8, N'Research and Development')
GO
INSERT [dbo].[tblDepartment] ([DepartmentID], [DepartmentName]) VALUES (9, N'Procurement')
GO
INSERT [dbo].[tblDepartment] ([DepartmentID], [DepartmentName]) VALUES (10, N'Maintenance')
GO
SET IDENTITY_INSERT [dbo].[tblEmployeeRegistration1] ON 
GO
INSERT [dbo].[tblEmployeeRegistration1] ([ID], [CompanyRegistrationNumber], [EmployeeID], [SelectEmployeeShift], [SelectEmployeeDepartment], [SelectEmployeePosition], [DateOfJJoining], [EmployeeFullName], [EmployeeNumber], [EmployeeEmail], [SelectEmployeeGender], [SelectEmployeeState], [SelectEmployeeCity], [EmployeeAddress], [EmployeeCTC]) VALUES (1, 1000, 12, N'Day', N'Quality Control', N'Quality Control Inspector', CAST(N'2024-09-24' AS Date), N'Arjun Kushwaha', N'9586958695', N'arjun.kushwaha@sfa.com', N'Male', N'Tamil Nadu', N'Tiruchirappalli', N'Bhopal Bhopal Bhopal', CAST(280000.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[tblEmployeeRegistration1] ([ID], [CompanyRegistrationNumber], [EmployeeID], [SelectEmployeeShift], [SelectEmployeeDepartment], [SelectEmployeePosition], [DateOfJJoining], [EmployeeFullName], [EmployeeNumber], [EmployeeEmail], [SelectEmployeeGender], [SelectEmployeeState], [SelectEmployeeCity], [EmployeeAddress], [EmployeeCTC]) VALUES (2, 1000, 12, N'Day', N'Sales', N'Sales Executive', CAST(N'2024-09-24' AS Date), N'Mohit Jha', N'9586958695', N'arjun.kushwaha@sfa.com', N'Male', N'Maharashtra', N'Mumbai', N'zxczcxc hjk', CAST(1200000.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[tblEmployeeRegistration1] ([ID], [CompanyRegistrationNumber], [EmployeeID], [SelectEmployeeShift], [SelectEmployeeDepartment], [SelectEmployeePosition], [DateOfJJoining], [EmployeeFullName], [EmployeeNumber], [EmployeeEmail], [SelectEmployeeGender], [SelectEmployeeState], [SelectEmployeeCity], [EmployeeAddress], [EmployeeCTC]) VALUES (6, 1003, 15, N'Day', N'Finance', N'Financial Analyst', CAST(N'2024-09-08' AS Date), N'Mohit Jha', N'9586958695', N'arjun.kushwaha@sfa.com', N'Male', N'Maharashtra', N'Pune', N'Bhopal Bhopal Bhopal', CAST(12000.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[tblEmployeeRegistration1] ([ID], [CompanyRegistrationNumber], [EmployeeID], [SelectEmployeeShift], [SelectEmployeeDepartment], [SelectEmployeePosition], [DateOfJJoining], [EmployeeFullName], [EmployeeNumber], [EmployeeEmail], [SelectEmployeeGender], [SelectEmployeeState], [SelectEmployeeCity], [EmployeeAddress], [EmployeeCTC]) VALUES (7, 1000, 13, N'Night', N'IT', N'IT Manager', CAST(N'2024-09-26' AS Date), N'Rakesh Rajput', N'9584758695', N'arjun.kushwaha@sfa.com', N'Female', N'Karnataka', N'Mysore', N'fghgn fhjh', CAST(120000.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[tblEmployeeRegistration1] ([ID], [CompanyRegistrationNumber], [EmployeeID], [SelectEmployeeShift], [SelectEmployeeDepartment], [SelectEmployeePosition], [DateOfJJoining], [EmployeeFullName], [EmployeeNumber], [EmployeeEmail], [SelectEmployeeGender], [SelectEmployeeState], [SelectEmployeeCity], [EmployeeAddress], [EmployeeCTC]) VALUES (8, 1005, 13, N'Day', N'Quality Control', N'Quality Assurance Manager', CAST(N'2024-09-24' AS Date), N'Rakesh Rajput', N'9584758695', N'rakesh.rajput@agrigator.com', N'Male', N'Karnataka', N'Mangalore', N'czxczczxc dfvcv vcvc', CAST(2111311.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[tblEmployeeRegistration1] ([ID], [CompanyRegistrationNumber], [EmployeeID], [SelectEmployeeShift], [SelectEmployeeDepartment], [SelectEmployeePosition], [DateOfJJoining], [EmployeeFullName], [EmployeeNumber], [EmployeeEmail], [SelectEmployeeGender], [SelectEmployeeState], [SelectEmployeeCity], [EmployeeAddress], [EmployeeCTC]) VALUES (10, 1006, 100, N'Day', N'Research and Development', N'Research Scientist', CAST(N'2024-09-30' AS Date), N'Arjun Kushwaha', N'9586958695', N'arjun.kushwaha@sfa.com', N'Male', N'Uttar Pradesh', N'Kanpur', N'Bhopal Bhopal Bhopal', CAST(280000.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[tblEmployeeRegistration1] ([ID], [CompanyRegistrationNumber], [EmployeeID], [SelectEmployeeShift], [SelectEmployeeDepartment], [SelectEmployeePosition], [DateOfJJoining], [EmployeeFullName], [EmployeeNumber], [EmployeeEmail], [SelectEmployeeGender], [SelectEmployeeState], [SelectEmployeeCity], [EmployeeAddress], [EmployeeCTC]) VALUES (12, 1006, 14, N'Day', N'HR', N'HR Manager', CAST(N'2024-09-16' AS Date), N'Rakesh Rajput', N'9584758695', N'arjun.kushwaha@sfa.com', N'Male', N'Bihar', N'Bhagalpur', N'Bhopal Bhopal Bhopal', CAST(280000.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[tblEmployeeRegistration1] ([ID], [CompanyRegistrationNumber], [EmployeeID], [SelectEmployeeShift], [SelectEmployeeDepartment], [SelectEmployeePosition], [DateOfJJoining], [EmployeeFullName], [EmployeeNumber], [EmployeeEmail], [SelectEmployeeGender], [SelectEmployeeState], [SelectEmployeeCity], [EmployeeAddress], [EmployeeCTC]) VALUES (13, 1006, 14, N'Day', N'HR', N'HR Manager', CAST(N'2024-09-16' AS Date), N'Rakesh Rajput', N'9584758695', N'arjun.kushwaha@sfa.com', N'Male', N'Bihar', N'Bhagalpur', N'Bhopal Bhopal Bhopal', CAST(280000.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[tblEmployeeRegistration1] ([ID], [CompanyRegistrationNumber], [EmployeeID], [SelectEmployeeShift], [SelectEmployeeDepartment], [SelectEmployeePosition], [DateOfJJoining], [EmployeeFullName], [EmployeeNumber], [EmployeeEmail], [SelectEmployeeGender], [SelectEmployeeState], [SelectEmployeeCity], [EmployeeAddress], [EmployeeCTC]) VALUES (14, 1006, 15, N'Day', N'Logistics', N'Logistics Manager', CAST(N'2024-09-18' AS Date), N'Rakesh Rajput', N'9584758695', N'arjun.kushwaha@sfa.com', N'Male', N'Uttar Pradesh', N'Kanpur', N'Bhopal Bhopal Bhopal', CAST(1200000.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[tblEmployeeRegistration1] ([ID], [CompanyRegistrationNumber], [EmployeeID], [SelectEmployeeShift], [SelectEmployeeDepartment], [SelectEmployeePosition], [DateOfJJoining], [EmployeeFullName], [EmployeeNumber], [EmployeeEmail], [SelectEmployeeGender], [SelectEmployeeState], [SelectEmployeeCity], [EmployeeAddress], [EmployeeCTC]) VALUES (15, 1008, 17, N'Day', N'Logistics', N'Logistics Manager', CAST(N'2024-09-17' AS Date), N'Rakesh Rajput', N'9584453704', N'arjun.kushwaha@sfa.com', N'Male', N'Karnataka', N'Mangalore', N'Bhopal Bhopal Bhopal', CAST(1200000.00 AS Decimal(12, 2)))
GO
SET IDENTITY_INSERT [dbo].[tblEmployeeRegistration1] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPosition] ON 
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (1, 1, N'HR Manager')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (2, 1, N'HR Assistant')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (3, 1, N'Recruiter')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (4, 1, N'Payroll Specialist')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (5, 1, N'Employee Relations Specialist')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (6, 2, N'IT Manager')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (7, 2, N'Software Developer')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (8, 2, N'System Administrator')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (9, 2, N'Network Engineer')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (10, 2, N'Database Administrator')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (11, 3, N'Production Supervisor')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (12, 3, N'Machine Operator')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (13, 3, N'Quality Inspector')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (14, 3, N'Assembly Line Worker')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (15, 3, N'Production Planner')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (16, 4, N'Sales Manager')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (17, 4, N'Sales Executive')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (18, 4, N'Sales Coordinator')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (19, 4, N'Account Manager')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (20, 4, N'Sales Analyst')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (21, 5, N'Quality Assurance Manager')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (22, 5, N'Quality Control Inspector')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (23, 5, N'Quality Analyst')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (24, 5, N'Compliance Officer')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (25, 5, N'Quality Engineer')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (26, 6, N'Finance Manager')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (27, 6, N'Accountant')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (28, 6, N'Financial Analyst')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (29, 6, N'Auditor')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (30, 6, N'Payroll Specialist')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (31, 7, N'Logistics Manager')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (32, 7, N'Warehouse Supervisor')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (33, 7, N'Inventory Coordinator')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (34, 7, N'Shipping and Receiving Clerk')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (35, 7, N'Supply Chain Analyst')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (36, 8, N'R&D Manager')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (37, 8, N'Product Developer')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (38, 8, N'Research Scientist')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (39, 8, N'Innovation Specialist')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (40, 8, N'Lab Technician')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (41, 9, N'Procurement Manager')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (42, 9, N'Purchasing Agent')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (43, 9, N'Vendor Relations Specialist')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (44, 9, N'Supply Chain Manager')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (45, 9, N'Inventory Control Specialist')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (46, 10, N'Maintenance Manager')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (47, 10, N'Maintenance Technician')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (48, 10, N'Mechanical Engineer')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (49, 10, N'Electrical Engineer')
GO
INSERT [dbo].[tblPosition] ([PositionID], [DepartmentID], [PositionName]) VALUES (50, 10, N'Facility Manager')
GO
SET IDENTITY_INSERT [dbo].[tblPosition] OFF
GO
SET IDENTITY_INSERT [dbo].[tblState] ON 
GO
INSERT [dbo].[tblState] ([StateID], [StateName]) VALUES (1, N'Madhya Pradesh')
GO
INSERT [dbo].[tblState] ([StateID], [StateName]) VALUES (2, N'Maharashtra')
GO
INSERT [dbo].[tblState] ([StateID], [StateName]) VALUES (3, N'Uttar Pradesh')
GO
INSERT [dbo].[tblState] ([StateID], [StateName]) VALUES (4, N'Rajasthan')
GO
INSERT [dbo].[tblState] ([StateID], [StateName]) VALUES (5, N'Gujarat')
GO
INSERT [dbo].[tblState] ([StateID], [StateName]) VALUES (6, N'Karnataka')
GO
INSERT [dbo].[tblState] ([StateID], [StateName]) VALUES (7, N'Tamil Nadu')
GO
INSERT [dbo].[tblState] ([StateID], [StateName]) VALUES (8, N'West Bengal')
GO
INSERT [dbo].[tblState] ([StateID], [StateName]) VALUES (9, N'Bihar')
GO
INSERT [dbo].[tblState] ([StateID], [StateName]) VALUES (10, N'Kerala')
GO
SET IDENTITY_INSERT [dbo].[tblState] OFF
GO
/****** Object:  Index [UQ__tblAddEm__7AD04FF0F21A665E]    Script Date: 9/23/2024 6:31:46 PM ******/
ALTER TABLE [dbo].[tblAddEmployee] ADD UNIQUE NONCLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__tblCompa__A30DD59F1769C35D]    Script Date: 9/23/2024 6:31:46 PM ******/
ALTER TABLE [dbo].[tblCompanyRegistration1] ADD UNIQUE NONCLUSTERED 
(
	[CompanyRegistrationNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblEmployeeRegistration1]  WITH CHECK ADD  CONSTRAINT [FK_CompanyRegistrationNumber] FOREIGN KEY([CompanyRegistrationNumber])
REFERENCES [dbo].[tblCompanyRegistration1] ([CompanyRegistrationNumber])
GO
ALTER TABLE [dbo].[tblEmployeeRegistration1] CHECK CONSTRAINT [FK_CompanyRegistrationNumber]
GO
ALTER TABLE [dbo].[tblPosition]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[tblDepartment] ([DepartmentID])
GO
/****** Object:  StoredProcedure [dbo].[Usp_CityGetAll]    Script Date: 9/23/2024 6:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[Usp_CityGetAll]
@StateID int = null
as
begin
   select * from tblCity where StateID = @StateID
end

GO
/****** Object:  StoredProcedure [dbo].[Usp_DeleteCompanyRow]    Script Date: 9/23/2024 6:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Usp_DeleteCompanyRow]
	@ID INT
AS
BEGIN
	DELETE FROM tblCompanyRegistration1 WHERE ID = @ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetCompanyIndustries]    Script Date: 9/23/2024 6:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Usp_GetCompanyIndustries]
AS
BEGIN
	SELECT ID, IndustryName
	FROM tblCompanyIndustry;
END;
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetGridData]    Script Date: 9/23/2024 6:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Usp_GetGridData]
AS
BEGIN
SELECT [ID], [CompanyName], [CompanyRegistrationNumber], [CompanyIndustry], [CompanyPersonName], [CompanyPersonNumber], [CompanyPersonEmailID], [CompanyState], [CompanyCity], [CompanyAddress] FROM tblCompanyRegistration1
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_GetPositionByDepartment]    Script Date: 9/23/2024 6:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetPositionByDepartment]
    @DepartmentID INT
AS
BEGIN
    SELECT PositionID, PositionName
    FROM tblPosition
    WHERE DepartmentID = @DepartmentID
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_GetSelectedPosition]    Script Date: 9/23/2024 6:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetSelectedPosition]
    @DepartmentID INT = NULL,
    @PositionID INT = NULL
AS
BEGIN
    SELECT 
        d.DepartmentName AS Department,
        p.PositionName AS Position
    FROM 
        tblDepartment d
    LEFT JOIN 
        tblPosition p ON p.DepartmentID = d.DepartmentID
    WHERE 
        (@DepartmentID IS NULL OR d.DepartmentID = @DepartmentID) AND
        (@PositionID IS NULL OR p.PositionID = @PositionID);
END;
GO
/****** Object:  StoredProcedure [dbo].[Usp_insertCompanyRegistration]    Script Date: 9/23/2024 6:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Usp_insertCompanyRegistration]
(
@CompanyName VARCHAR(50)= NULL,
@CompanyRegistrationNumber INT,
@CompanyIndustry VARCHAR(50) = NULL,
@CompanyPersonName VARCHAR(50) = NULL,
@CompanyPersonNumber VARCHAR(50) = NULL,
@CompanyPersonEmail VARCHAR(50) = NULL,
@CompanyStateName VARCHAR(50) = NULL,
@CompanyStateCity VARCHAR(50) = NULL,
@CompanyAddress VARCHAR(50) = NULL
)
AS
BEGIN
INSERT INTO tblCompanyRegistration1([CompanyName], [CompanyRegistrationNumber], [CompanyIndustry], [CompanyPersonName], [CompanyPersonNumber], [CompanyPersonEmailID], [CompanyState], [CompanyCity], [CompanyAddress])
Values
(
@CompanyName,
@CompanyRegistrationNumber,
@CompanyIndustry,
@CompanyPersonName,
@CompanyPersonNumber,
@CompanyPersonEmail,
@CompanyStateName,
@CompanyStateCity,
@CompanyAddress
)
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertEmployeeRegistration]    Script Date: 9/23/2024 6:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_InsertEmployeeRegistration]
(
    @CompanyRegistrationNumber INT,
    @EmployeeID int,
    @SelectEmployeeShift VARCHAR(50) = NULL,
    @SelectEmployeeDepartment VARCHAR(50) = NULL,
    @SelectEmployeePosition VARCHAR(50) = NULL,
    @DateOfJJoining DATE = NULL,
    @EmployeeFullName VARCHAR(50) = NULL,
    @EmployeeNumber VARCHAR(50) = NULL,
    @EmployeeEmail VARCHAR(50) = NULL,
    @SelectEmployeeGender VARCHAR(50) = NULL,
    @SelectEmployeeState VARCHAR(50) = NULL,
    @SelectEmployeeCity VARCHAR(50) = NULL,
    @EmployeeAddress VARCHAR(300) = NULL,
    @EmployeeCTC DECIMAL(12, 2) = NULL
)
AS
BEGIN
    DECLARE @msg VARCHAR(50) = NULL;
    DECLARE @errorMsg VARCHAR(100) = NULL;

    BEGIN TRY
        -- Pehle check kare ki Company Registration Number parent table mein hai ya nahi
        IF EXISTS (SELECT 1 FROM tblCompanyRegistration1 WHERE CompanyRegistrationNumber = @CompanyRegistrationNumber)
        BEGIN
            -- Ab insert karega employee ko agar Company Registration Number parent table me hai
            INSERT INTO tblEmployeeRegistration1
            (
                [CompanyRegistrationNumber], 
                [EmployeeID], 
                [SelectEmployeeShift], 
                [SelectEmployeeDepartment], 
                [SelectEmployeePosition], 
                [DateOfJJoining], 
                [EmployeeFullName], 
                [EmployeeNumber], 
                [EmployeeEmail], 
                [SelectEmployeeGender], 
                [SelectEmployeeState], 
                [SelectEmployeeCity], 
                [EmployeeAddress], 
                [EmployeeCTC]
            )
            VALUES
            (
                @CompanyRegistrationNumber,
                @EmployeeID,
                @SelectEmployeeShift,
                @SelectEmployeeDepartment,
                @SelectEmployeePosition,
               @DateOfJJoining,
                @EmployeeFullName,
                @EmployeeNumber,
                @EmployeeEmail,
                @SelectEmployeeGender,
                @SelectEmployeeState,
                @SelectEmployeeCity,
                @EmployeeAddress,
                @EmployeeCTC
            );

            -- Agar insert successful hai toh success message
            SET @msg = 'OK';
            SET @errorMsg = 'Data Inserted Successfully';
        END
        ELSE
        BEGIN
            -- Agar Company Registration Number parent table mein nahi hai toh error message
            SET @msg = 'ERROR';
            SET @errorMsg = 'Invalid Company Registration Number. Entry not found in parent table.';
        END

        -- Message ko return karenge
        SELECT @msg AS Msg, @errorMsg AS ErrorMsg;

    END TRY
    BEGIN CATCH
        -- Exception handling block agar koi error ho
        SET @msg = 'ERROR';
        SET @errorMsg = ERROR_MESSAGE();
        SELECT @msg AS Msg, @errorMsg AS ErrorMsg;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_SetCityByState]    Script Date: 9/23/2024 6:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_SetCityByState]
@StateID INT
as
begin
select CityID, CityName
from tblCity
where @StateID = StateID
end;
GO
/****** Object:  StoredProcedure [dbo].[Usp_UpdateCompanyRow]    Script Date: 9/23/2024 6:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Usp_UpdateCompanyRow]
   @ID INT,
    @CompanyName VARCHAR(50) = NULL,
    @CompanyRegistrationNumber VARCHAR(50) = NULL,
    @CompanyIndustry VARCHAR(50) = NULL,
    @CompanyPersonName VARCHAR(50) = NULL,
    @CompanyPersonNumber VARCHAR(50) = NULL,
    @CompanyPersonEmail VARCHAR(50) = NULL,
   @CompanyStateName VARCHAR(50) = NULL,
    @CompanyStateCity VARCHAR(50) = NULL,
    @CompanyAddress VARCHAR(300) = NULL
AS
BEGIN
    UPDATE tblCompanyRegistration1
    SET  
        CompanyName = @CompanyName,
        CompanyRegistrationNumber = @CompanyRegistrationNumber,
        CompanyIndustry = @CompanyIndustry,
        CompanyPersonName = @CompanyPersonName,
        CompanyPersonNumber = @CompanyPersonNumber,
        CompanyPersonEmailID = @CompanyPersonEmail,
        CompanyState =@CompanyStateName,
        CompanyCity =@CompanyStateCity,
        CompanyAddress =@CompanyAddress
    WHERE ID = @ID;
END

GO
/****** Object:  StoredProcedure [dbo].[UspGetDepartment]    Script Date: 9/23/2024 6:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UspGetDepartment]
AS
BEGIN
SELECT DepartmentID, DepartmentName 
FROM tblDepartment
END;
GO
/****** Object:  StoredProcedure [dbo].[uspGetSelectData]    Script Date: 9/23/2024 6:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetSelectData]
    @StateID INT = NULL,
    @CityID INT = NULL
AS
BEGIN
    SELECT 
        s.StateName AS State, 
        c.CityName AS City 
    FROM 
        tblState AS s
    LEFT JOIN 
        tblCity AS c ON s.StateID = c.StateID
    WHERE
        (@StateID IS NULL OR s.StateID = @StateID) AND
        (@CityID IS NULL OR c.CityID = @CityID);
END;
GO
/****** Object:  StoredProcedure [dbo].[uspGetState]    Script Date: 9/23/2024 6:31:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[uspGetState]
AS
Begin
Select StateID, StateName from  tblState;
end;
GO
