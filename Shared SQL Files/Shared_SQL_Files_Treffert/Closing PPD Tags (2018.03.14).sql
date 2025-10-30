use nc2012
go

select *
from tblNonconformances
where intdate >= '1/1/2017'
and (NonconformanceDISP <> 'Tag Closed' or NonconformanceDISP  is null)
and TagCloseDate is null
--and NonconformanceDISPO1 like 'return on%'
--and nonconformancesite in ('Customer', 'Supplier')
--and DispositionDescription in ('Return to Customer', 'As received.', 'As received. ')
--and RootCause in ('Not Required', ' Part was received damaged from the customer.', '.', 'As Received', 'As Received from Customer.', 'As received by Supplier', 'As received from Customer', 'As received from Customer.  ', 'As received from supplier', 'As received.', 'As received. ', 'Caused by supplier', 'Customer', 'Part defects as received from Boeing supplier', 'Supplier Caused - TBD', 'To be Determined by Customer', 'as received from customer')
--and CauseNC like 'as received %'

use live
go

select wo.base_id, wo.lot_id, wo.split_id, wo.sub_id, wo.status, co.id, co.status, s.packlist_id
from work_order wo
left outer join DEMAND_supply_link dsl
	on dsl.SUPPLY_TYPE = 'WO' 
	and dsl.SUPPLY_BASE_ID = wo.base_id
	and dsl.SUPPLY_LOT_ID = wo.lot_id
	and dsl.SUPPLY_SPLIT_ID = wo.split_id
	and dsl.SUPPLY_SUB_ID = wo.sub_id 
left outer join customer_order co
	on dsl.DEMAND_TYPE = 'CO'
	and dsl.DEMAND_BASE_ID = co.id  
left outer join shipper s
	on s.CUST_ORDER_ID = co.id
where wo.base_id in ('1396604', '1396607', '1410967', '1410553', '1406186', 'RW1405976', '1414916', '1411795', 'RW1419406', '1420346', '1412209', '1426485', '1423291', '1429366', '1430400', '1427719', '1431602', '1430195', '1429369', '1429550', '1429367', '1429368', '1433647', '1427029', '1434790', '1434530', '1434947', '1436600', '1429278', '1437317', '1435828', '1452506', '1435510', '1435511', '1436422', '1438324', '1447807', '1446940', '1447980', '1439779', '1443304', '1434057', '1434811', '1441011', '1442376', '1442213', '1437853', '1441028', '1443988', '1439903', '1439989', '1439541', '1444500', '1441587', '1438282', '1438538', '1442675', '1443274', '1444074', '1440698', '1442231', '1444976', '1444071', '1447935', '1445247', '1446273', '1448269', '1445342', '1445307', '1453016', '1451022', '1451243', '1452263', 'RW1446992', '1455963', '1453616', '1452460', '1460645', '1453028', '1453038', '1453023', '1456036', '1453935', '1453929', '1462167', '1457864', '1452374', '1458820', '1456482', '1457189', '1455850', '1456490', '1428780', '1455933', '1421552', '1464242', '1458503', '1453987', '1461704', '1456316', '1454819', '1464596', '1465757', '1461708', '1461706', '1461709', '1471775', '1470611', '1475155', '1470050', '1470497', '1465473', '1472059', '1471872', '1473690', '1476856', '1474324', '1467567', '1480323', '1478040', '1481215', '1472195', '1470056', '1478979', '1475856', '1454902', '1477845', '1473651', '1479143', '1478844', '1478850', '1466765', '1478446', '1483751', '1484553', '1485075', '1486427', '1483669', '1483671', '1484102', '1488266', '1487897', '1486854', '1490479')

