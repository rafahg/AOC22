/**
 * Class challenge Day 3 2022
 *
 * @author    Rafa Hernandez
 * @created   December 2022
 */
public with sharing class AOC2022_Day3 extends AOC_BaseUtils {
  public AOC2022_Day3() {
    this.processInputLines('AOC2022_Day3_Example');
  }

  private Map<String, Integer> alphabetPriorityValues = new Map<String, Integer>();

  /**
   * @method : run
   * @return : void method to run the code using anonymous apex script.
   */
  public void run() {
    assignPriorityValues(this.alphabetString);
    part1();
    part2();
  }

  /**
   * @method : Part1
   * @return : void method which return debug for part1 solution
   */
  private void part1() {
    //some logic here
    Integer result = obtainingFinalValue(this.inputLines);
    System.debug('Solution Part1 === ' + result);
  }

  /**
   * @method : Part2
   * @return : void method which return debug for part2 solution
   */
  private void part2() {
    Map<Integer, List<String>> groupsOf3 = creatingGroupsOf3(this.inputLines);
    List<String> allTheBadges = findAllBadges(groupsOf3);
    Integer sum = 0;
    for (String badge : allTheBadges) {
      sum += alphabetPriorityValues.get(badge);
    }
    System.debug('Solution Part 2 === ' + sum);
  }

  /**
   * @method : obtainingFinalValue
   * @param : List<String> List of strings.
   * @return : Integer. It will returm the sum of the values according to Part1 requirements.
   */
  private Integer obtainingFinalValue(List<String> fullListOfItems) {
    Integer sum = 0;
    for (String lineOfItems : fullListOfItems) {
      String duplicate = detectingDuplicate(lineOfItems);
      Integer value = assignValueToDuplicates(duplicate);
      sum += value;
    }
    return sum;
  }

  /**
   * @method : assigValueToDuplicates
   * @param : String. The individual duplicate item that is present in every input line.
   * @return : Integer. The value that the particular item holds according to the challenge description.
   */
  private Integer assignValueToDuplicates(String duplicate) {
    return alphabetPriorityValues.get(duplicate);
  }

  /**
   * @method : detectingDuplicate
   * @param : String. Representing and individual line in the challenge input.
   * @return : String. It will return the character in the input that is duplicated in each half of the string for part1 requirement.
   */
  private String detectingDuplicate(String itemsInRugPack) {
    String duplicate;
    //System.debug(itemsInRugPack);
    List<String> itemsToCheck = dividingItems(itemsInRugPack);
    //System.debug(itemsToCheck);
    for (String item : itemsToCheck[0].split('')) {
      if (itemsToCheck[1].countMatches(item) > 0 && String.isBlank(duplicate)) {
        duplicate = item;
      }
    }
    return duplicate;
  }

  /**
   * @method : dividingItems
   * @param : String. Representing and individual line in the challenge input.
   * @return : List<String> Returns a List which its elements are each half of and individual line in the challenge input.
   */
  private List<String> dividingItems(String fullLineOfItems) {
    Integer numberOfItems = fullLineOfItems.split('').size();
    String firstHalf = fullLineOfItems.left(numberOfItems / 2);
    String secondHalf = fullLineOfItems.right(numberOfItems / 2);
    List<String> dividedLine = new List<String>{ firstHalf, secondHalf };
    return dividedLine;
  }

  /**
   * @method : assignPriorityValues
   * @param : String. The string containing the alphabet, including capital letters.
   * @return : void. This method assign values to every letter in the alphabet and storage them in
   *           alphabetPriorityValues class map.
   */
  private void assignPriorityValues(String alphabetSet) {
    Integer value = 1;
    for (String letter : alphabetSet.split('')) {
      alphabetPriorityValues.put(letter, value);
      value++;
    }
    // Checking if the map is correctly created with the correct values , if not, will fail miserably.
    System.assert(alphabetPriorityValues.get('a') == 1);
    System.assert(alphabetPriorityValues.get('z') == 26);
    System.assert(alphabetPriorityValues.get('A') == 27);
    System.assert(alphabetPriorityValues.get('Z') == 52);
  }

  /**
   * @method : creatingGroupsOf3
   * @param : List<String> List containing all inputs obtaining from teh challenge input.
   * @return : Returns a Map with Key : Integer , value : List of string with the number of inputs in the group.
   *           according to the part2 requirements, every group will be formed of 3 inputs lines.
   */
  private Map<Integer, List<String>> creatingGroupsOf3(List<String> allBackPacks) {
    Map<Integer, List<String>> groupsOf3 = new Map<Integer, List<String>>();
    Integer times = allBackPacks.size() / 3;
    Integer startSlice = 0;
    Integer endSlice = 3;
    for (Integer t = 0; t < times; t++) {
      List<String> groupOf3 = slice(allBackPacks, startSlice, endSlice);
      groupsOf3.put(t + 1, groupOf3);
      startSlice += 3;
      endSlice += 3;
    }
    return groupsOf3;
  }

  /**
   * @method : findAllBadges
   * @param : Map<Integer, List<String>>, map obtained in method creatingGroupsOf3
   * @return : Returns a List of string which elements are the character that is repeated in
   *           all the items of a group, according to part2 requirements.
   */
  private List<String> findAllBadges(Map<Integer, List<String>> allgroups) {
    List<String> allBadges = new List<String>();

    for (List<String> packsIngroup : allgroups.values()) {
      String foundItem;
      for (String item : packsIngroup[0].split('')) {
        if (packsIngroup[1].countMatches(item) > 0 && packsIngroup[2].countMatches(item) > 0 && String.isBlank(foundItem)) {
          foundItem = item;
          allBadges.add(item);
        }
      }
    }
    return allBadges;
  }
}
