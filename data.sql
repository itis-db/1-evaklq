insert into activitytype
select d.* from (values 
	(1,'Программа', 	'program'	),
   	(2,'Подпрограмма',	'subprogram'),
	(3,'Проект',		'project'	),
	(4,'Контракт',		'contract'	),
	(5,'Точка контроля','point'		)
) as d(id, name, sysname)
where not exists(
    select 1 from activitytype as t
    where t.id = d.id
);

insert into activity 
values	(1, 1, 'something1', 'program', 1, null),
		(2, 2, 'something2', 'name', 1, 1),
		(3, 3, 'something3', 'project', 1, 2),
		(4, 4, 'something4', 'superProgram', 1, 3),
		(5, 5, 'something5', 'superName', 1, 4),
		(6, 1, 'something1.1', 'program1', 2, 1),
		(7, 2, 'something2.1', 'name1', 2, 2),
		(8, 3, 'something3.1', 'project1', 2, 3),
		(9, 4, 'something4.1', 'superProgram1', 2, 4)
on conflict do nothing;

insert into subprogram 
values	(1, 1231),
		(2, 1232)
on conflict (id) do nothing;

insert into program 
values 	(1, 123, 2000, 2001),
	   	(2, 234, 2000, 2001)
on conflict (id) do nothing;

insert into area 
values	(1, 'First'),
		(2, 'Second')
on conflict (id) do nothing;

insert into contract 
values 	(1, 1),
		(2, 2)
on conflict (id) do nothing;

insert into project
values 	(1, 'First test project'),
		(2, 'Second test project')
on conflict (id) do nothing;

insert into point
values	(1, date '2000-12-11', date '2000-12-21'),
		(2, date '2000-12-12', date '2000-12-22')
on conflict (id) do nothing;