/*
--select *
--from tblNonconformances
--where intdate >= '1/1/2017'
--and (NonconformanceDISP <> 'Tag Closed' or NonconformanceDISP  is null)
--and TagCloseDate is null
--and nonconformancesite in ('Customer', 'Supplier')
--and DispositionDescription in ('Return to Customer', 'As received.', 'As received. ')
--and RootCause in ('Not Required', ' Part was received damaged from the customer.', '.', 'As Received', 'As Received from Customer.', 'As received by Supplier', 'As received from Customer', 'As received from Customer.  ', 'As received from supplier', 'As received.', 'As received. ', 'Caused by supplier', 'Customer', 'Part defects as received from Boeing supplier', 'Supplier Caused - TBD', 'To be Determined by Customer', 'as received from customer')
--and CauseNC like 'as received %'
update tblNonconformances
set TagCloseDate = isnull(dispdatetime, intdate),
	NonconformanceDISP = 'Tag Closed'
where rejecttag in ('120194', '119960', '120040', '120291', '120310', '120572', '125180', '121041', '121520', '121303', '122644', '122653', '122665', '125082', '125421', '126721', '126643', '126260', '126384', '126575', '127917', '128573', '128622', '130116', '131834', '131837', '133482', '132048', '132096', '133677', '132319', '132425', '137963', '133751', '133850', '133883', '133915', '133918', '134164', '134404', '134446', '134449', '135645', '135662', '134819', '134823', '134833', '134865', '134868', '134884', '134947', '135130', '135188', '135339', '135468', '138071', '135782', '139139', '139216', '137715', '137792', '137883', '137922', '140322', '138405', '138483', '138489', '138484', '138493', '139063', '138736', '138959', '140501', '140764', '140924', '144696', '144697', '144734', '144781', '145031', '145416', '145526', '145607', '145622', '147335', '147463')
-- 86 rows affected


--select *
--from tblNonconformances
--where intdate >= '1/1/2017'
--and (NonconformanceDISP <> 'Tag Closed' or NonconformanceDISP  is null)
--and TagCloseDate is null
--and NonconformanceDISPO1 like 'return on%'
update tblNonconformances
set TagCloseDate = isnull(dispdatetime, intdate),
	NonconformanceDISP = 'Tag Closed'
where rejecttag in ('119975', '120029', '120049', '120075', '120274', '120374', '120569', '124697', '124764', '124802', '124865', '126339', '126585', '128491', '128493', '126772', '128596', '128015', '128397', '128476', '128480', '128478', '128546', '128634', '130119', '130137', '130217', '130261', '130382', '130471', '130542', '135549', '131636', '131694', '131774', '131735', '135674', '135675', '135678', '131944', '133726', '132099', '132325', '132332', '133560', '133586', '133610', '133595', '134054', '133823', '133826', '133834', '133969', '133965', '134014', '134042', '134319', '134364', '134415', '134564', '134607', '134852', '134876', '134872', '134918', '135135', '135196', '135200', '135356', '135451', '135453', '135465', '135483', '135497', '136269', '135760', '135788', '139126', '135926', '135999', '136211', '136287', '136296', '136304', '139158', '137654', '137812', '138077', '138092', '138103', '137861', '138203', '138462', '138505', '138900', '138690', '138780', '138850', '141095', '139004', '139033', '141052', '140710', '140761', '140768', '140773', '141417', '141459', '144633', '141616', '141622', '141636', '143270', '143404', '144991', '144831', '144921', '144941', '144958', '145179', '145280', '145288', '145376', '145417', '145420', '145474', '145644', '145656', '145824', '145893', '145944', '147029', '147073', '147095', '147161', '147241', '147285', '147316', '147319', '147563', '147426', '147509', '147567', '147588')
and workorder not in ('1454819', '1466765', '1470056', '1472195', '1473651', '1477845', '1478844', '1478850', '1479143', '1483669', '1483671', '1483751', '1484102', '1484553', '1485075', '1486427', '1486854', '1487897', '1488266')
--(125 rows affected)


select * 
from tblNonconformances 
where RejectTag in ('120640', '120642', '134318', '134581', '120607', '126339', '128397', '128478', '128480', '128491', '128493', '128546', '130261', '130471', '131735', '131944', '133965', '135451', '135453', '135453', '136114', '137654', '138421', '139033', '140710', '143270', '144633', '134415', '135070', '135070', '138681', '141052', '141095', '134649', '113838', '119243', '119469', '120238', '120291', '120874', '122579', '124968', '126643', '131720', '132307', '133559', '134037', '135000', '135069', '135072', '135854', '137660', '137977', '138014', '138280', '138290', '138354', '138481', '138551', '138583', '138584', '138611', '140761', '140768', '140773', '140963', '141278', '141319', '141535', '143342', '143538', '145624', '147105', '147118', '147399') 
and nonconformancesite not in ('Customer', 'Supplier')
group by nonconformancesite 

select * 
from tblNonconformances 
where RejectTag = '119960'

*/