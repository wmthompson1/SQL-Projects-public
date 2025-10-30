use LIVESupplemental
go

select Resource_ID, Resource_Description, PPD_Process, Location, SKILLS_TYPE
from ResourceID_Assignments
where Resource_Description <> 'DO NOT USE'

UPDATE ResourceID_Assignments SET PPD_Process='Forming' WHERE Resource_ID='ANM-blast';
UPDATE ResourceID_Assignments SET PPD_Process='Forming' WHERE Resource_ID='ANM-brakefrmhot';
UPDATE ResourceID_Assignments SET PPD_Process='Inspection' WHERE Resource_ID='ANM-FINALinsp';
UPDATE ResourceID_Assignments SET PPD_Process='Deburr' WHERE Resource_ID='ANM-fladderburr';
UPDATE ResourceID_Assignments SET PPD_Process='Inspection' WHERE Resource_ID='ANM-insp';
UPDATE ResourceID_Assignments SET PPD_Process='Masking' WHERE Resource_ID='ANM-mask';
UPDATE ResourceID_Assignments SET PPD_Process='Waterjet' WHERE Resource_ID='ANM-Waterjet';
UPDATE ResourceID_Assignments SET PPD_Process='Inspection' WHERE Resource_ID='AUB-assyINSP';
UPDATE ResourceID_Assignments SET PPD_Process='Inspection' WHERE Resource_ID='AUB-FINALinsp';
UPDATE ResourceID_Assignments SET PPD_Process='Deburr' WHERE Resource_ID='AUB-handburr';
UPDATE ResourceID_Assignments SET PPD_Process='Inspection' WHERE Resource_ID='AUB-insp';
UPDATE ResourceID_Assignments SET PPD_Process='Inspection' WHERE Resource_ID='AUB-InvControl';
UPDATE ResourceID_Assignments SET PPD_Process='Inspection' WHERE Resource_ID='AUB-NrthMFGinsp';
UPDATE ResourceID_Assignments SET PPD_Process='Paint' WHERE Resource_ID='AUB-oven1';
UPDATE ResourceID_Assignments SET PPD_Process='Paint' WHERE Resource_ID='AUB-ovenPrime';
UPDATE ResourceID_Assignments SET PPD_Process='Paint' WHERE Resource_ID='AUB-ovenTC';
UPDATE ResourceID_Assignments SET PPD_Process='Paint' WHERE Resource_ID='AUB-panel';
UPDATE ResourceID_Assignments SET PPD_Process='Coating Removal' WHERE Resource_ID='AUB-TurcoClean';
UPDATE ResourceID_Assignments SET PPD_Process='Deburr' WHERE Resource_ID='BAL-abrburr';
UPDATE ResourceID_Assignments SET PPD_Process='Paint' WHERE Resource_ID='BAL-oven';
UPDATE ResourceID_Assignments SET PPD_Process='Paint' WHERE Resource_ID='BAL-ovenPrime';
UPDATE ResourceID_Assignments SET PPD_Process='Paint' WHERE Resource_ID='BAL-ovenTC';
UPDATE ResourceID_Assignments SET PPD_Process='Paint' WHERE Resource_ID='BAL-panel';
UPDATE ResourceID_Assignments SET PPD_Process='Forming' WHERE Resource_ID='Brakeform-hot';
