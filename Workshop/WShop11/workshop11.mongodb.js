use("qang0004");
db.version(); // mongodb only show the latest output
db.getCollectionNames();
db.dronerent.drop();

db.dronerent.insertOne({
        "drone_id": 100,
        "type": {
            "code": "DMA2",
            "model": "DJI Mavic Air 2 Flymore Combo",
            "manufacturer": "DJI Da-Jiang Innovations"
        },
        "carrying_capacity": 0,
        "pur_date": "13-Jan-2021",
        "pur_price": 1494,
        "total_flighttime": 100,
        "cost_per_hour": 15,
        "RentalInfo": [
            {
                "rent_no": 1,
                "bond": 100,
                "rent_out": "20-Feb-2021 08:47:00",
                "rent_in": "20-Feb-2021 18:53:00",
                "custtrain_id": 1
            },
            {
                "rent_no": 4,
                "bond": 100,
                "rent_out": "22-Feb-2021 14:37:00",
                "rent_in": "25-Feb-2021 09:31:00",
                "custtrain_id": 4
            }
        ]
    });

    db.dronerent.countDocuments();
    // remeber put [] to be array
    db.dronerent.insertMany([{
        "drone_id": 101,
        "type": {
            "code": "DMA2",
            "model": "DJI Mavic Air 2 Flymore Combo",
            "manufacturer": "DJI Da-Jiang Innovations"
        },
        "carrying_capacity": 0,
        "pur_date": "13-Jan-2021",
        "pur_price": 1494,
        "total_flighttime": 60,
        "cost_per_hour": 15,
        "RentalInfo": [
            {
                "rent_no": 2,
                "bond": 100,
                "rent_out": "21-Feb-2021 12:01:00",
                "rent_in": "22-Feb-2021 12:06:00",
                "custtrain_id": 2
            },
            {
                "rent_no": 5,
                "bond": 100,
                "rent_out": "25-Feb-2021 09:13:00",
                "rent_in": "25-Feb-2021 18:58:00",
                "custtrain_id": 5
            },
            {
                "rent_no": 10,
                "bond": 100,
                "rent_out": "10-Mar-2021 08:30:00",
                "rent_in": "18-Mar-2021 15:23:00",
                "custtrain_id": 1
            }
        ]
    },
    {
        "drone_id": 102,
        "type": {
            "code": "DSPA",
            "model": "DJI Spark",
            "manufacturer": "DJI Da-Jiang Innovations"
        },
        "carrying_capacity": 2,
        "pur_date": "13-Jan-2021",
        "pur_price": 872.44,
        "total_flighttime": 45.5,
        "cost_per_hour": 9,
        "RentalInfo": [
            {
                "rent_no": 3,
                "bond": 100,
                "rent_out": "22-Feb-2021 13:47:00",
                "rent_in": "23-Feb-2021 13:51:00",
                "custtrain_id": 3
            },
            {
                "rent_no": 6,
                "bond": 200,
                "rent_out": "28-Feb-2021 09:20:00",
                "rent_in": "28-Mar-2021 17:48:00",
                "custtrain_id": 6
            }
        ]
    },
    {
        "drone_id": 103,
        "type": {
            "code": "DIN2",
            "model": "DJI Inspire 2",
            "manufacturer": "DJI Da-Jiang Innovations"
        },
        "carrying_capacity": 5,
        "pur_date": "13-Jan-2021",
        "pur_price": 5300,
        "total_flighttime": 200,
        "cost_per_hour": 55,
        "RentalInfo": [
            {
                "rent_no": 7,
                "bond": 200,
                "rent_out": "01-Mar-2021 11:03:00",
                "rent_in": "02-Mar-2021 18:36:00",
                "custtrain_id": 7
            },
            {
                "rent_no": 8,
                "bond": 200,
                "rent_out": "03-Mar-2021 13:47:00",
                "rent_in": "04-Mar-2021 16:33:00",
                "custtrain_id": 8
            },
            {
                "rent_no": 9,
                "bond": 200,
                "rent_out": "06-Mar-2021 08:55:00",
                "rent_in": "10-Mar-2021 14:46:00",
                "custtrain_id": 9
            },
            {
                "rent_no": 15,
                "bond": 200,
                "rent_out": "01-May-2021 08:34:00",
                "rent_in": "02-May-2021 14:15:00",
                "custtrain_id": 8
            },
            {
                "rent_no": 16,
                "bond": 200,
                "rent_out": "03-May-2021 08:09:00",
                "rent_in": "10-May-2021 16:15:00",
                "custtrain_id": 9
            }
        ]
    },
    {
        "drone_id": 111,
        "type": {
            "code": "PAPR",
            "model": "Parrot Pro",
            "manufacturer": "Parrot"
        },
        "carrying_capacity": 5,
        "pur_date": "20-Mar-2021",
        "pur_price": 4200,
        "total_flighttime": 100,
        "cost_per_hour": 45,
        "RentalInfo": [
            {
                "rent_no": 11,
                "bond": 150,
                "rent_out": "26-Apr-2021 10:21:00",
                "rent_in": "28-Apr-2021 14:13:00",
                "custtrain_id": 10
            }
        ]
    },
    {
        "drone_id": 112,
        "type": {
            "code": "PAPR",
            "model": "Parrot Pro",
            "manufacturer": "Parrot"
        },
        "carrying_capacity": 5,
        "pur_date": "20-Mar-2021",
        "pur_price": 4200,
        "total_flighttime": 40,
        "cost_per_hour": 45,
        "RentalInfo": [
            {
                "rent_no": 12,
                "bond": 150,
                "rent_out": "26-Apr-2021 10:28:00",
                "rent_in": "27-Apr-2021 17:19:00",
                "custtrain_id": 11
            },
            {
                "rent_no": 17,
                "bond": 150,
                "rent_out": "03-May-2021 09:45:00",
                "rent_in": "07-May-2021 16:53:00",
                "custtrain_id": 14
            }
        ]
    },
    {
        "drone_id": 113,
        "type": {
            "code": "PAPR",
            "model": "Parrot Pro",
            "manufacturer": "Parrot"
        },
        "carrying_capacity": 5,
        "pur_date": "20-Mar-2021",
        "pur_price": 4000,
        "total_flighttime": 150,
        "cost_per_hour": 45,
        "RentalInfo": [
            {
                "rent_no": 13,
                "bond": 150,
                "rent_out": "28-Apr-2021 10:09:00",
                "rent_in": "29-Apr-2021 17:25:00",
                "custtrain_id": 12
            },
            {
                "rent_no": 18,
                "bond": 150,
                "rent_out": "03-May-2021 09:55:00",
                "rent_in": "12-May-2021 17:53:00",
                "custtrain_id": 15
            }
        ]
    },
    {
        "drone_id": 117,
        "type": {
            "code": "PAPR",
            "model": "Parrot Pro",
            "manufacturer": "Parrot"
        },
        "carrying_capacity": 5,
        "pur_date": "20-Mar-2021",
        "pur_price": 4000,
        "total_flighttime": 100.5,
        "cost_per_hour": 45,
        "RentalInfo": [
            {
                "rent_no": 14,
                "bond": 150,
                "rent_out": "28-Apr-2021 09:11:00",
                "rent_in": "05-May-2021 16:55:00",
                "custtrain_id": 13
            }
        ]
    },
    {
        "drone_id": 118,
        "type": {
            "code": "SWPS",
            "model": "SwellPro Spry",
            "manufacturer": "SwellPro"
        },
        "carrying_capacity": 0,
        "pur_date": "01-Apr-2021",
        "pur_price": 1599,
        "total_flighttime": 56.3,
        "cost_per_hour": 16,
        "RentalInfo": [
            {
                "rent_no": 19,
                "bond": 180,
                "rent_out": "17-May-2021 09:02:00",
                "rent_in": "18-May-2021 15:30:00",
                "custtrain_id": 16
            },
            {
                "rent_no": 20,
                "bond": 180,
                "rent_out": "19-May-2021 09:44:00",
                "rent_in": "23-May-2021 17:34:00",
                "custtrain_id": 17
            },
            {
                "rent_no": 21,
                "bond": 180,
                "rent_out": "28-May-2021 09:23:00",
                "rent_in": "29-May-2021 16:52:00",
                "custtrain_id": 18
            },
            {
                "rent_no": 22,
                "bond": 180,
                "rent_out": "01-Jun-2021 08:52:00",
                "rent_in": "07-Jun-2021 17:49:00",
                "custtrain_id": 19
            },
            {
                "rent_no": 25,
                "bond": 180,
                "rent_out": "23-Aug-2022 08:52:00",
                "rent_in": null,
                "custtrain_id": 18
            }
        ]
    },
    {
        "drone_id": 119,
        "type": {
            "code": "DIN2",
            "model": "DJI Inspire 2",
            "manufacturer": "DJI Da-Jiang Innovations"
        },
        "carrying_capacity": 5,
        "pur_date": "01-Apr-2022",
        "pur_price": 5600.8,
        "total_flighttime": 10.2,
        "cost_per_hour": 60,
        "RentalInfo": [
            {
                "rent_no": 23,
                "bond": 250,
                "rent_out": "21-Aug-2022 10:04:00",
                "rent_in": null,
                "custtrain_id": 20
            }
        ]
    },
    {
        "drone_id": 120,
        "type": {
            "code": "DIN2",
            "model": "DJI Inspire 2",
            "manufacturer": "DJI Da-Jiang Innovations"
        },
        "carrying_capacity": 5,
        "pur_date": "01-Apr-2022",
        "pur_price": 4200,
        "total_flighttime": 25.8,
        "cost_per_hour": 60,
        "RentalInfo": [
            {
                "rent_no": 24,
                "bond": 150,
                "rent_out": "22-Aug-2022 08:25:00",
                "rent_in": null,
                "custtrain_id": 21
            }
        ]
    }]);
    
