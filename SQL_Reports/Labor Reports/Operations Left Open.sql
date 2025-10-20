with cteBase as (
    select w.base_id + '/' + w.lot_id + case when w.split_id = 0 then '' else '.' + w.split_id end as JobID
        , w.part_id as PartID
        , case when len(p.description)>17 then left(p.description,15)+'..' else p.description end as Description
        , o.workorder_sub_id as SubID
        , o.completed_qty as CompletedQty
        , o.act_setup_hrs + o.act_run_hrs as ActHrs
        , '(' + cast(o.sequence_no as varchar(5)) + ') ' + isnull(o.service_id,o.resource_id) as CurrentOp
        , o.status as OpStatus
        , (select top 1 status from operation where workorder_type = o.workorder_type and workorder_base_id = o.workorder_base_id and workorder_lot_id = o.workorder_lot_id 
                and workorder_split_id = o.workorder_split_id and workorder_sub_id = o.workorder_sub_id and sequence_no < o.sequence_no 
                order by sequence_no desc) as PriorOpStatus
        , (select top 1 sequence_no 
           from operation where workorder_type = o.workorder_type and workorder_base_id = o.workorder_base_id and workorder_lot_id = o.workorder_lot_id 
                and workorder_split_id = o.workorder_split_id and workorder_sub_id = o.workorder_sub_id and sequence_no < o.sequence_no 
                and status in ('f','u','r') order by sequence_no desc) PriorOpenOp    
        , (select top 1 resource_id 
           from operation where workorder_type = o.workorder_type and workorder_base_id = o.workorder_base_id and workorder_lot_id = o.workorder_lot_id 
                and workorder_split_id = o.workorder_split_id and workorder_sub_id = o.workorder_sub_id and sequence_no < o.sequence_no 
                and status in ('f','u','r') order by sequence_no desc) PriorOpenOpResource
        , (select top 1 ssr.user_5 
           from operation so (nolock) join shop_resource ssr (nolock) on so.resource_id = ssr.id 
                where workorder_type = o.workorder_type and workorder_base_id = o.workorder_base_id and workorder_lot_id = o.workorder_lot_id 
                and workorder_split_id = o.workorder_split_id and workorder_sub_id = o.workorder_sub_id and sequence_no < o.sequence_no 
                and so.status in ('f','u','r') order by sequence_no desc) Plant
        , (select top 1 ssr.user_4 
           from operation so (nolock) join shop_resource ssr (nolock) on so.resource_id = ssr.id 
                where workorder_type = o.workorder_type and workorder_base_id = o.workorder_base_id and workorder_lot_id = o.workorder_lot_id 
                and workorder_split_id = o.workorder_split_id and workorder_sub_id = o.workorder_sub_id and sequence_no < o.sequence_no 
                and so.status in ('f','u','r') order by sequence_no desc) Supervisor
        , (select top 1 ssr.user_2 
           from operation so (nolock) join shop_resource ssr (nolock) on so.resource_id = ssr.id 
                where workorder_type = o.workorder_type and workorder_base_id = o.workorder_base_id and workorder_lot_id = o.workorder_lot_id 
                and workorder_split_id = o.workorder_split_id and workorder_sub_id = o.workorder_sub_id and sequence_no < o.sequence_no 
                and so.status in ('f','u','r') order by sequence_no desc) Dept
    from operation o (nolock)
    join shop_resource sr on o.resource_id = sr.id 
    join work_order w (nolock) on o.workorder_type = w.type and o.workorder_base_id = w.base_id and o.workorder_split_id = w.split_id 
        and w.type = 'W' and w.sub_id = 0 and w.status in ('r','f')
    left join part p on w.part_id = p.id 
    where o.status in ('r','f','u') 
    and (
        o.completed_qty > 0 
        or o.act_setup_hrs <> 0 
        or o.act_run_hrs <> 0
        or isnull((select top 1 status from operation where workorder_type = o.workorder_type and workorder_base_id = o.workorder_base_id and workorder_lot_id = o.workorder_lot_id 
                and workorder_split_id = o.workorder_split_id and workorder_sub_id = o.workorder_sub_id and sequence_no < o.sequence_no 
                order by sequence_no desc),'X') = 'C'
        )
    and exists (select 1 from operation where workorder_type = o.workorder_type and workorder_base_id = o.workorder_base_id and workorder_lot_id = o.workorder_lot_id 
                and workorder_split_id = o.workorder_split_id and workorder_sub_id = o.workorder_sub_id and sequence_no < o.sequence_no 
                and status in ('f','u','r')) 
),
maxBase as (
    select JobId, PartID, Description, SubID, Max(CurrentOp) CurrentOp
    from cteBase
    group by JobID, PartID, Description, SubID
) select b.* 
    , case when (select count(*) from cteBase where JobID = m.JobID) > 1 then 'Y' else 'N' end as Multiple
from maxBase m
join cteBase b on m.JobID = b.JobID and m.CurrentOp = b.CurrentOp
where Plant in (@PLANT) and Supervisor in (@SUPERVISOR) and Dept in (@DEPT)
