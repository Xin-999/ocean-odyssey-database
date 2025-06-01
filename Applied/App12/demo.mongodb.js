use("qang0004")

db.getCollectionNames(); 
db.studentenrolment.drop();
db.studentenrolment.insertMany(
    [
        {
  "_id": 12489379,
  "name": "Gilberto Bwy",
  "contactInfo": {
    "address": "5664 Loomis Parkway, Melbourne",
    "phone": "7037621034",
    "email": "Gilberto.Bwy@student.monash.edu"
  },
  "dob": "30-08-1992",
  "enrolmentInfo": [
    {
      "unitcode": "FIT1045",
      "unitname": "Algorithms and programming fundamentals in python",
      "year": "2019",
      "semester": 1,
      "mark": 40,
      "grade": "N"
    },
    {
      "unitcode": "FIT2094",
      "unitname": "Databases",
      "year": "2020",
      "semester": 1,
      "mark": 63,
      "grade": "C"
    },
    {
      "unitcode": "FIT1050",
      "unitname": "Web fundamentals",
      "year": "2019",
      "semester": 2,
      "mark": 92,
      "grade": "HD"
    },
    {
      "unitcode": "FIT1045",
      "unitname": "Algorithms and programming fundamentals in python",
      "year": "2019",
      "semester": 2,
      "mark": 89,
      "grade": "HD"
    },
    {
      "unitcode": "FIT1050",
      "unitname": "Web fundamentals",
      "year": "2019",
      "semester": 1,
      "mark": 44,
      "grade": "N"
    }
  ]
}
    ]
)

db.studentenrolment.countDocuments();
