import Foundation

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let options: [String]
    let correctAnswer: Int
    let explanation: String
    let difficulty: Difficulty

    enum Difficulty: String {
        case beginner = "Beginner"
        case intermediate = "Intermediate"
        case advanced = "Advanced"
    }
}

extension Question {
    static let sampleQuestions = [
        Question(
            text: "What keyword is used to declare a constant in Swift?",
            options: ["var", "let", "const", "final"],
            correctAnswer: 1,
            explanation: "'let' is used to declare constants in Swift. Once set, their values cannot be changed.",
            difficulty: .beginner
        ),
        Question(
            text: "Which of these is the correct way to create an optional String?",
            options: ["String?", "Optional<String>", "String!", "Both A and B"],
            correctAnswer: 3,
            explanation: "Both 'String?' and 'Optional<String>' are correct. String? is syntactic sugar for Optional<String>.",
            difficulty: .beginner
        ),
        Question(
            text: "What does the 'guard' statement do?",
            options: [
                "It creates a loop",
                "It exits early if a condition is not met",
                "It defines a function",
                "It declares a variable"
            ],
            correctAnswer: 1,
            explanation: "'guard' provides an early exit from a function if conditions are not met, improving code readability.",
            difficulty: .intermediate
        ),
        Question(
            text: "What is the output of: print(5...10).count?",
            options: ["5", "6", "10", "Error"],
            correctAnswer: 1,
            explanation: "The range 5...10 is a ClosedRange that includes both 5 and 10, containing 6 elements total.",
            difficulty: .intermediate
        ),
        Question(
            text: "What is a closure in Swift?",
            options: [
                "A type of loop",
                "A self-contained block of functionality",
                "A class method",
                "A data structure"
            ],
            correctAnswer: 1,
            explanation: "Closures are self-contained blocks of functionality that can be passed around and used in your code.",
            difficulty: .intermediate
        ),
        Question(
            text: "Which keyword makes a property computed in Swift?",
            options: ["get/set", "compute", "dynamic", "lazy"],
            correctAnswer: 0,
            explanation: "Computed properties use 'get' and optionally 'set' to calculate their value rather than storing it.",
            difficulty: .intermediate
        ),
        Question(
            text: "What is the difference between 'struct' and 'class' in Swift?",
            options: [
                "No difference",
                "Structs are value types, classes are reference types",
                "Classes are faster",
                "Structs cannot have methods"
            ],
            correctAnswer: 1,
            explanation: "Structs are value types (copied when assigned), while classes are reference types (shared when assigned).",
            difficulty: .beginner
        ),
        Question(
            text: "What does the '@State' property wrapper do in SwiftUI?",
            options: [
                "Makes a property global",
                "Creates a two-way binding",
                "Manages view state locally",
                "Defines a constant"
            ],
            correctAnswer: 2,
            explanation: "@State creates a source of truth for data that is owned and managed by the view.",
            difficulty: .intermediate
        ),
        Question(
            text: "What is 'nil' in Swift?",
            options: [
                "A zero value",
                "An empty string",
                "The absence of a value",
                "A false boolean"
            ],
            correctAnswer: 2,
            explanation: "'nil' represents the absence of a value in Swift and can only be used with optionals.",
            difficulty: .beginner
        ),
        Question(
            text: "What does 'mutating' keyword mean in a struct method?",
            options: [
                "The method is private",
                "The method can modify properties of the struct",
                "The method is asynchronous",
                "The method returns a value"
            ],
            correctAnswer: 1,
            explanation: "'mutating' allows a method in a value type (struct/enum) to modify its properties.",
            difficulty: .intermediate
        ),
        Question(
            text: "What is the correct syntax for a simple function in Swift?",
            options: [
                "function myFunc() {}",
                "def myFunc() {}",
                "func myFunc() {}",
                "fn myFunc() {}"
            ],
            correctAnswer: 2,
            explanation: "Swift uses 'func' keyword to define functions.",
            difficulty: .beginner
        ),
        Question(
            text: "What does the 'defer' statement do?",
            options: [
                "Delays execution by a time interval",
                "Executes code just before leaving the current scope",
                "Creates a background thread",
                "Cancels an operation"
            ],
            correctAnswer: 1,
            explanation: "'defer' schedules code to run just before exiting the current scope, useful for cleanup.",
            difficulty: .advanced
        )
    ]
}
