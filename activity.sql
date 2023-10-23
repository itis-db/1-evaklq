with recursive activity_hierarchy as (
    select
        a.id,
        a.parent_id,
        a.activitytype_id,
        a.activity_id,
        at.name as activity_name,
        cast(at.name as varchar) as hierarchy_path
    from activitytype as at, activity as a
    where a.parent_id is null 
    	and at.id = a.activitytype_id

    union

    select
        a.id,
        a.parent_id,
        a.activitytype_id,
        a.activity_id,
        at."name" as activity_name,
        concat(h.hierarchy_path, ' -> ', at."name") as hierarchy_path
    from activity as a
		join activitytype as at on at.id = a.activitytype_id
		join activity_hierarchy as h on a.parent_id = h.id
)
select * from activity_hierarchy order by (id);