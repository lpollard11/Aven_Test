# Aven_Test
This app is a small demo for the purpose of demonstrating my understanding of iOS Development best practices. Here is an overview of how the code is structured.

## Installation
Please run the project on Xcode 12.4.

## MVVM Architecture
The app uses an MVVM architecture. View Models are responsible for loading data from Services and returning the current state of the view. View Controllers are repsonsible for drawing the view according to the state returned by the ViewModel.

## Services
Each feature has its own Service to make API calls.

## Dependency Injection
The app uses Dependency Injection to avoid tight coupling. All dependencies are defined as protocols, allowing mock implementations to be injected for the purpose of unit testing. The dependency injection is handled by the ViewControllerFactory, which creates the MVVM stacks and returns the UI components.

## Notes/ Possible Improvements
-I chose to focus mainly on the architecture of the app. I believe my architectural choices best represent my areas of expertise. I'm focused on ensuring all or most of the code is testable.
-A trade-off I made was not to focus too heavily on the UX/UI of the app. I wanted to devote more time to the overall architecutre of the project.
-An improvement would be to add unit tests to cover the logic in the view models, services, and NetworkingRequester. 
