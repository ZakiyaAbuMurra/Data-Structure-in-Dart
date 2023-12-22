void main() {
  // Creating a sample linked list: 1 -> 2 -> 3 -> 4 -> 5
  var startNode = LinkedListNode(1, LinkedListNode(2, LinkedListNode(3, LinkedListNode(4, LinkedListNode(5)))));

  // Challenge 1: Print in Reverse
  print("List Printed in Reverse:");
  printLinkedListInReverse(startNode);
  print('');

  // Challenge 2: Find the Middle Node
  var middleNode = findMiddleOfLinkedList(startNode);
  print("Middle Node Value: ${middleNode?.value}");
  print('');

  // Challenge 3: Reverse a Linked List
  var reversedListHead = reverseLinkedList(startNode);
  print("Reversed Linked List:");
  printLinkedList(reversedListHead);
  print('');

  // Variable for the value to remove
  var valueToRemove = 6;

  // Challenge 4: Remove All Occurrences of the specified value
  var listAfterRemoval = removeAllOccurrencesOfValue(reversedListHead, valueToRemove);
  print("List after Removing All Occurrences of '$valueToRemove':");
  printLinkedList(listAfterRemoval);
}


class LinkedListNode<T> {
  T value;
  LinkedListNode<T>? nextNode;

  LinkedListNode(this.value, [this.nextNode]);
}

// Challenge 1: Print in Reverse
void printLinkedListInReverse<T>(LinkedListNode<T>? currentNode) {
  if (currentNode == null) return;
  printLinkedListInReverse(currentNode.nextNode);
  print(currentNode.value);
}

// Challenge 2: Find the Middle Node
LinkedListNode<T>? findMiddleOfLinkedList<T>(LinkedListNode<T>? headNode) {
  var slowPointer = headNode;
  var fastPointer = headNode;

  while (fastPointer?.nextNode != null && fastPointer?.nextNode?.nextNode != null) {
    slowPointer = slowPointer?.nextNode;
    fastPointer = fastPointer?.nextNode?.nextNode;
  }

  return slowPointer;
}

// Challenge 3: Reverse a Linked List
LinkedListNode<T>? reverseLinkedList<T>(LinkedListNode<T>? headNode) {
  LinkedListNode<T>? previousNode = null;
  LinkedListNode<T>? currentNode = headNode;

  while (currentNode != null) {
    var nextNode = currentNode.nextNode;
    currentNode.nextNode = previousNode;
    previousNode = currentNode;
    currentNode = nextNode;
  }

  return previousNode;
}

// Challenge 4: Remove All Occurrences
LinkedListNode<T>? removeAllOccurrencesOfValue<T>(LinkedListNode<T>? headNode, T targetValue) {
  while (headNode != null && headNode.value == targetValue) {
    headNode = headNode.nextNode;
  }

  LinkedListNode<T>? currentNode = headNode;
  while (currentNode != null) {
    while (currentNode.nextNode != null && currentNode.nextNode!.value == targetValue) {
      currentNode.nextNode = currentNode.nextNode?.nextNode;
    }
    currentNode = currentNode.nextNode;
  }

  return headNode;
}

// Function to print the elements of a linked list
void printLinkedList<T>(LinkedListNode<T>? currentNode) {
  while (currentNode != null) {
    print(currentNode.value);
    currentNode = currentNode.nextNode;
  }
}


