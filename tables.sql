create table if not exists activitytype (
    id 		integer primary key,
    "name"	varchar not null,
    sysname varchar not null	
);

create table if not exists activity (
	id				integer primary key,
	activitytype_id	integer not null references activitytype (id),
	code 			varchar not null,
	"name"			varchar not null,
	activity_id		integer not null,
	parent_id 		integer references activity (id)
);

create table if not exists program (
	id			integer primary key references activity (id),
	indexnum	integer,
	yearstart	integer,
	yearfinish	integer
);

create table if not exists subprogram (
	id			integer primary key references activity (id),
	indexnum 	integer
);

create table if not exists area (
	id		integer primary key,
	"name"	varchar not null default 'Unknown'
);

create table if not exists project (
	id			integer primary key references activity (id),
	targetdescr	varchar
);

create table if not exists contract (
	id		integer primary key references activity (id),
	area_id integer references area (id)
);

create table if not exists point (
	id			integer primary key references activity (id),
	plandate	date not null,
	factdate	date
);