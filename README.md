# MostPopularNYT

![Simulator Screen Recording - iPhone 15 - 2023-12-04 at 11 01 46](https://github.com/denysastapov/MostPopularNYT/assets/38051100/0c021475-c6ca-4698-8bbf-c766369c90ed)

Working version of the Most popular articles of the New Yourk Times site

Removed the storyboard: The storyboard was removed, and the user transitioned to a programmatic approach for designing the user interface.

Custom UICollectionViewCell and UITableViewCell: Custom cell classes were created for UICollectionView and UITableView, each containing UI elements and subviews.

Handling cell selection: A method was provided for handling cell selection in a UITableViewController, where selecting a cell opens an SFSafariViewController to view a web page.

Maintaining large titles: The prefersLargeTitles property of the navigation bar was set to true when navigating back from the SFSafariViewController using the UINavigationControllerDelegate method.

Сreated a programmatic user interface and control the navigation and presentation of web content within a UINavigationController.

## License

This project is licensed under the MIT License:
Copyright <2023><DENYS ASTAPOV>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
