# MostPopularNYT

![Simulator Screen Recording - iPhone 15 - 2023-12-04 at 11 01 46](https://github.com/denysastapov/MostPopularNYT/assets/38051100/0c021475-c6ca-4698-8bbf-c766369c90ed)

## Project Overview
NY Times Popular Articles is an iOS application that provides users with a curated list of the most popular articles from The New York Times website. This version emphasizes a programmatic approach for UI design, utilizing custom UICollectionViewCell and UITableViewCell classes for enhanced customization and control.

## Technical Highlights
### Removed Storyboard
The application has transitioned from using storyboards to a programmatic approach for designing the user interface. This change offers greater flexibility and control over the UI elements.

### Custom Cell Classes
Custom cell classes have been implemented for both UICollectionView and UITableView. These classes encapsulate UI elements and subviews, allowing for a tailored and cohesive design in the presentation of popular articles.

### Handling Cell Selection
A dedicated method has been introduced to handle cell selection in the UITableViewController. When a user selects a cell, the application opens an SFSafariViewController to seamlessly view the corresponding web page.

### Maintaining Large Titles
The prefersLargeTitles property of the navigation bar is set to true when navigating back from the SFSafariViewController. This adjustment ensures a consistent and aesthetically pleasing UI, providing a smooth transition between different views.

## Usage
- Open the project in Xcode or your preferred iOS development environment.
- Explore the features and functionalities provided by MostPopularNYT.

## Installation
To run the application locally:

- Clone the repository.
- Open the project in Xcode.
- Build and run the application on a simulator or physical iOS device.

## License

This project is licensed under the MIT License:
Copyright <2023>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
