# app_comics

An app for visualizate comics descriptions via API

# Important!!!
Try put your own API KEY of the https://comicvine.gamespot.com/api/
the folder /lib/common/env.dart in the variable keyApi

for run the project add an aditional run arg: --no-sound-null-safety
the command for run the project: flutter run --no-sound-null-safety
or in android studio, go to run menu, and click in "edit configurations", in the item aditional run args, add: --no-sound-null-safety

## Getting Started

This project is allows to users login and visualizate data from comics, like their description and main images

You can show the app in diferentes forms, like a list or like a grid.

## Login

You will sign in and sign up with any email, you just set the password and continue to enjoy of the app.

## Home Page

In the code the Home Page is InitialPage, where you can filter some of the most famous comics in the world, change the view of the grid and decide the order of the comics based in the publish date.

## Detail Page

In this part you can see the avaliable data from the API, like the principal dates from the comic, his name, his volume name, his principal characters and objects, an image from the comic, and some other revelant data.
