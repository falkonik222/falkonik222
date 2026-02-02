import SwiftUI

struct QuestionView: View {
    let question: Question
    @Binding var selectedAnswer: Int?
    let isAnswered: Bool
    let onSubmit: () -> Void

    var body: some View {
        VStack(spacing: 25) {
            // Difficulty Badge
            HStack {
                Image(systemName: difficultyIcon)
                    .foregroundColor(difficultyColor)
                Text(question.difficulty.rawValue)
                    .font(.caption.bold())
                    .foregroundColor(difficultyColor)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(difficultyColor.opacity(0.2))
            .cornerRadius(20)

            // Question Text
            Text(question.text)
                .font(.title3.bold())
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            // Answer Options
            VStack(spacing: 12) {
                ForEach(0..<question.options.count, id: \.self) { index in
                    AnswerButton(
                        text: question.options[index],
                        isSelected: selectedAnswer == index,
                        isCorrect: index == question.correctAnswer,
                        isAnswered: isAnswered,
                        action: {
                            if !isAnswered {
                                selectedAnswer = index
                            }
                        }
                    )
                }
            }

            // Submit Button
            if selectedAnswer != nil && !isAnswered {
                Button(action: onSubmit) {
                    Text("Submit Answer")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(12)
                }
                .transition(.scale)
            }

            // Explanation (shown after answer)
            if isAnswered {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: selectedAnswer == question.correctAnswer ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundColor(selectedAnswer == question.correctAnswer ? .green : .red)
                            .font(.title2)

                        Text(selectedAnswer == question.correctAnswer ? "Correct!" : "Incorrect")
                            .font(.headline)
                            .foregroundColor(selectedAnswer == question.correctAnswer ? .green : .red)
                    }

                    Text(question.explanation)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .shadow(radius: 10)
        .animation(.spring(), value: isAnswered)
        .animation(.spring(), value: selectedAnswer)
    }

    private var difficultyIcon: String {
        switch question.difficulty {
        case .beginner:
            return "star.fill"
        case .intermediate:
            return "star.leadinghalf.filled"
        case .advanced:
            return "flame.fill"
        }
    }

    private var difficultyColor: Color {
        switch question.difficulty {
        case .beginner:
            return .green
        case .intermediate:
            return .orange
        case .advanced:
            return .red
        }
    }
}

struct AnswerButton: View {
    let text: String
    let isSelected: Bool
    let isCorrect: Bool
    let isAnswered: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
                    .font(.body)
                    .foregroundColor(textColor)
                    .multilineTextAlignment(.leading)

                Spacer()

                if isAnswered && (isSelected || isCorrect) {
                    Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(isCorrect ? .green : .red)
                }
            }
            .padding()
            .background(backgroundColor)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(borderColor, lineWidth: 2)
            )
        }
        .disabled(isAnswered)
    }

    private var backgroundColor: Color {
        if isAnswered {
            if isCorrect {
                return Color.green.opacity(0.2)
            } else if isSelected {
                return Color.red.opacity(0.2)
            }
        } else if isSelected {
            return Color.blue.opacity(0.2)
        }
        return Color(.systemGray6)
    }

    private var borderColor: Color {
        if isAnswered {
            if isCorrect {
                return .green
            } else if isSelected {
                return .red
            }
        } else if isSelected {
            return .blue
        }
        return Color.clear
    }

    private var textColor: Color {
        if isAnswered {
            if isCorrect || isSelected {
                return .primary
            }
        }
        return .primary
    }
}

#Preview {
    QuestionView(
        question: Question.sampleQuestions[0],
        selectedAnswer: .constant(nil),
        isAnswered: false,
        onSubmit: {}
    )
    .padding()
}
