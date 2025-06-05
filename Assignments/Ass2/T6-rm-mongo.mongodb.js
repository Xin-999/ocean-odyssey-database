// *****PLEASE ENTER YOUR DETAILS BELOW*****
// T6-rm-mongo.mongodb.js

// Student ID: 33520054
// Student Name: Ang Qiao Xin

// Comments for your marker:

// ===================================================================================
// DO NOT modify or remove any of the comments below (items marked with //)
// ===================================================================================

// Use (connect to) your database - you MUST update xyz001
// with your authcate username

use("qang0004");

// (b)
// PLEASE PLACE REQUIRED MONGODB COMMAND TO CREATE THE COLLECTION HERE
// YOU MAY PICK ANY COLLECTION NAME
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Drop collection
db.teams.drop();

// Create collection and insert documents
db.teams.insertMany([
    {"_id":1,"carn_name":"RM Summer Series Caulfield 2025","carn_date":"02-Feb-2025","team_name":"Golden Striders","team_leader":{"name":"Jasmine Lim","phone":"0401234567","email":"jasmine.lim@gmail.com"},"team_no_of_members":4,"team_members":[{"competitor_name":"Jasmine Lim","competitor_phone":"0401234567","event_type":"3 Km Community Run/Walk","entry_no":1,"starttime":"08:31:31","finishtime":"09:46:31","elapsedtime":"00:15:00"},{"competitor_name":"Kevin Ong","competitor_phone":"0411111111","event_type":"3 Km Community Run/Walk","entry_no":2,"starttime":"08:31:31","finishtime":"09:00:31","elapsedtime":"00:29:00"},{"competitor_name":"Lydia Yap","competitor_phone":"0422222222","event_type":"3 Km Community Run/Walk","entry_no":3,"starttime":"08:31:31","finishtime":"09:35:31","elapsedtime":"01:04:00"},{"competitor_name":"Chloe Ng","competitor_phone":"0434567890","event_type":"5 Km Run","entry_no":3,"starttime":"08:31:11","finishtime":"10:05:11","elapsedtime":"01:34:00"}]},
    {"_id":2,"carn_name":"RM Spring Series Clayton 2024","carn_date":"22-Sep-2024","team_name":"Urban Cheetahs","team_leader":{"name":"Nina Tan","phone":"0444444444","email":"nina.tan@student.monash.edu"},"team_no_of_members":7,"team_members":[{"competitor_name":"Ben Lim","competitor_phone":"0423456789","event_type":"21.1 Km Half Marathon","entry_no":1,"starttime":"08:01:12","finishtime":"09:51:12","elapsedtime":"01:50:00"},{"competitor_name":"Chloe Ng","competitor_phone":"0434567890","event_type":"10 Km Run","entry_no":1,"starttime":"08:31:25","finishtime":"10:21:25","elapsedtime":"01:50:00"},{"competitor_name":"Kevin Ong","competitor_phone":"0411111111","event_type":"21.1 Km Half Marathon","entry_no":2,"starttime":"08:30:48","finishtime":"10:12:48","elapsedtime":"01:42:00"},{"competitor_name":"Nina Tan","competitor_phone":"0444444444","event_type":"5 Km Run","entry_no":3,"starttime":"09:31:11","finishtime":"10:05:11","elapsedtime":"00:34:00"},{"competitor_name":"Lydia Yap","competitor_phone":"0422222222","event_type":"21.1 Km Half Marathon","entry_no":3,"starttime":"08:31:48","finishtime":"10:13:48","elapsedtime":"01:42:00"},{"competitor_name":"Alice Tan","competitor_phone":"0412345678","event_type":"5 Km Run","entry_no":4,"starttime":"09:31:11","finishtime":"10:05:11","elapsedtime":"00:34:00"},{"competitor_name":"Ben Lim","competitor_phone":"0423456789","event_type":"5 Km Run","entry_no":5,"starttime":"09:31:11","finishtime":"10:05:11","elapsedtime":"00:34:00"}]},
    {"_id":3,"carn_name":"RM Summer Series Caulfield 2025","carn_date":"02-Feb-2025","team_name":"Mighty Pacers","team_leader":{"name":"Hannah Kaur","phone":"0489012345","email":"hannah.kaur@gmail.com"},"team_no_of_members":2,"team_members":[{"competitor_name":"Hannah Kaur","competitor_phone":"0489012345","event_type":"5 Km Run","entry_no":1,"starttime":"08:31:13","finishtime":"09:06:13","elapsedtime":"00:35:00"},{"competitor_name":"Fiona Low","competitor_phone":"0467890123","event_type":"5 Km Run","entry_no":2,"starttime":"-","finishtime":"-","elapsedtime":"-"}]},
    {"_id":4,"carn_name":"RM Winter Series Caulfield 2025","carn_date":"29-Jun-2025","team_name":"Speed Frank","team_leader":{"name":"Ben Lim","phone":"0423456789","email":"ben.lim@student.monash.edu"},"team_no_of_members":2,"team_members":[{"competitor_name":"Ben Lim","competitor_phone":"0423456789","event_type":"21.1 Km Half Marathon","entry_no":1,"starttime":"08:00:58","finishtime":"08:39:58","elapsedtime":"00:39:00"},{"competitor_name":"Kevin Ong","competitor_phone":"0411111111","event_type":"21.1 Km Half Marathon","entry_no":2,"starttime":"08:00:32","finishtime":"10:48:32","elapsedtime":"02:48:00"}]},
    {"_id":6,"carn_name":"RM Autumn Series Clayton 2025","carn_date":"15-Mar-2025","team_name":"Golden Striders","team_leader":{"name":"Nina Tan","phone":"0444444444","email":"nina.tan@student.monash.edu"},"team_no_of_members":2,"team_members":[{"competitor_name":"Nina Tan","competitor_phone":"0444444444","event_type":"3 Km Community Run/Walk","entry_no":1,"starttime":"08:00:44","finishtime":"09:04:44","elapsedtime":"01:04:00"},{"competitor_name":"Jasmine Lim","competitor_phone":"0401234567","event_type":"3 Km Community Run/Walk","entry_no":2,"starttime":"08:31:06","finishtime":"09:13:06","elapsedtime":"00:42:00"}]}
]);   



// List all documents you added
db.teams.find();


// (c)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

db.teams.find(
  {
    "team_members.event_type": { "$in": [ "5 Km Run", "10 Km Run" ] }
  },
  {
    _id: 0,
    carn_date: 1,
    carn_name: 1,
    team_name: 1,
    "team_leader.name": 1
  }
);




// (d)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer


// (i) Add new team
db.teams.insertOne({
    _id: 888,
    carn_name : "RM WINTER SERIES CAULFIELD 2025",
    carn_date : "29-Jun-2025",
    team_name : "The Great Runners",
    team_leader : {
        name  : "Jackson Bull",
        phone : "0422412524",
        email : "jackson.bull@example.com"
    },
    team_no_of_members : 1,
    team_members : [
        {
            competitor_name  : "Jackson Bull",
            competitor_phone : "0422412524",
            event_type       : "5 Km Run",
            entry_no         : 1,
            starttime        : "-",
            finishtime       : "-",
            elapsedtime      : "-"
        }
    ]
});




// Illustrate/confirm changes made
db.teams.find(
    { team_name : "The Great Runners",
      carn_name : "RM WINTER SERIES CAULFIELD 2025" }
);




// (ii) Add new team member





// Illustrate/confirm changes made


