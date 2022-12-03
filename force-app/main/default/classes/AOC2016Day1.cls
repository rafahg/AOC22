/**
 * Class challenge Day 1 2016 as example for 2022 framework
 *
 * @author    Rafa Hernandez
 * @created   November 2022
 */
public with sharing class AOC2016Day1 extends AOC_BaseUtils {
  public AOC2016Day1() {
    this.processInputLines('AOC2016_Day1_Example');
  }

  private Integer X1 = 0;
  private Integer X2 = 0;
  private Integer Y1 = 0;
  private Integer Y2 = 0;
  private String currentDirection = 'N';
  List<List<Integer>> locations = new List<List<Integer>>();
  Boolean isLocationRepeated = false;
  List<Integer> bunnyHQ = new List<Integer>();

  public void processData() {
    String dataFullString = String.join(this.inputLines, ',').deleteWhiteSpace();

    this.inputLines = dataFullString.split(',');
  }

  public void calculatePosition() {
    Integer steps;
    for (String instruction : this.inputLines) {
      String direction = obtainDirection(currentDirection, instruction.split('').get(0));
      if (instruction.split('').size() == 2) {
        steps = Integer.valueOf(instruction.split('').get(1));
      } else {
        if (instruction.contains('R')) {
          steps = Integer.valueOf(instruction.split('R').get(1));
        } else {
          steps = Integer.valueOf(instruction.split('L').get(1));
        }
      }

      currentDirection = direction;
      if (!isLocationRepeated)
        buildPath(currentDirection, steps);

      if (currentDirection == 'N') {
        Y2 += steps;
      } else if (currentDirection == 'S') {
        Y2 -= steps;
      }

      if (currentDirection == 'E') {
        X2 += steps;
      } else if (currentDirection == 'W') {
        X2 -= steps;
      }
    }

    System.debug(locations);
  }

  public void buildPath(String orientation, Integer steps) {
    Integer coordinateX = X2;
    Integer coordinateY = Y2;
    for (Integer i = 0; i < steps; i++) {
      if (orientation == 'N') {
        List<Integer> location = new List<Integer>{ coordinateX, coordinateY++ };
        if (!locations.contains(location)) {
          locations.add(location);
        } else {
          bunnyHQ = location;
          isLocationRepeated = true;
        }
      } else if (orientation == 'S') {
        List<Integer> location = new List<Integer>{ coordinateX, coordinateY-- };
        if (!locations.contains(location)) {
          locations.add(location);
        } else {
          bunnyHQ = location;
          isLocationRepeated = true;
        }
      }
      if (orientation == 'E') {
        List<Integer> location = new List<Integer>{ coordinateX++, coordinateY };
        if (!locations.contains(location)) {
          locations.add(location);
        } else {
          bunnyHQ = location;
          isLocationRepeated = true;
        }
      } else if (orientation == 'W') {
        List<Integer> location = new List<Integer>{ coordinateX--, coordinateY };
        if (!locations.contains(location)) {
          locations.add(location);
        } else {
          bunnyHQ = location;
          isLocationRepeated = true;
        }
      }
    }
  }

  public void distanceFromOrigin() {
    //distance between 2 points ==> |x1 - x2 | + | y1 - y2 |

    Integer xAbsValue = ((X1 - X2) < 0) ? (X1 - X2) * -1 : (X1 - X2);
    Integer yAbsValue = ((Y1 - Y2) < 0) ? (Y1 - Y2) * -1 : (Y1 - Y2);
    System.debug('Part 1 Solution ==== ' + (xAbsValue + yAbsValue));

    if (bunnyHQ.size() > 0) {
      Integer bunnyHQxAbsvalue = (X1 - bunnyHQ.get(0)) * -1;
      Integer bunnyHQyAbsvalue = (X1 - bunnyHQ.get(1)) * -1;
      System.debug('Part 2 Solution ==== ' + (bunnyHQxAbsvalue + bunnyHQyAbsvalue));
    }
  }

  public String obtainDirection(String currentDirection, String directionCommand) {
    if (currentDirection == 'N' && directionCommand == 'R') {
      currentDirection = 'E';
    } else if (currentDirection == 'N' && directionCommand == 'L') {
      currentDirection = 'W';
    } else if (currentDirection == 'S' && directionCommand == 'R') {
      currentDirection = 'W';
    } else if (currentDirection == 'S' && directionCommand == 'L') {
      currentDirection = 'E';
    } else if (currentDirection == 'W' && directionCommand == 'R') {
      currentDirection = 'N';
    } else if (currentDirection == 'W' && directionCommand == 'L') {
      currentDirection = 'S';
    } else if (currentDirection == 'E' && directionCommand == 'R') {
      currentDirection = 'S';
    } else if (currentDirection == 'E' && directionCommand == 'L') {
      currentDirection = 'N';
    }

    return currentDirection;
  }
}
