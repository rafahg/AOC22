/**
 * Class challenges Day 1 2021 as example for 2022 framework
 *
 * @author    Rafa Hernandez
 * @created   November 2022
 */
public with sharing class AOC2021Day1 extends AOC_BaseUtils {
  public AOC2021Day1() {
    this.processInputLines('AOC2021_Day1');
    this.integers = this.stringsToInt(this.inputLines);
  }

  public Long increment = 0;

  /**
   * @method : Part1
   * @return : void method which return debug for part1 solution
   */
  public void part1() {
    for (Integer i = 0; i < this.integers.size() - 1; i++) {
      increment = (this.integers[i] < this.integers[i + 1]) ? increment + 1 : increment;
    }
    System.debug('Solution Part1 == ' + increment);
  }

  /**
   * @method : Part2
   * @return : void method which return debug for part2 solution
   */
  public void part2() {
    increment = 0;
    for (Integer i = 0; i < this.integers.size() - 3; i++) {
      Long sumA = this.integers[i] + this.integers[i + 1] + this.integers[i + 2];
      Long sumB = this.integers[i + 1] + this.integers[i + 2] + this.integers[i + 3];
      increment = (sumA < sumB) ? increment + 1 : increment;
    }
    System.debug('Solution Part2 == ' + increment);
  }
}
