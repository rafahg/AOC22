/**
 * Class challenges Day 1 2021 as example for 2022 framework
 *
 * @author    Rafa Hernandez
 * @created   December 2022
 */
public with sharing class AOC2022_Day1 extends AOC_BaseUtils {
  public AOC2022_Day1() {
    this.processInputLines('AOC2022_Day1_Example');
  }

  /**
   * @method : Part1
   * @return : void method which return debug for part1 solution
   */
  public void part1() {
    List<Integer> result = caloriesPerElf(this.inputLines);
    result.sort();

    System.debug('Solution Part1 ---> ' + result.get(result.size() - 1));
  }

  /**
   * @method : Part1
   * @return : void method which return debug for part1 solution
   */
  public void part2() {
    List<Integer> result = caloriesPerElf(this.inputLines);
    result.sort();
    Integer firstElf = result.get(result.size() - 3);
    Integer secondElf = result.get(result.size() - 2);
    Integer thirdElf = result.get(result.size() - 1);

    System.debug('Solution Part2 ---> ' + firstElf + secondElf + thirdElf);
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
    return result;
  }
}
