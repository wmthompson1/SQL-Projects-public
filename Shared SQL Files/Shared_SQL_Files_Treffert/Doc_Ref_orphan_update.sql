/*  This file is to delete orphans that are created when a user deletes a document reference record and needs to reuse it/update it
*/


select * from  DOCUMENT where id = '413A5002-27 SKILLS DWG'
select * from [dbo].[DOCUMENT_REF_WO] where document_id = '413A5002-27 SKILLS DWG'

 select * from USER_DEF_FIELDS 
  where document_id = '413A5002-27 SKILLS DWG'

  --delete from USER_DEF_FIELDS 
  --where document_id = '287W7001 SHT 3'

 select * from [dbo].[REVISION_HISTORY]
 where history_id = '413A5002-27 SKILLS DWG'


 /*
 -- Use this to delete the orphan --
 delete from [dbo].[REVISION_HISTORY]
 where history_id = '413A5002-27 SKILLS DWG'
 and revision_id =  'B'
 AND ROWID = 2542
 */

