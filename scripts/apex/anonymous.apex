// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents


String test = 'R120';
System.debug(test.split('R').get(1));


AOC2021Day1 instance = new AOC2021Day1();

instance.part1();
instance.part2();

AOC2016Day1 instance2016 = new AOC2016Day1();

instance2016.processData();

instance2016.calculatePosition();
instance2016.distanceFromOrigin();

