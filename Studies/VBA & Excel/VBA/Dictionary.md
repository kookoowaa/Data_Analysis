## A Quick Guide to the VBA Dictionary

| Function                                                     | Params                                                       |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| Early binding reference                                      | “Microsoft Scripting Runtime” (Add using Tools->References from the VB menu) |
| Declare (early binding)                                      | **Dim** dict **As** Scripting.Dictionary                     |
| Create(early binding)                                        | **Set** dict = **New** Scripting.Dictionary                  |
| Declare (late binding)                                       | **Dim** dict **As Object**                                   |
| Create(late binding)                                         | **Set** dict = CreateObject(**"Scripting.Dictionary"**)      |
| Add item (key must not already exist)                        | dict.Add Key, Value e.g. dict.Add **"Apples"**, 50           |
| Change value at key. Automatically adds if the key does not exist. | dict(Key) = Value e.g. dict(**"Oranges"**) = 60              |
| Get a value from the dictionary using the key                | Value = dict(Key) e.g. appleCount = dict(**"Apples"**)       |
| Check if key exists                                          | dict.Exists(Key) e.g. **If** dict.Exists(**"Apples"**) **Then** |
| Remove item                                                  | dict.Remove Key e.g. dict.Remove **"Apples"**                |
| Remove all items                                             | dict.RemoveAll                                               |
| Go through all items (for each loop)                         | **Dim key As Variant** **For Each key In dict.Keys**   **Debug.Print key, dict(key)** **Next key** |
| Go through all items (for loop - early binding only)         | **Dim i As Long** **For i = 0 To dict.Count - 1**   **Debug.Print dict.Keys(i),    dict.Items(i)** **Next i** |
| Go through all items (for loop - early and late binding)     | **Dim** i **As** **Long** **For** i = 0 **To** dict.Count - 1 **Debug.Print** dict.Keys()(i), dict.Items()(i) **Next** i |
| Get the number of items                                      | dict.Count                                                   |
| Make key case sensitive (the dictionary must be empty).      | dict.CompareMode = vbBinaryCompare                           |
| Make key non case sensitive (the dictionary must be empty).  | dict.CompareMode = vbTextCompare                             |

 

https://excelmacromastery.com/vba-dictionary/

