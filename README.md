# HL7v2 JSON

A simple library to convert HL7v2 message to JSON

https://pypi.org/project/hl7v2json/

## Installation
Simple
```
pip install hl7v2json
```

## Supported Messages
```
A01 Admit patient
A02 Transfer patient
A03 Discharge patient
A04 Register patient
A06 Change outpatient to inpatient
A07 Change inpatient to outpatient
A08 Update patient
A11 Cancel admit
A12 Cancel transfer
A13 Cancel discharge
A21 Start of medical leave of absence (MLOA)
A22 Return from MLOA
A52 Cancel start of MLOA
A53 Cancel return from MLOA
```

## Example
```python
from hl7v2json import parser

message = '\r'.join([
    'MSH|^~\&|MegaReg|XYZHospC|SuperOE|XYZImgCtr|20060529090131-0500||ADT^A01^ADT_A01|01052901|P|2.5',
    'EVN||200605290901||||200605290900',
    'PID|||56782445^^^UAReg^PI||KLEINSAMPLE^BARRY^Q^JR||19620910|M||2028-9^^HL70005^RA99113^^XYZ|260 GOODWIN CREST '
    'DRIVE^^BIRMINGHAM^AL^35209^^M~NICKELL’S PICKLES^10000 W 100TH '
    'AVE^BIRMINGHAM^AL^35200^^O|||||||0105I30001^^^99DEF^AN',
    'PV1||I|W^389^1^UABH^^^^3||||12345^MORGAN^REX^J^^^MD^0010^UAMC^L||67890^GRAINGER^LUCY^X^^^MD^0010^UAMC^L|MED'
    '|||||A0||13579^POTTER^SHERMAN^T^^^MD^0010^UAMC^L|||||||||||||||||||||||||||200605290900',
    'OBX|1|NM|^Body Height||1.80|m^Meter^ISO+|||||F',
    'AL1|1||^ASPIRIN',
    'DG1|1||786.50^CHEST PAIN, UNSPECIFIED^I9|||A'
])

parser.parse(message)
```

```json
{
    "info": {
        "messageType": "ADT_A01",
        "messageDescription": "Admit/Visit Notification"
    },
    "segments": {
        "messageHeader": {
            "fieldSeparator": "|",
            "encodingCharacters": "^~\\&",
            "sendingApplication": "MegaReg",
            "sendingFacility": "XYZHospC",
            "receivingApplication": "SuperOE",
            "receivingFacility": "XYZImgCtr",
            "date/timeOfMessage": "2006-05-29T09:01:31-05:00",
            "messageType": {
                "messageCode": "ADT",
                "triggerEvent": "A01",
                "messageStructure": "ADT_A01"
            },
            "messageControlId": "01052901",
            "processingId": "P",
            "versionId": "2.5"
        },
        "eventType": {
            "recordedDate/time": "2006-05-29T09:01:00-05:00",
            "eventOccurred": "2006-05-29T09:00:00-05:00"
        },
        "patientIdentification": {
            "patientIdentifierList": {
                "idNumber": "56782445",
                "assigningAuthority": "UAReg",
                "identifierTypeCode": "PI"
            },
            "patientName": {
                "familyName": "KLEINSAMPLE",
                "givenName": "BARRY",
                "secondAndFurtherGivenNamesOrInitialsThereof": "Q",
                "suffix(e.g.,JrOrIii)": "JR"
            },
            "date/timeOfBirth": "1962-09-10",
            "administrativeSex": "M",
            "race": {
                "identifier": "2028-9",
                "nameOfCodingSystem": "HL70005",
                "alternateIdentifier": "RA99113",
                "nameOfAlternateCodingSystem": "XYZ"
            },
            "patientAddress": {
                "streetAddress": "NICKELL\u2019S PICKLES",
                "otherDesignation": "10000 W 100TH AVE",
                "city": "BIRMINGHAM",
                "stateOrProvince": "AL",
                "zipOrPostalCode": "35200",
                "addressType": "O"
            },
            "patientAccountNumber": {
                "idNumber": "0105I30001",
                "assigningAuthority": "99DEF",
                "identifierTypeCode": "AN"
            }
        },
        "patientVisit": {
            "patientClass": "I",
            "assignedPatientLocation": {
                "pointOfCare": "W",
                "room": "389",
                "bed": "1",
                "facility": "UABH",
                "floor": "3"
            },
            "attendingDoctor": {
                "personIdentifier": "12345",
                "familyName": "MORGAN",
                "givenName": "REX",
                "secondAndFurtherGivenNamesOrInitialsThereof": "J",
                "degree(e.g.,Md)": "MD",
                "sourceTable": "0010",
                "assigningAuthority": "UAMC",
                "nameTypeCode": "L"
            },
            "consultingDoctor": {
                "personIdentifier": "67890",
                "familyName": "GRAINGER",
                "givenName": "LUCY",
                "secondAndFurtherGivenNamesOrInitialsThereof": "X",
                "degree(e.g.,Md)": "MD",
                "sourceTable": "0010",
                "assigningAuthority": "UAMC",
                "nameTypeCode": "L"
            },
            "hospitalService": "MED",
            "ambulatoryStatus": "A0",
            "admittingDoctor": {
                "personIdentifier": "13579",
                "familyName": "POTTER",
                "givenName": "SHERMAN",
                "secondAndFurtherGivenNamesOrInitialsThereof": "T",
                "degree(e.g.,Md)": "MD",
                "sourceTable": "0010",
                "assigningAuthority": "UAMC",
                "nameTypeCode": "L"
            },
            "admitDate/time": "2006-05-29T09:00:00-05:00"
        },
        "observation/result": {
            "setId-Obx": "1",
            "valueType": "NM",
            "observationIdentifier": {
                "text": "Body Height"
            },
            "observationValue": "1.80",
            "units": {
                "identifier": "m",
                "text": "Meter",
                "nameOfCodingSystem": "ISO+"
            },
            "observationResultStatus": "F"
        },
        "patientAllergyInformation": {
            "setId-Al1": "1",
            "allergenCode/mnemonic/description": {
                "text": "ASPIRIN"
            }
        },
        "diagnosis": {
            "setId-Dg1": "1",
            "diagnosisCode-Dg1": {
                "identifier": "786.50",
                "text": "CHEST PAIN, UNSPECIFIED",
                "nameOfCodingSystem": "I9"
            },
            "diagnosisType": "A"
        }
    }
}
```
