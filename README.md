# izam

A Flutter project For Task Izam Dev Team.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

In these tasks two types of Databases were used and they are ( HIVE , SQFLITE),
SQLFLITE This is to apply the SQL language and also benefit from the features of HIVE.
They are separated when exiting the presentation layer, which is controlled by the Ui and Logic section.

To try both of them, please refer to the comment, lines (19-23) in this path.
lib/src/modules/auth/presentation/bloc/auth_bloc/auth_bloc.dart

- [Lab: Sqflite](https://pub.dev/packages/sqflite)

This is to leave the basic hive for some of its advantages:

## In this case we used Hive as default : 
for reasons that are left to you in the link:
- [Lab: Hive](https://pub.dev/packages/hive)

The user table consists of (The most prominent qualities):

ID: (Key attribute) It is configured automatically and represents the foreign key when using any types of relationships between the database and is drawn in (ERD (Entity Relationship Diagram), EER (Enhanced Entity-relationship diagram)) diagrams.

counter: it expresses a variable element (Dividend attribute).

## using Layered Pattern :
As the name suggests, components(code) in this pattern are separated into layers of subtasks and they are arranged one above another.  

Each layer has unique tasks to do and all the layers are independent of one another. Since each layer is independent, one can modify the code inside a layer without affecting others.  

It is the most commonly used pattern for designing the majority of software. This layer is also known as ‘N-tier architecture’. Basically, this pattern has 4 layers. 

- [Lab: Write Clean architecture](https://betterprogramming.pub/flutter-clean-architecture-test-driven-development-practical-guide-445f388e8604)

Presentation layer (The user interface layer where we see and enter data into an application.)

Business layer (this layer is responsible for executing business logic as per the request.)

Application layer (this layer acts as a medium for communication between the ‘presentation layer’ and ‘data layer’.

Data layer (this layer has a database for managing data.)

## using dependency injection with service Locator : 
This is a simple Service Locator for Dart and Flutter projects with some additional goodies highly inspired by Splat. It can be used instead of InheritedWidget or Provider to access objects e.g. from your UI.
- [Lab: Write get_it ](https://pub.dev/packages/get_it)
- [Lab: Write dependency injection (DI)](https://www.tutorialsteacher.com/ioc/dependency-injection)

using Regex for handling validation : 
- [Lab: Write REG EXP](https://blog.0xba1.xyz/0522/dart-flutter-regexp/)



For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

The code provides comments for improvement to make it more readable.
