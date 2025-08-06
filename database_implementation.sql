use Company
create table Employee (
    SSN int primary key identity(1,1),
    FName nvarchar(15),
    LName nvarchar(15),
    Gender char(1),
    BirthDate date,
    SupervisorID int,
    foreign key (SupervisorID) references Employee(SSN),
)

create table Dependent (
    DepName nvarchar(15),
    Dssn int,
    Gender char(1),
    BirthDate date,
    primary key (DepName, Dssn),
    foreign key (Dssn) references Employee(SSN)
)

create table Department(
Dnum int primary key identity(10,10),
Dname nvarchar(30),
HireDate date,
mgrSSn int,
foreign key(mgrSSn) references Employee(SSN)
)

alter table Employee 
add Dnum int;

alter table Employee add constraint fk_EmpBelongsToDepartment 
foreign key (Dnum) references Department(Dnum)

create table Dept_Loc(
Dnum int,
loc nvarchar(20),
primary key(Dnum,loc),
foreign key(Dnum) references Department(Dnum)
)

create table Projects(
Pnumber varchar(3) primary key,
Pname nvarchar(10),
Plocation nvarchar(15),
city nvarchar(15),
Dnum int,
foreign key (Dnum) references Department(Dnum)
)


create table Emp_projects(
pSSn int,
Pnumber varchar(3),
workHours decimal(5,2),
primary key(pSSn,Pnumber),
foreign key(pSSn) references Employee (SSN),
foreign key(Pnumber) references Projects(Pnumber)
)