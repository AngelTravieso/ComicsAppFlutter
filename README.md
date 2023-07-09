**Comics App**

This app uses the Comic Vine Gamespot API to fetch comic data. It is built using the BLoC state management pattern and GoRouter, following the principles of clean architecture.

To use the app in debug mode, create a `.env` file with the following environment variables:
1. `BASE_URL`: The base URL for the Comic Vine API provided by Comicvine (https://comicvine.gamespot.com/api).
2. `API_KEY`: Your Comicvine API key. This is necessary to run the app in debug mode. You can refer to the `.env.example` file for guidance.

The app's functionality includes:

- Comic list with animations.
- Loader for displaying the comic image while it loads.
- Ability to switch between grid and list layout modes (with responsive design for the list mode).
- Loaders for each API request.
- Tapping on a comic opens the detail view, showcasing the comic's image, location, characters, and team.

Thank you for your interest in the Comics App!