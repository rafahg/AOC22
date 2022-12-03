/**
 * Class challenge Day 2 2022
 *
 * @author    Rafa Hernandez
 * @created   December 2022
 */
public with sharing class AOC2022_Day2 extends AOC_BaseUtils {
  public AOC2022_Day2() {
    this.processInputLines('AOC2022_Day2_Example');
  }

  String elfChoice;
  String santasHelperChoice;
  Integer santasHelperPoints = 0;
  Integer ElfPoints = 0;
  Boolean isPart2Execution = false;

  AOC2022_Day2.dataProvider dp = new AOC2022_Day2.dataProvider();
  /**
   * @method : run
   * @return : void method to run the code using anonymous apex script.
   */
  public void run() {
    part1();
    part2();
  }

  /**
   * @method : Part1
   * @return : void method which return debug for part1 solution
   */
  private void part1() {
    for (String roundChoices : this.inputLines) {
      roundResults roundOutcome = resultOfTheRound(roundChoices);
      pointsCalculator(roundOutcome);
    }
    System.debug('santasHelperPoints === ' + santasHelperPoints);
  }

  /**
   * @method : Part2
   * @return : void method which return debug for part2 solution
   */
  private void part2() {
    isPart2Execution = true;
    ElfPoints = 0;
    santasHelperPoints = 0;
    for (String roundChoices : this.inputLines) {
      roundResults roundOutcome = resultOfTheRound(roundChoices);
      pointsCalculator(roundOutcome);
    }
    System.debug('santasHelperPointsPart2 === ' + santasHelperPoints);
  }

  private roundResults resultOfTheRound(String roundChoices) {
    roundResults roundResultsInstance = new roundResults();
    elfChoice = roundChoices.substringBefore(' ');
    santasHelperChoice = roundChoices.substringAfter(' ');
    if (isPart2Execution) {
      changeStrategy(santasHelperChoice);
    }
    roundResultsInstance.elfChoice = elfChoice;
    roundResultsInstance.santasHelperChoice = santasHelperChoice;
    // posible scenarios :
    if (dp.gameElements.get(elfChoice) == dp.gameElements.get(santasHelperChoice)) {
      roundResultsInstance.result = 'DRAW';
    }
    if (dp.gameElements.get(elfChoice) == 'ROCK' && dp.gameElements.get(santasHelperChoice) == 'PAPER') {
      roundResultsInstance.result = 'SANTASHELPERWIN';
    } else if (dp.gameElements.get(elfChoice) == 'ROCK' && dp.gameElements.get(santasHelperChoice) == 'SCISSORS') {
      roundResultsInstance.result = 'ELFWIN';
    } else if (dp.gameElements.get(elfChoice) == 'PAPER' && dp.gameElements.get(santasHelperChoice) == 'ROCK') {
      roundResultsInstance.result = 'ELFWIN';
    } else if (dp.gameElements.get(elfChoice) == 'PAPER' && dp.gameElements.get(santasHelperChoice) == 'SCISSORS') {
      roundResultsInstance.result = 'SANTASHELPERWIN';
    } else if (dp.gameElements.get(elfChoice) == 'SCISSORS' && dp.gameElements.get(santasHelperChoice) == 'ROCK') {
      roundResultsInstance.result = 'SANTASHELPERWIN';
    } else if (dp.gameElements.get(elfChoice) == 'SCISSORS' && dp.gameElements.get(santasHelperChoice) == 'PAPER') {
      roundResultsInstance.result = 'ELFWIN';
    }
    return roundResultsInstance;
  }

  private void changeStrategy(String command) {
    if (command == 'X' && elfChoice == 'A') {
      santasHelperChoice = 'C';
    } else if (command == 'X' && elfChoice == 'B') {
      santasHelperChoice = 'A';
    } else if (command == 'X' && elfChoice == 'C') {
      santasHelperChoice = 'B';
    } else if (command == 'Z' && elfChoice == 'A') {
      santasHelperChoice = 'B';
    } else if (command == 'Z' && elfChoice == 'B') {
      santasHelperChoice = 'C';
    } else if (command == 'Z' && elfChoice == 'C') {
      santasHelperChoice = 'A';
    } else if (command == 'Y') {
      santasHelperChoice = elfChoice;
    }
  }

  private void pointsCalculator(roundResults roundResult) {
    // method to calculate and distribute the points for each round.
    if (roundResult.result == 'ELFWIN') {
      ElfPoints += dp.gamePoints.get(roundResult.result);
      ElfPoints += dp.gamePoints.get(dp.gameElements.get(roundResult.elfChoice));
      santasHelperPoints += dp.gamePoints.get(dp.gameElements.get(roundResult.santasHelperChoice));
    } else if (roundResult.result == 'SANTASHELPERWIN') {
      santasHelperPoints += dp.gamePoints.get(roundResult.result);
      santasHelperPoints += dp.gamePoints.get(dp.gameElements.get(roundResult.santasHelperChoice));
      ElfPoints += dp.gamePoints.get(dp.gameElements.get(roundResult.elfChoice));
    } else {
      santasHelperPoints += dp.gamePoints.get(roundResult.result);
      santasHelperPoints += dp.gamePoints.get(dp.gameElements.get(roundResult.santasHelperChoice));
      ElfPoints += dp.gamePoints.get(roundResult.result);
      ElfPoints += dp.gamePoints.get(dp.gameElements.get(roundResult.elfChoice));
    }
  }

  private class dataProvider {
    Map<String, String> gameElements = new Map<String, String>{
      'A' => 'ROCK',
      'B' => 'PAPER',
      'C' => 'SCISSORS',
      'X' => 'ROCK',
      'Y' => 'PAPER',
      'Z' => 'SCISSORS'
    };

    Map<String, Integer> gamePoints = new Map<String, Integer>{
      'ELFWIN' => 6,
      'SANTASHELPERWIN' => 6,
      'DRAW' => 3,
      'LOSE' => 0,
      'ROCK' => 1,
      'PAPER' => 2,
      'SCISSORS' => 3
    };
  }

  private class roundResults {
    String result;
    String elfChoice;
    String santasHelperChoice;
  }
}
