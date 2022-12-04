/**
 * Class challenge Day 4 2022
 *
 * @author    Rafa Hernandez
 * @created   December 2022
 */
public with sharing class AOC2022_Day4 extends AOC_BaseUtils {
  public AOC2022_Day4() {
    this.processInputLines('AOC2022_Day4_Example');
  }

  // Class variables to storage solutions.
  private Integer sumPart1 = 0;
  private Integer sumPart2 = 0;

  /**
   * @method : run
   * @return : void method to run the code using anonymous apex script.
   */
  public void run() {
    comparePairs(this.inputLines);
    part1();
    part2();
  }

  /**
   * @method : Part1
   * @return : void method which return debug for part1 solution
   */
  private void part1() {
    System.debug('Solution Part1 === ' + sumPart1);
  }

  /**
   * @method : Part2
   * @return : void method which return debug for part2 solution
   */
  private void part2() {
    System.debug('Solution Part2 === ' + sumPart2);
  }

  /**
   * @method : comparePairs
   * @return : void method which will compare each pair of assignments and will sum
   *           those which comply with the requirement of part1 and part2
   */
  private void comparePairs(List<String> pairsWorkAssigments) {
    for (String assigment : pairsWorkAssigments) {
      List<String> separateAssigments = assigment.split(',');
      Integer firstPairStart = Integer.valueOf(separateAssigments[0].substringBefore('-'));
      Integer firstPairEnd = Integer.valueOf(separateAssigments[0].substringAfter('-'));
      Integer secondPairStart = Integer.valueOf(separateAssigments[1].substringBefore('-'));
      Integer secondPairEnd = Integer.valueOf(separateAssigments[1].substringAfter('-'));
      if (
        (firstPairStart <= secondPairStart && firstPairEnd >= secondPairEnd) ||
        (firstPairStart >= secondPairStart &&
        firstPairEnd <= secondPairEnd)
      ) {
        sumPart1 += 1;
      }

      if (firstPairEnd >= secondPairStart && secondPairEnd >= firstPairStart) {
        sumPart2 += 1;
      }
    }
  }
}
