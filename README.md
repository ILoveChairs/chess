# Simple Chess Backend

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]
[![Powered by Dart Frog](https://img.shields.io/endpoint?url=https://tinyurl.com/dartfrog-badge)](https://dartfrog.vgv.dev)

Made by Matias Davezac

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis


## What do I want with this project?

This project is to be my first portfolio project.

As it aims to be a project to show how I work,
it should contain principled structure and design,
good practices, and plenty of documentation.

## What is the project about?

The project is to provide both the logic of a chess game and a CPU to play
with.

### Requirements

The API should recieve a board, and produce and return a new one with the move
that the CPU chose.

The chess API should be stateless. This means that the API should not remember
previous requests. However, to make the game more fun, the CPU will gather
multiple possible moves and select randomly between them with a fixed bias.

### Technologies

- Dart Frog Restful API Framework with the Dart programming language.

- Globe website for deployment.

### Models

To manage all the data I represent data as objects and include methods unique
to that specific data type.

#### Board

As you might now a chess board is basically 8x8 bidimentional array.
However, I needed to choose whether to have the second array as a
row or column. As traditionally the column is annotated before the row I
decided to have the second array as a column.

Each element of the second array should contain either null or a piece.

The board should expose multiple methods to make the CPU's job easier.

#### PieceTranslator

Traditionally each piece is represented with a letter,
if this letter is lowercase is a black piece and white if it is uppercase.

I can make use of this system to translate our board object to json and
vice versa.

However, with this comes a requirement for a way to translate letters to piece
instances. This could of been done by a function or board method,
however I decided to make it a unique class to have that responsability.

Here is a list with all letter meanings.
- k/K = King
- q/Q = Queen
- r/R = Rook
- n/N = Knight
- b/B = Bishop
- p/P = Pawn

#### Piece

Each piece is initialized with it's position on the board. Furthermore they
should have the method getMoves() that returns a list with all the possible
moves that they can realize without getting out of the board.

#### CPU

The CPU class will have methods to analyse the current board and return another
with it's move.

## Roadmap

Here I will store the roadmap that I will try to follow.
Some parts may be added or updated while in production.

0. ### Initialization

    1. Create README. &check;

    2. Create Dart Frog Project. &check;

1. ### Test driven development

    1. Write unit tests for chess logic.

    2. Write unit tests for chess CPU.

    3. Write unit tests for API.

    4. Write integration tests for the whole application.

2. ### Chess logic 

    1. Create a class that represents a chess board.

    2. Create an interface for pieces and a class for each piece.
    Each piece should have a way to calculate where it can move to.

    3. Implement a function that returns all the possible squares
    a piece can move to based on position and piece type.

    4. Implement a method for the board class that
    checks if at least one peace can move (!=tie).

    5. Implement a method for the board class that
    checks if the king is on check.

    6. Implement a method for the board class that
    checks if the king is on checkmate (win/lose).

    7. More...

3. ### Chess CPU

    1. Create a CPU interface and CPUEasy class.

    2. More...

4. ### API

    1. Expose index to recieve post requests.

    2. Configure middleware like CORS and loggers.

    3. Call and return CPU.compute(table) with 200 as status code.

    4. Handle possible errors with request.

    5. Handle possible errors with logic.

5. ### Deployment to Globe

    1. Deploy to Globe using personal account.

    2. Test that deployment was successful using postman.

6. ### Connection with frontend

    1. Complete the chess frontend in https://matiasdavezac.com.

    2. Connect with the API.

    3. Test using manual testing.
