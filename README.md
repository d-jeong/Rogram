# Rogram

## Description
Groundbreaking, state of the art telehealth social media app. Coming in 2022.
Built in SwiftUI, Combine, and Composable Architecture.
Dependencies managed by Swift Package Manager.

## Base Networking

- `NetworkClient`: Responsible for making static URL requests. This class would be expanded to handle all types of HTTP requests (GET, PUT, POST) if required.
- `NetworkService`: Protocol requiring definitions of decodable model and url. Comes with helper methods for the most basic requests. Only one type (list) required for this project.

## Photo Service

- `Photo`: Model of the photo object.
- `PhotoService`: Defines `Photo` as the decodable model and the base url required for network requests. 

## PhotosView Architecture

- `PhotosState`: State object that is used by the view to reactively update.
- `PhotosAction`: Action taken either by the user or as an effect that updates the state accordingly in a pure function manner.
- `PhotosAction.reducer`: Handler for transitioning an initial state to a new state based on the action applied.
- `PhotosEnvironment`: Holder of external dependencies, such as service objects.

