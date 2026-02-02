import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GameViewModel()
    @State private var showingResults = false

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.purple.opacity(0.6), Color.blue.opacity(0.8)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 20) {
                    if !viewModel.isGameStarted {
                        // Welcome Screen
                        VStack(spacing: 30) {
                            Image(systemName: "swift")
                                .font(.system(size: 100))
                                .foregroundColor(.white)

                            Text("SwiftQuest")
                                .font(.system(size: 48, weight: .bold, design: .rounded))
                                .foregroundColor(.white)

                            Text("Learn Swift Through Fun Challenges!")
                                .font(.title3)
                                .foregroundColor(.white.opacity(0.9))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)

                            Button(action: {
                                viewModel.startGame()
                            }) {
                                HStack {
                                    Image(systemName: "play.fill")
                                    Text("Start Learning")
                                }
                                .font(.title2.bold())
                                .foregroundColor(.purple)
                                .padding(.horizontal, 40)
                                .padding(.vertical, 15)
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(radius: 10)
                            }
                            .padding(.top, 30)
                        }
                    } else if !showingResults {
                        // Game Screen
                        VStack(spacing: 20) {
                            // Header with score and progress
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Score: \(viewModel.score)")
                                        .font(.headline)
                                    Text("Question \(viewModel.currentQuestionIndex + 1)/\(viewModel.questions.count)")
                                        .font(.subheadline)
                                }
                                .foregroundColor(.white)

                                Spacer()

                                Button(action: {
                                    viewModel.resetGame()
                                }) {
                                    Image(systemName: "arrow.clockwise")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                }
                            }
                            .padding()
                            .background(Color.white.opacity(0.2))
                            .cornerRadius(15)

                            // Question Card
                            QuestionView(
                                question: viewModel.currentQuestion,
                                selectedAnswer: $viewModel.selectedAnswer,
                                isAnswered: viewModel.isAnswered,
                                onSubmit: {
                                    viewModel.checkAnswer()

                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        if viewModel.moveToNextQuestion() {
                                            showingResults = true
                                        }
                                    }
                                }
                            )
                        }
                        .padding()
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $showingResults) {
            ResultView(
                score: viewModel.score,
                totalQuestions: viewModel.questions.count,
                onRestart: {
                    showingResults = false
                    viewModel.resetGame()
                }
            )
        }
    }
}

#Preview {
    ContentView()
}
