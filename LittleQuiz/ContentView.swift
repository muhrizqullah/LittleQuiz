//
//  ContentView.swift
//  LittleQuiz
//
//  Created by Muhammad Rizqullah Akbar on 23/06/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameManagerVM: GameManagerVM
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .ignoresSafeArea()
            
            LinearGradient(colors: [.purple.opacity(0.4), .blue.opacity(0.4)],
                           startPoint: .topLeading, endPoint: .bottomLeading).ignoresSafeArea()
            if (gameManagerVM.model.isCompleted) {
                QuizCompletedView(gameManagerVM: gameManagerVM)
            } else {
                VStack {
                    ReusableText(text: "Welcome To The Quiz!", size: 30)
                        .padding()
                    
                    ReusableText(text: gameManagerVM.model.quizModel.question, size: 25)
                        .lineLimit(3)
                        .frame(width: UIScreen.main.bounds.size.width - 20, height: 60, alignment: .center)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 15)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                        
                        Circle()
                            .trim(from: 0.0, to: min(CGFloat(gameManagerVM.progress), 1.0))
                            .stroke(LinearGradient(colors: [.orange, .red],
                                                   startPoint: .topLeading,
                                                   endPoint: .bottomTrailing),
                                    style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                            .rotationEffect(Angle(degrees: 270))
                            .animation(.linear(duration: Double(gameManagerVM.maxProgress)), value: gameManagerVM.progress)
                        
                        ReusableText(text: String(gameManagerVM.progress), size: 30)
                    }.frame(width: 150, height: 150)
                    
                    Spacer()
                    
                    OptionGridView(gameManagerVM: gameManagerVM)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gameManagerVM: GameManagerVM())
    }
}
