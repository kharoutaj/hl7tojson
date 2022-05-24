# HL7 to JSON

A simple library to convert HL7 message version 2 to json with human readable 
description

https://pypi.org/project/hl7tojson/

## Installation
Simple
```
pip install hl7tojson
```


## Example
```python
from hl7tojson import parser

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
            "fieldSeparator": {
                "id": 1,
                "data": "|"
            },
            "encodingCharacters": {
                "id": 2,
                "data": "^~\\&"
            },
            "sendingApplication": {
                "id": 3,
                "data": "MegaReg"
            },
            "sendingFacility": {
                "id": 4,
                "data": "XYZHospC"
            },
            "receivingApplication": {
                "id": 5,
                "data": "SuperOE"
            },
            "receivingFacility": {
                "id": 6,
                "data": "XYZImgCtr"
            },
            "date/timeOfMessage": {
                "id": 7,
                "data": "2006-05-29T09:01:31-05:00"
            },
            "messageType": {
                "id": 9,
                "messageCode": {
                    "id": 1,
                    "data": "ADT"
                },
                "triggerEvent": {
                    "id": 2,
                    "data": "A01"
                },
                "messageStructure": {
                    "id": 3,
                    "data": "ADT_A01"
                }
            },
            "messageControlId": {
                "id": 10,
                "data": "01052901"
            },
            "processingId": {
                "id": 11,
                "data": "P"
            },
            "versionId": {
                "id": 12,
                "data": "2.5"
            }
        },
        "eventType": {
            "recordedDate/time": {
                "id": 2,
                "data": "2006-05-29T09:01:00-05:00"
            },
            "eventOccurred": {
                "id": 6,
                "data": "20060529090000"
            }
        },
        "patientIdentification": {
            "patientIdentifierList": {
                "id": 3,
                "idNumber": {
                    "id": 1,
                    "data": "56782445"
                },
                "assigningAuthority": {
                    "id": 4,
                    "data": "UAReg"
                },
                "identifierTypeCode": {
                    "id": 5,
                    "data": "PI"
                }
            },
            "patientName": {
                "id": 5,
                "familyName": {
                    "id": 1,
                    "data": "KLEINSAMPLE"
                },
                "givenName": {
                    "id": 2,
                    "data": "BARRY"
                },
                "secondAndFurtherGivenNamesOrInitialsThereof": {
                    "id": 3,
                    "data": "Q"
                },
                "suffix(e.g.,JrOrIii)": {
                    "id": 4,
                    "data": "JR"
                }
            },
            "date/timeOfBirth": {
                "id": 7,
                "data": "1962-09-10"
            },
            "administrativeSex": {
                "id": 8,
                "data": "M"
            },
            "race": {
                "id": 10,
                "identifier": {
                    "id": 1,
                    "data": "2028-9"
                },
                "nameOfCodingSystem": {
                    "id": 3,
                    "data": "HL70005"
                },
                "alternateIdentifier": {
                    "id": 4,
                    "data": "RA99113"
                },
                "nameOfAlternateCodingSystem": {
                    "id": 6,
                    "data": "XYZ"
                }
            },
            "patientAddress": {
                "id": 11,
                "streetAddress": {
                    "id": 1,
                    "data": "NICKELL\u2019S PICKLES"
                },
                "otherDesignation": {
                    "id": 2,
                    "data": "10000 W 100TH AVE"
                },
                "city": {
                    "id": 3,
                    "data": "BIRMINGHAM"
                },
                "stateOrProvince": {
                    "id": 4,
                    "data": "AL"
                },
                "zipOrPostalCode": {
                    "id": 5,
                    "data": "35200"
                },
                "addressType": {
                    "id": 7,
                    "data": "O"
                }
            },
            "patientAccountNumber": {
                "id": 18,
                "idNumber": {
                    "id": 1,
                    "data": "0105I30001"
                },
                "assigningAuthority": {
                    "id": 4,
                    "data": "99DEF"
                },
                "identifierTypeCode": {
                    "id": 5,
                    "data": "AN"
                }
            }
        },
        "patientVisit": {
            "patientClass": {
                "id": 2,
                "data": "I"
            },
            "assignedPatientLocation": {
                "id": 3,
                "pointOfCare": {
                    "id": 1,
                    "data": "W"
                },
                "room": {
                    "id": 2,
                    "data": "389"
                },
                "bed": {
                    "id": 3,
                    "data": "1"
                },
                "facility": {
                    "id": 4,
                    "data": "UABH"
                },
                "floor": {
                    "id": 8,
                    "data": "3"
                }
            },
            "attendingDoctor": {
                "id": 7,
                "personIdentifier": {
                    "id": 1,
                    "data": "12345"
                },
                "familyName": {
                    "id": 2,
                    "data": "MORGAN"
                },
                "givenName": {
                    "id": 3,
                    "data": "REX"
                },
                "secondAndFurtherGivenNamesOrInitialsThereof": {
                    "id": 4,
                    "data": "J"
                },
                "degree(e.g.,Md)": {
                    "id": 7,
                    "data": "MD"
                },
                "sourceTable": {
                    "id": 8,
                    "data": "0010"
                },
                "assigningAuthority": {
                    "id": 9,
                    "data": "UAMC"
                },
                "nameTypeCode": {
                    "id": 10,
                    "data": "L"
                }
            },
            "consultingDoctor": {
                "id": 9,
                "personIdentifier": {
                    "id": 1,
                    "data": "67890"
                },
                "familyName": {
                    "id": 2,
                    "data": "GRAINGER"
                },
                "givenName": {
                    "id": 3,
                    "data": "LUCY"
                },
                "secondAndFurtherGivenNamesOrInitialsThereof": {
                    "id": 4,
                    "data": "X"
                },
                "degree(e.g.,Md)": {
                    "id": 7,
                    "data": "MD"
                },
                "sourceTable": {
                    "id": 8,
                    "data": "0010"
                },
                "assigningAuthority": {
                    "id": 9,
                    "data": "UAMC"
                },
                "nameTypeCode": {
                    "id": 10,
                    "data": "L"
                }
            },
            "hospitalService": {
                "id": 10,
                "data": "MED"
            },
            "ambulatoryStatus": {
                "id": 15,
                "data": "A0"
            },
            "admittingDoctor": {
                "id": 17,
                "personIdentifier": {
                    "id": 1,
                    "data": "13579"
                },
                "familyName": {
                    "id": 2,
                    "data": "POTTER"
                },
                "givenName": {
                    "id": 3,
                    "data": "SHERMAN"
                },
                "secondAndFurtherGivenNamesOrInitialsThereof": {
                    "id": 4,
                    "data": "T"
                },
                "degree(e.g.,Md)": {
                    "id": 7,
                    "data": "MD"
                },
                "sourceTable": {
                    "id": 8,
                    "data": "0010"
                },
                "assigningAuthority": {
                    "id": 9,
                    "data": "UAMC"
                },
                "nameTypeCode": {
                    "id": 10,
                    "data": "L"
                }
            },
            "admitDate/time": {
                "id": 44,
                "data": "2006-05-29T09:00:00-05:00"
            }
        },
        "observation/result": {
            "setId-Obx": {
                "id": 1,
                "data": "1"
            },
            "valueType": {
                "id": 2,
                "data": "NM"
            },
            "observationIdentifier": {
                "id": 3,
                "text": {
                    "id": 2,
                    "data": "Body Height"
                }
            },
            "observationValue": {
                "id": 5,
                "data": "1.80"
            },
            "units": {
                "id": 6,
                "identifier": {
                    "id": 1,
                    "data": "m"
                },
                "text": {
                    "id": 2,
                    "data": "Meter"
                },
                "nameOfCodingSystem": {
                    "id": 3,
                    "data": "ISO+"
                }
            },
            "observationResultStatus": {
                "id": 11,
                "data": "F"
            }
        },
        "patientAllergyInformation": {
            "setId-Al1": {
                "id": 1,
                "data": "1"
            },
            "allergenCode/mnemonic/description": {
                "id": 3,
                "text": {
                    "id": 2,
                    "data": "ASPIRIN"
                }
            }
        },
        "diagnosis": {
            "setId-Dg1": {
                "id": 1,
                "data": "1"
            },
            "diagnosisCode-Dg1": {
                "id": 3,
                "identifier": {
                    "id": 1,
                    "data": "786.50"
                },
                "text": {
                    "id": 2,
                    "data": "CHEST PAIN, UNSPECIFIED"
                },
                "nameOfCodingSystem": {
                    "id": 3,
                    "data": "I9"
                }
            },
            "diagnosisType": {
                "id": 6,
                "data": "A"
            }
        }
    }
}
```

## TODO
- Support all versions of HL7 version 2
- Support data description in multiple languages
- Add CI
