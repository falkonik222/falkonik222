import SwiftUI

struct ResultView: View {
    let score: Int
    let totalQuestions: Int
    let onRestart: () -> Void

    private var percentage: Double {
        Double(score) / Double(totalQuestions * 20) * 100
    }

    private var performanceLevel: String {
        switch percentage {
        case 90...100:
            return "Outstanding!"
        case 75..<90:
            return "Great Job!"
        case 60..<75:
            return "Good Effort!"
        case 40..<60:
            return "Keep Learning!"
        default:
            return "Try Again!"
        }
    }

    private var performanceIcon: String {
        switch percentage {
        case 90...100:
            return "star.fill"
        case 75..<90:
            return "hand.thumbsup.fill"
        case 60..<75:
            return "face.smiling"
        case 40..<60:
            return "book.fill"
        default:
            return "arrow.clockwise"
        }
    }

    private var performanceColor: Color {
        switch percentage {
        case 90...100:
            return .yellow
        case 75..<90:
            return .green
        case 60..<75:
            return .blue
        case 40..<60:
            return .orange
        default:
            return .red
        }
    }

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [performanceColor.opacity(0.6), performanceColor.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 30) {
                Spacer()

                // Icon
                Image(systemName: performanceIcon)
                    .font(.system(size: 80))
                    .foregroundColor(.white)
                    .padding()
                    .background(Circle().fill(performanceColor))
                    .shadow(radius: 10)

                // Performance Text
                Text(performanceLevel)
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(.white)

                // Score Card
                VStack(spacing: 15) {
                    Text("Your Score")
                        .font(.headline)
                        .foregroundColor(.secondary)

                    Text("\(score)")
                        .font(.system(size: 64, weight: .bold, design: .rounded))
                        .foregroundColor(.primary)

                    Text("out of \(totalQuestions * 20) points")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    // Progress Bar
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(height: 10)
                                .cornerRadius(5)

                            Rectangle()
                                .fill(performanceColor)
                                .frame(width: geometry.size.width * percentage / 100, height: 10)
                                .cornerRadius(5)
                        }
                    }
                    .frame(height: 10)
                    .padding(.horizontal)

                    Text("\(Int(percentage))%")
                        .font(.title2.bold())
                        .foregroundColor(performanceColor)
                }
                .padding(30)
                .background(Color(.systemBackground))
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding(.horizontal)

                Spacer()

                // Restart Button
                Button(action: onRestart) {
                    HStack {
                        Image(systemName: "arrow.clockwise")
                        Text("Play Again")
                    }
                    .font(.title2.bold())
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 15)
                    .background(performanceColor)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                }

                Spacer()
            }
        }
    }
}

#Preview {
    ResultView(score: 140, totalQuestions: 12, onRestart: {})
}
