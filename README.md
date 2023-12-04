# MostPopularNYT

![Simulator Screen Recording - iPhone 15 - 2023-12-04 at 11 01 46](https://github.com/denysastapov/MostPopularNYT/assets/38051100/0c021475-c6ca-4698-8bbf-c766369c90ed)

Working version of the Most popular articles of the New Yourk Times site

Removed the storyboard: The storyboard was removed, and the user transitioned to a programmatic approach for designing the user interface.

Custom UICollectionViewCell and UITableViewCell: Custom cell classes were created for UICollectionView and UITableView, each containing UI elements and subviews.

Handling cell selection: A method was provided for handling cell selection in a UITableViewController, where selecting a cell opens an SFSafariViewController to view a web page.

Maintaining large titles: The prefersLargeTitles property of the navigation bar was set to true when navigating back from the SFSafariViewController using the UINavigationControllerDelegate method.

Сreated a programmatic user interface and control the navigation and presentation of web content within a UINavigationController.

