# Summary
This extension consists of 1 page extension and 1 codeunit. It demonstrates the use of dictionaries.

# Item page extension
Page Extension has an action that runs codeunit KNH Dictionary which demonstrates a dictionary within a dictionary.

# Dictionary codeunit
Codeunit is called from the action on the page extension. It demonstrates a dictionary within a dictionary. The first dictionary has a key of Item No. and the value is another dictionary. The second dictionary has an integer key and text value which are the item details. The GetDictValues procedure loops through the dictionaries and displays the item details in a message box.
