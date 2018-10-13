# daily-chinese
Development of Daily Chinese app prototype for ChinesePod

This is a partially-developed prototype of an app for ChinesePod.

Please let me know if you experience any issues building the project.

Development environment:
macOS High Sierra 10.13.6;
Xcode 10.0;
Simulator iPhone XR - 12.0 (Portrait).

Dependencies: 
This app uses MultiSelectSegmentedControl which is installed using CocoaPods. You will probably 
need to install CocoalPods (cocoapods.org) if you don't already have it, and then run ‘pod install’ in
the project folder after cloning the git repository. This will create a new workspace called
'daily-chinese.xcworkspace' which should be used to build the project.


Important: because of the limited time I have had to work on these apps, there has not been
time to implement handling for different screen sizes and orientations. It is therefore strongly
recommended that this app is tested with the iPhone XR Simulator in Portrait orientation, as
this was the Simulator used for develepment and testing.

The prototype apps are not complete. I had very little time to develop these prototypes, 
I had two different prototypes to develop, and I was learning how to develop apps from scratch 
as part of this process.


They are intended to give some idea of what the final apps should do, but further work will be required 
to turn these apps into professional products, including adding further functionality, improving the user 
interface and graphical design. The current graphical design is very basic and should not be taken as an 
indication of the graphical design of the final product.

Daily Chinese - Concept

Objective - There is good scientific evidence to suggest that successful language learning is best achieved through 
daily practice and frequent repetition. For long term retention of information, study periods should be 
short enough to avoid information overload. The objective of the Daily Chinese App is to exploit these 
methods and encourage 20-30 minutes of study every day.

Goals - The Daily Chinese App will be designed around the concept of 20-30 minutes of study every day, including
both appealing and engaging spaced repetition exercises leading to long-term retention, and studying of new material. 
The study material will be based on the body of ChinesePod lessons, so the App both adds value to the ChinesePod 
lessons as well as drawing upon them.

The vocabulary can be selected from HSK levels and/or ChinesePod levels. The app is linked to the player's
ChinesePod account and the player can choose all vocabularly from all ChinesePod lessons in chosen levels or
can choose only to include words from the lessons they have marked as studied.

Daily Chinese - Current Status

The current prototype is very basic and lacks the final functionality. The opening view shows some dummy
data for current streak, peronsal best, level and score. The key components of the app are a daily study
session and various game-based practice activities. The main view shows the next exercise, with a 'Play'
button to start the exercise, and the next lesson to be studied with a 'Study' button to launch the
lesson.

Currently the 'Study' button just links to a webview of one of the free ChinesePod lessons, but in the
final app this should integrate the ChinesePod lessons directly into the app as in the current
ChinesePod App.

A couple of basic exercise activities have been implemented. A listening game where the player needs to
select the picture matching the audio dialogue. This should play a dialogue randomly selected from a
ChinesePod lesson, but this is not yet working. A game to decide whether a displayed Chinese sentence is 
grammatically correct is currently just a placeholder view, and does not yet do anything interesting.
Finallly there is a very basic implementation of a translation game which displays a Chinese sentence 
and asks the player to select the correct English translation from a set of supplied words. These three
exercises are presented to the user in tern.


Daily Chinese - Further Developments

1) The prototype only implements basic graphics, so there is work to be done on the graphic design. 

2) The daily sceduling component of the app needs to be implemented, including push notifications.

3) The app should be integrated with ChinesePod lessons.

4) Rewards for reaching targets should be implemented

5) The listening game should be completed to include the audio playback of dialogues

6) The grammar game needs to be implemented

7) The visual appearance of the translation game should be improved and the option of an
English-Chinese translation should be included

8) The range of practice activities should be expanded to include lots of other activities.

9) The app should support all screen sizes and orientations.


