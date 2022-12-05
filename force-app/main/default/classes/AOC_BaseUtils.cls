/**
 * Class to support main classes with utils methods to manage logic in challenges
 * This class is used to obtain the processed data in the constructor of the
 * the daily challenge classes when instanstiated.
 * @author    Rafa Hernandez
 * @created   November 2022
 */

public virtual class AOC_BaseUtils {
  protected List<String> inputLines;
  protected List<Integer> integers;
  protected List<String> otherInputs;
  protected String alphabetString = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
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

  protected void processInputLinesb(String srdayb) {
    List<StaticResource> srList = [
      SELECT Id, Body
      FROM StaticResource
      WHERE Name = :srdayb
    ];
    String input = (!srList.isEmpty()) ? srList[0].Body?.toString() : null;

    if (String.isBlank(input)) {
      throw new InvalidDataException('No Static Resource was found with name ' + srdayb + ': ' + JSON.serializePretty(srList));
    }

    this.otherInputs = input.split('\\n');
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

  /**
   * @method : slice
   * @params List<String> strings : List of strings to be sliced
   *         Integer first : Integer representing the index number where the slicing will start
   *         Integer last : Integer representing the number of elements since the index selected that will be sliced.
   * @return  : List with the sliced selected range.
   * @example : from [a,b,d,c] , executing slice(listToSlice, 0, 2)
   *            will return [a,b]
   */
  protected List<String> slice(List<String> listToSlice, Integer first, Integer last) {
    List<String> res = listToSlice.clone(), temp;
    Integer size = listToSlice.size(),
      startIndex = Math.min(size, Math.max(-1, first < 0 ? size + first : first)),
      endIndex = Math.min(size, Math.max(-1, last < 0 ? size + last : last - 1)),
      offset = Math.max(-1, endIndex - startIndex);
    temp = new List<String>(offset + 1);
    for (Integer h = 0, i = startIndex, j = endIndex; i <= j;) {
      temp[h++] = listToSlice[i++];
    }
    res.clear();
    res.addAll(temp);
    return res;
  }

  /**
   * @method : reverseString
   * @params List<String> strings : List of strings to be reversed
   * @return  : List reversed
   * @example : from [a,b] , executing reverseStringList(ListToReverse)
   *            will return [b,a]
   */
  private List<String> reverseStringList(List<String> stListToReverse) {
    List<String> reversed = new List<String>();
    for (Integer i = stListToReverse.size() - 1; i >= 0; i--) {
      reversed.add(stListToReverse[i]);
    }
    return reversed;
  }

  //Exception to be used across the class.
  public class InvalidDataException extends Exception {
  }
}
