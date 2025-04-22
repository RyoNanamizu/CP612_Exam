const Fuse = require('fuse.js');

const students = [
  { StudentID: 2001, Name: "Emily Zhang", Major: "Computer Science", University: "WLU" },
  { StudentID: 2002, Name: "John Park", Major: "Computer Science", University: "YorkU" },
  { StudentID: 2003, Name: "Tina Wang", Major: "Software Engineering", University: "UofWaterloo" },
  { StudentID: 2004, Name: "Ahmed Ali", Major: "Information Systems", University: "York university" },
  { StudentID: 2005, Name: "Maria Gomez", Major: "Business Analytics", University: "NUS" },
  { StudentID: 2006, Name: "Leo Martin", Major: "Cybersecurity", University: "Standford University" }
];

const universities = [
  { UniversityName: "Wilfrid Laurier University", Country: "Canada" },
  { UniversityName: "York University", Country: "Canada" },
  { UniversityName: "University of Waterloo", Country: "Canada" },
  { UniversityName: "Stanford University", Country: "United States" },
  { UniversityName: "National University of Singapore", Country: "Singapore" }
];

const fuse = new Fuse(universities, {
  keys: ['UniversityName'],
  threshold: 0.3
});

let matched = [];

students.forEach(student => {
  const result = fuse.search(student.University);
  if (result.length > 0) {
    const bestMatch = result[0].item;
    matched.push({
      ...student,
      MatchedUniversity: bestMatch.UniversityName,
      Country: bestMatch.Country
    });
  }
});

const csInCanada = matched.filter(student => 
  student.Major === "Computer Science" && student.Country === "Canada"
);

console.log("Number of Computer Science students in Canadian universities:", csInCanada.length);
