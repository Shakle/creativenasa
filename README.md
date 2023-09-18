# Creative Nasa

Creative Fabrica Mars photos gallery

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)

# FAQ

1. Create .env file in the root of the project
2. Place key-value string inside NASA_API_KEY=your_api_key

Flutter 3.13.4 and Dart 3.1.2 required to run the app.

# Flow overview

Login and fetching are automatic and have 
a delayed endless loop in case of network or other errors.
All or most of the cases are covered and the user is guided with the UI messages.