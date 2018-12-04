drop table tpcs_leave;
drop table tpcs_lazy;
drop table tpcs_user;
create table tpcs_user(
    id number(7) primary key,
    username varchar2(20) not null unique,
    password varchar2(20) not null,
    realname varchar(20) not null,
    phone varchar2(20) not null unique,
    createdate date default sysdate,
    power number(1) default 0,
    remark varchar2(100),
    status varchar2(20)
);
drop sequence tpcs_user_id;
create sequence tpcs_user_id;

create table tpcs_leave(
    id number(7) primary key,
    phone varchar2(20) not null,
    startdate TIMESTAMP,
    enddate TIMESTAMP,
    hours number(4,2),
    day number(2),
    remarks varchar2(20),
    user_id number(7) REFERENCES tpcs_user(id)
);
drop sequence tpcs_leave_id;
create sequence tpcs_leave_id;

create table tpcs_lazy(
    id number(7),
    lazydate date,
    status varchar2(20),
    user_id number(7) REFERENCES tpcs_user(id)
);

create sequence tpcs_lazy_id;
drop sequence tpcs_lazy_id;