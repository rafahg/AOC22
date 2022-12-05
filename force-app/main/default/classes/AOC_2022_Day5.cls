// Temporary solution that is working but needs massive refactoring. Is efficient though.
/**
 * Class challenge Day 5 2022
 *
 * @author    Rafa Hernandez
 * @created   December 2022
 */
public with sharing class AOC_2022_Day5 extends AOC_BaseUtils {
  public AOC_2022_Day5() {
    this.processInputLines('AOC2022_Day5_Example');
    this.processInputLinesb('AOC2022_Day5b_Example');
  }

  Map<Integer, Integer> columnsNumberAndIndex = new Map<Integer, Integer>();
  Map<Integer, List<String>> cratesOrganisation = new Map<Integer, List<String>>();
  Map<Integer, List<String>> organisedCargo = new Map<Integer, List<String>>();
  Boolean isPart2Execution = false;
  /**
   * @method : run
   * @return : void method to run the code using anonymous apex script.
   */
  public void run() {
    organisingStartingCrates();
    assigningCratesToInitialColumn();
    isPart2Execution = true;
    executingCommands(this.otherInputs, cratesOrganisation);
    part1();
    part2();
  }

  /**
   * @method : Part1
   * @return : void method which return debug for part1 solution
   */
  private void part1() {
    String result = '';
    for (Integer i = 1; i <= 9; i++) {
      result += cratesOrganisation.get(i)[0];
    }
    System.debug(result);
  }

  /**
   * @method : Part2
   * @return : void method which return debug for part2 solution
   */
  private void part2() {
    String result = '';
    for (Integer i = 1; i <= 9; i++) {
      result += cratesOrganisation.get(i)[0];
    }
    System.debug(result);
  }

  private void organisingStartingCrates() {
    List<String> columnsLine = this.inputLines[this.inputLines.size() - 1].split('');
    for (String character : columnsLine) {
      Integer columnIndex;
      if (character.isNumeric()) {
        columnIndex = columnsLine.indexOf(character);
        columnsNumberAndIndex.put(Integer.valueOf(character), columnIndex);
      }
    }
  }

  private void assigningCratesToInitialColumn() {
    for (Integer item : columnsNumberAndIndex.keySet()) {
      cratesOrganisation.put(item, new List<String>());
    }
    List<String> listToManage = this.inputLines;
    Integer lastEl = this.inputLines.size() - 1;
    listToManage.remove(lastEl);
    for (String line : listToManage) {
      String[] lineTocheck = line.split('');
      for (Integer idx : columnsNumberAndIndex.values()) {
        String charInLine = lineTocheck[idx];
        if (charInLine.isAlpha()) {
          cratesOrganisation.get(getKey(columnsNumberAndIndex, idx)).add(charInLine);
        }
      }
    }
    System.debug(cratesOrganisation);
  }

  private void executingCommands(List<String> commands, Map<Integer, List<String>> originalPosition) {
    for (String commandLine : commands) {
      List<String> cleanCommand = commandLine.remove('move ').remove(' from ').remove(' to ').split('');
      // Instructions
      Integer amount = cleanCommand.size() == 4 ? Integer.valueOf(cleanCommand[0] + cleanCommand[1]) : Integer.valueOf(cleanCommand[0]);
      Integer startFrom = Integer.valueOf(cleanCommand[cleanCommand.size() - 2]);
      Integer placeIn = Integer.valueOf(cleanCommand[cleanCommand.size() - 1]);
      if (!isPart2Execution) {
        for (Integer i = 0; i < amount; i++) {
          String crateToMove = originalPosition.get(startFrom).remove(0);
          //System.debug('crateToMove == ' + crateToMove);
          if (originalPosition.get(placeIn).isEmpty()) {
            originalPosition.get(placeIn).add(crateToMove);
          } else {
            originalPosition.get(placeIn).add(0, crateToMove);
          }
        }
      } else {
        System.debug('------------Part2 Execution -------------');
        List<String> cratesToMoveAtOnce = new List<String>();
        for (Integer i = 0; i < amount; i++) {
          String crateToMove = originalPosition.get(startFrom).remove(0);
          cratesToMoveAtOnce.add(crateToMove);
          System.debug('cratesToMoveAtOnce ==== ' + cratesToMoveAtOnce);
        }

        for (Integer i = 0; i < amount; i++) {
          String crateToMoveFinal = cratesToMoveAtOnce.remove(cratesToMoveAtOnce.size() - 1);
          System.debug('crateToMove === ' + crateToMoveFinal);
          if (originalPosition.get(placeIn).isEmpty()) {
            originalPosition.get(placeIn).add(crateToMoveFinal);
          } else {
            originalPosition.get(placeIn).add(0, crateToMoveFinal);
          }
        }

        cratesToMoveAtOnce.clear();
        System.debug(originalPosition);
      }
    }
  }

  private Integer getKey(Map<Integer, Integer> mapToCheck, Integer value) {
    Integer result;
    for (Integer key : mapToCheck.keySet()) {
      if (mapToCheck.get(key) == value) {
        result = key;
      }
    }
    return result;
  }
}
