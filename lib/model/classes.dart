class Class {
  final String name;
  final int numOfStudents;
  final String image;

  Class(this.name, this.numOfStudents, this.image);
}

List<Class> classes = classesData
    .map((item) => Class(item['name'], item['students'], item['image']))
    .toList();

var classesData = [
  {"name": "Flutter", 'students': 17, 'image': "assets/images/ux_design.jpg"},
  {"name": "UX Design", 'students': 25, 'image': "assets/images/ux_design.jpg"},
  {
    "name": "Cloud Computing",
    'students': 13,
    'image': "assets/images/cloud.jpg"
  },
  {"name": "Compiler Engineering", 'students': 17, 'image': "assets/images/ux_design.jpg"},
  {"name": "Compiler Engineering", 'students': 17, 'image': "assets/images/compiler.jpg"},
  {"name": "Compiler Engineering", 'students': 17, 'image': "assets/images/cloud.jpg"},
  {"name": "Compiler Engineering", 'students': 17, 'image': "assets/images/compiler.jpg"},
  
];
