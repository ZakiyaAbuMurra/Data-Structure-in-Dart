void main() {
  //Reverse a List
  List<dynamic> myList = [1, 2, 3, 4, 5,6,7,8,9];
  print('The List: $myList');
  print('Reversed List: ${reverseList(myList)}');
  print('+++++++++++++++++++++++++++++++++++++++++++++++++');
  //Balance the Parentheses
  String testString1 = "(()()())";
  String testString2 = "(((((()))))";
  print('$testString1 is  ${isParenthesesBalanced(testString1)}');
  print('$testString2 is ${isParenthesesBalanced(testString2)}');
}

List<dynamic> reverseList(List<dynamic> list) {
  List<dynamic> stack = [];
  List<dynamic> reversedList = [];

  // Push all elements onto the stack
  for (var item in list) {
    stack.add(item);
  }

  // Pop elements from the stack and add them to the reversedList
  while (stack.isNotEmpty) {
    reversedList.add(stack.removeLast());
  }

  return reversedList;
}

bool isParenthesesBalanced(String input) {
  List<String> stack = [];

  for (var char in input.split('')) {
    if (char == '(') {
      stack.add(char);
    } else if (char == ')') {
      if (stack.isEmpty || stack.last != '(') {
        return false;
      }
      stack.removeLast();
    }
  }

  return stack.isEmpty;
}
