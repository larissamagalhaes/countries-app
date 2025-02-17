# Countries-app
This project uses Clean Architecture to ensure maintainability, testability, and scalability. By separating concerns into distinct layers, it makes the app easier to maintain, test, and allows for parallel development.

Error handling has been implemented by showing an error view, providing a clear and user-friendly way to display issues. Unit tests have been implemented to demonstrate the approach to testing, ensuring each layer can be tested independently.

In my daily workflow, I focus on keeping the architecture modular and clean to simplify future improvements and debugging.

## Demo
You can find some demo examples related to the challenge in this folder: [Demo](https://github.com/larissamagalhaes/countries-app/tree/3157ab8558a68bdd1afbd77ab3ad5eb0fccdcd47/Demo).

### Application Design
- Networking uses the Repository pattern with local (Cache) and remote (API) data sources.
- Business logic is within Use Cases.
- For the presentation layer, we have MVVM. 
- Use cases is unit tested, as example.

![Blank diagram](https://user-images.githubusercontent.com/17458913/162341903-92e63ff8-978d-464b-926a-76b12dd19387.png)

## Build tools & versions used
XCode Version 16.2 and iOS 18.2

## Steps to run the app
Download the zip and run



