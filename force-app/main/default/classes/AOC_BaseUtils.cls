/**
 * Class to support utils methods to manage logic in challenges
 * This class is used to obtain the processed data in the constructor of the
 * the daily challenge classes when instanstiated.
 * @author    Rafa Hernandez
 * @created   November 2022
 */

public virtual class AOC_BaseUtils {
  protected List<String> inputLines;
  protected List<Integer> integers;

  /**
   * @method : processInputLines
   * @params String srday : String with the name of the static resource which will be passed in
   * the query to obtain the data to be processed.
   */
  protected void processInputLines(String srday) {
    List<StaticResource> srList = [
      SELECT Id, Body
      FROM StaticResource
      WHERE Name = :srday
    ];
    String input = (!srList.isEmpty()) ? srList[0].Body?.toString() : null;

    if (String.isBlank(input)) {
      throw new InvalidDataException('No Static Resource was found with name ' + srday + ': ' + JSON.serializePretty(srList));
    }

    this.inputLines = input.split('\\n');
  }

  /**
   * @method : stringsToInt
   * @params List<String> strings : List of strings to be converted in Integers if needed.
   * @return : List of Integers to be used.
   */
  protected List<Integer> stringsToInt(List<String> strings) {
    List<Integer> intsPlacement = new List<Integer>();
    System.debug(strings);
    for (String stringInput : strings) {
      intsPlacement.add(Integer.valueOf(stringInput));
    }

    return this.integers = intsPlacement;
  }


  //Exception to be used across the class.
  public class InvalidDataException extends Exception {}
}
