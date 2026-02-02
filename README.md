# SwiftQuest - Swift Learning Game

An interactive iOS game designed to help you learn Swift programming through fun challenges and quizzes.

## Features

- **Interactive Learning**: Learn Swift concepts through engaging multiple-choice questions
- **Difficulty Levels**: Questions range from Beginner to Advanced
- **Score Tracking**: Earn points based on question difficulty
  - Beginner: 10 points
  - Intermediate: 20 points
  - Advanced: 30 points
- **Immediate Feedback**: Get instant explanations after each answer
- **Beautiful UI**: Modern SwiftUI interface with smooth animations
- **Progress Tracking**: See your performance with detailed results

## Topics Covered

- Constants and Variables (let vs var)
- Optionals and Optional Binding
- Control Flow (guard, defer)
- Closures
- Value Types vs Reference Types (struct vs class)
- Computed Properties
- SwiftUI Property Wrappers (@State)
- Ranges and Collections
- And much more!

## Requirements

- iOS 17.0+
- Xcode 15.0+
- iPhone 17 (or any compatible iOS device)

## Installation

1. Open `SwiftQuest.xcodeproj` in Xcode
2. Select your target device or simulator
3. Press `Cmd + R` to build and run

## How to Play

1. Tap "Start Learning" on the welcome screen
2. Read each question carefully
3. Select your answer from the multiple choices
4. Tap "Submit Answer" to check if you're correct
5. Read the explanation to understand the concept
6. Progress through all questions
7. View your final score and performance level
8. Play again to improve your score!

## Project Structure

```
SwiftQuest/
├── SwiftQuestApp.swift          # App entry point
├── ContentView.swift            # Main game screen
├── Models/
│   ├── Question.swift           # Question data model
│   └── GameViewModel.swift      # Game logic and state
└── Views/
    ├── QuestionView.swift       # Question display component
    └── ResultView.swift         # Results screen
```

## Performance Levels

- **Outstanding!** (90-100%): You're a Swift master!
- **Great Job!** (75-89%): You have solid Swift knowledge
- **Good Effort!** (60-74%): You're making good progress
- **Keep Learning!** (40-59%): Keep practicing
- **Try Again!** (<40%): Review the concepts and try again

## Future Enhancements

- More questions and categories
- Code completion challenges
- Timed mode
- Multiplayer support
- Achievement system
- Custom question sets

## License

This is an educational project created for learning purposes.
