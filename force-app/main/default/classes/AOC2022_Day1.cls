/**
 * Class challenge Day 1 2022
 *
 * @author    Rafa Hernandez
 * @created   December 2022
 */
public with sharing class AOC2022_Day1 extends AOC_BaseUtils {
  public AOC2022_Day1() {
    this.processInputLines('AOC2022_Day1_Example');
  }

  private List<Integer> results = new List<Integer>();

  /**
   * @method : run
   * @return : void method to run the code using anonymous apex script.
   */
  public void run() {
    caloriesPerElf(this.inputLines);
    part1();
    part2();
  }

  /**
   * @method : Part1
   * @return : void method which return debug for part1 solution
   */
  private void part1() {
    System.debug('Solution Part1 ---> ' + results.get(results.size() - 1));
  }

  /**
   * @method : Part2
   * @return : void method which return debug for part2 solution
   */
  private void part2() {
    Integer firstElf = results.get(results.size() - 3);
    Integer secondElf = results.get(results.size() - 2);
    Integer thirdElf = results.get(results.size() - 1);
    System.debug('Solution Part2 ---> ' + (firstElf + secondElf + thirdElf));
  }

  /**
   * @method : caloriesPerElf
   * @params : List<String> with the input of the challenge processed as list of strings
   * @return : List<Integer> where each element of the list is the sum of the calories per elf.
   */
  private List<Integer> caloriesPerElf(List<String> inputs) {
    List<Integer> result = new List<Integer>();
    Integer sum = 0;
    Integer index = 0;
    for (String input : inputs) {
      if (input != '') {
        sum += Integer.valueOf(input);
        if (index == inputs.size() - 1) {
          result.add(sum);
        }
      } else {
        result.add(sum);
        sum = 0;
      }
      index++;
    }
    result.sort();
    results = result;
    return results;
  }
}
