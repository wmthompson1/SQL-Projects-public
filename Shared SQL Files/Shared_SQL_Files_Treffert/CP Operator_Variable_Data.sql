--SELECT CONVERT(NVARCHAR(max), BITS, 2)  FROM OPERATION_BINARY

SELECT * 
FROM operator_variable_data
--WHERE RESOURCE_ID = 'P1F1-IN-FINSH'
where OPERATION_TYPE_ID LIKE 'avg%'
--WHERE RESOURCE_ID IN ('P1F1-CP-INSP', 'P1F1-IN-INSP')

/*
INSERT INTO operator_variable_data VALUES ('P1F1-CP-INSP', 'INSP', '1', 'OPERATOR_VARIABLE', 'NO', 'NR')
INSERT INTO operator_variable_data VALUES ('P1F1-CP-INSP', 'INSP', '2', 'OPERATOR_VARIABLE', 'NO', 'BEGINS:___/___/___   ___:___ AM   PM ')
INSERT INTO operator_variable_data VALUES ('P1F1-CP-INSP', 'INSP', '3', 'OPERATOR_VARIABLE', 'NO', 'BLANK')
INSERT INTO operator_variable_data VALUES ('P1F1-CP-INSP', 'INSP', '4', 'OPERATOR_VARIABLE', 'NO', 'INITALS:________     NR')
INSERT INTO operator_variable_data VALUES ('P1F1-CP-INSP', 'INSP', '5', 'OPERATOR_VARIABLE', 'NO', 'BLANK')
INSERT INTO operator_variable_data VALUES ('P1F1-CP-INSP', 'INSP', '6', 'OPERATOR_VARIABLE', 'NO', 'BLANK')
INSERT INTO operator_variable_data VALUES ('P1F1-CP-INSP', 'INSP', '7', 'OPERATOR_VARIABLE', 'NO', 'ACCEPT    REJECT')
INSERT INTO operator_variable_data VALUES ('P1F1-CP-INSP', 'INSP', '8', 'OPERATOR_VARIABLE', 'NO', 'BLANK')
INSERT INTO operator_variable_data VALUES ('P1F1-CP-INSP', 'INSP', '9', 'OPERATOR_VARIABLE', 'NO', 'ID: SKI____')
INSERT INTO operator_variable_data VALUES ('P1F1-CP-INSP', 'INSP', '10', 'OPERATOR_VARIABLE', 'NO', 'ACTUAL:_______ MEASURED:________')
INSERT INTO operator_variable_data VALUES ('P1F1-CP-INSP', 'INSP', '11', 'OPERATOR_VARIABLE', 'NO', 'MIN: _____  MAX:_____')
INSERT INTO operator_variable_data VALUES ('P1F1-CP-INSP', 'INSP', '12', 'OPERATOR_VARIABLE', 'NO', 'MIN: _____  MAX:_____     NR')
INSERT INTO operator_variable_data VALUES ('P1F1-CP-INSP', 'INSP-WET', '1', 'OPERATOR_VARIABLE', 'NO', 'ENDS:___/___/___   ___:___ AM   PM ')
INSERT INTO operator_variable_data VALUES ('P1F1-CP-INSP', 'INSP-WET', '2', 'OPERATOR_VARIABLE', 'NO', 'BLANK')
INSERT INTO operator_variable_data VALUES ('P1F1-CP-INSP', 'INSP-WET', '3', 'OPERATOR_VARIABLE', 'NO', 'PASS     FAIL     NR')

INSERT INTO operator_variable_data VALUES ('P1F1-IN-FINSH', 'AVG', '1', 'OPERATOR_VARIABLE', 'NO', 'PAINT THICKNESS:____________')
INSERT INTO operator_variable_data VALUES ('P1F1-IN-FINSH', 'INSPMASK', '1', 'OPERATOR_VARIABLE', 'NO', 'QTY ACCEPTED:_________')
INSERT INTO operator_variable_data VALUES ('P1F1-IN-FINSH', 'INSPMASK', '2', 'OPERATOR_VARIABLE', 'NO', 'QTY REJECTED:_________')
INSERT INTO operator_variable_data VALUES ('P1F1-IN-FINSH', 'INSP-TC', '1', 'OPERATOR_VARIABLE', 'NO', 'NR')
INSERT INTO operator_variable_data VALUES ('P1F1-IN-FINSH', 'INSP-TC', '2', 'OPERATOR_VARIABLE', 'NO', 'BEGINS:___/___/___   ___:___ AM   PM ')
INSERT INTO operator_variable_data VALUES ('P1F1-IN-FINSH', 'INSP-TC', '3', 'OPERATOR_VARIABLE', 'NO', 'BLANK')
INSERT INTO operator_variable_data VALUES ('P1F1-IN-FINSH', 'INSP-TC', '4', 'OPERATOR_VARIABLE', 'NO', 'BLANK')
INSERT INTO operator_variable_data VALUES ('P1F1-IN-FINSH', 'INSP-TC', '5', 'OPERATOR_VARIABLE', 'NO', 'ACCEPT    REJECT')
INSERT INTO operator_variable_data VALUES ('P1F1-IN-FINSH', 'INSP-TC', '6', 'OPERATOR_VARIABLE', 'NO', 'ACCEPT    REJECT   NR')
INSERT INTO operator_variable_data VALUES ('P1F1-IN-FINSH', 'INSP-TC', '7', 'OPERATOR_VARIABLE', 'NO', 'ACCEPT    REJECT   NR')
INSERT INTO operator_variable_data VALUES ('P1F1-IN-FINSH', 'INSP-TC', '8', 'OPERATOR_VARIABLE', 'NO', 'BLANK')
INSERT INTO operator_variable_data VALUES ('P1F1-IN-FINSH', 'INSP-TC', '9', 'OPERATOR_VARIABLE', 'NO', 'ID: SKI____')
INSERT INTO operator_variable_data VALUES ('P1F1-IN-FINSH', 'INSP-TC', '10', 'OPERATOR_VARIABLE', 'NO', 'ACTUAL:_______ MEASURED:________')
INSERT INTO operator_variable_data VALUES ('P1F1-IN-FINSH', 'INSP-TC', '11', 'OPERATOR_VARIABLE', 'NO', 'MIN: _____  MAX:_____     NR (TEXTURE ONLY)')
INSERT INTO operator_variable_data VALUES ('P1F1-IN-FINSH', 'INSP-TC', '12', 'OPERATOR_VARIABLE', 'NO', 'MIN: _____  MAX:_____     NR')
INSERT INTO operator_variable_data VALUES ('P1F1-IN-FINSH', 'INSP-TC', '13', 'OPERATOR_VARIABLE', 'NO', 'BLANK')
INSERT INTO operator_variable_data VALUES ('P1F1-IN-FINSH', 'INSP-TC', '14', 'OPERATOR_VARIABLE', 'NO', 'PASS    FAIL   NR     INITIALS:_____')
INSERT INTO operator_variable_data VALUES ('P1F1-IN-FINSH', 'INSP-TC', '15', 'OPERATOR_VARIABLE', 'NO', 'PASS    FAIL   NR     INITIALS:_____')
INSERT INTO operator_variable_data VALUES ('P1F1-IN-FINSH', 'INSP-TC', '16', 'OPERATOR_VARIABLE', 'NO', 'PASS    FAIL   NR     INITIALS:_____')

*/