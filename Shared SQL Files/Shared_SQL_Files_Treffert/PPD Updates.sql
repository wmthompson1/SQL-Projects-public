use nc2012
go

select PartNumber, rejecttag, MRBQty, MRBName, MRBRemoveDate, MRBRemovalReason, MRBQtyRemoved, *
from tblNonconformances 
where partnumber in ('453A1610-103', '453A1610-104', '453A1610-14', '453A1610-16', '453A1610-20', '453A1610-82', '453A1610-84', '453A2610-18', '453A2610-20', '453A2610-32', '453A2610-38', '453A2610-58', '453A2610-68', '453T1919-80', '453T1919-81', '453T7027-2', '453T7027-3')
	and NonconformanceDISPO1 = 'MRB Entry'
	

update tblNonconformances
set MRBQty = RejectedQTY,
	MRBName = DispositionAuthor,
	MRBRemoveDate = DispDateTime,
	MRBRemovalReason = 'Destruction',
	MRBQtyRemoved = RejectedQTY
from tblNonconformances
where NonconformanceDISPO1 = 'MRB Entry'
	and partnumber in ('453A1610-103', '453A1610-104', '453A1610-14', '453A1610-16', '453A1610-20', '453A1610-82', '453A1610-84', '453A2610-18', '453A2610-20', '453A2610-32', '453A2610-38', '453A2610-58', '453A2610-68', '453T1919-80', '453T1919-81', '453T7027-2', '453T7027-3')


select *
from tblNonconformances 
where partnumber in ('453A1610-103', '453A1610-104', '453A1610-14', '453A1610-16', '453A1610-20', '453A1610-82', '453A1610-84', '453A2610-18', '453A2610-20', '453A2610-32', '453A2610-38', '453A2610-58', '453A2610-68', '453T1919-80', '453T1919-81', '453T7027-2', '453T7027-3')
	and NonconformanceDISPO1 <> 'MRB Entry'