db.dronerent.find({});
db.dronerent.find({}, {_id:0, drone_id:1, "type_model": 1});

//equal
//Ques a
db.dronerent.find ({"drone_id": {"$eq": 102}});

//Qb 
db.dronerent.find ({"type.code": {"$eq": "DIN2"}});

// c
db.dronerent.find (
    {"carrying_capacity": {"$gt": 4}},
    {"drone_id": 1, "type.model": 1, "cost_per_hour": 1, "_id": 0}
);

//$AND(),() 
// downpart is limit what we want as output 
db.dronerent.find (
    { "$and": [{"carrying_capacity": {"$lte": 5}},{"cost_per_hour": {"$lt": 50}}]},
    {"drone_id": 1, "carrying_capacity": 1, "cost_per_hour": 1, "_id": 0}
);

//e
db.dronerent.countDocuments ({"RentalInfo.rent_in": {"$eq": null}});

//f
db.dronerent.find (
    {"RentalInfo.rent_in": {"$eq": null}},
    {"drone_id":1, "RentalInfo.rent_out":1, "_id":0 }
);

//update
db.dronerent.find (
    {"drone_id": {"$eq": 103}},
    {"type.model": 1, "pur_date": 1, "total_flighttime" :1, "_id": 0 }
);


db.dronerent.updateOne (
    { "drone_id": {"$eq": 103}}, {"$set": {"total_flighttime": 230} }
);

db.dronerent.find (
    {"carrying_capacity": {"$gt": 0}},
    {"drone-id": 1, "pur_date": 1, "carrying_capacity" :1, "_id": 0 }
);
db.dronerent.updateMany (
    {"carrying_capacity": {"$gt": 0}}, {"$inc": {"carrying_capacity": 1} }
);

// slice -1 is the last
db.dronerent.find (
    { "$and": [ {"drone_id": {"$eq": 118}}, {"RentalInfo.rent_out": "23-Aug-2022 08:52:00"}]},
    {"RentalInfo": { "$slice": -1 }, "_id": 0}
);

db.dronerent.updateOne (
    { "$and": [ {"drone_id": {"$eq": 118}}, {"RentalInfo.rent_out": "23-Aug-2022 08:52:00"}]},
    {"$set": {"RentalInfo.$.rent_in": "25-Aug-2022 13:52:00"} }
);
db.dronerent.updateOne (
    { "$and": [ {"drone_id": {"$eq": 118}}, {"RentalInfo.rent_out": "23-Aug-2022 08:52:00"}]},
    {"$set": {"RentalInfo.$.rent_in": null} }
);
