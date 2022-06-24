//
//  QuizCompletedView.swift
//  LittleQuiz
//
//  Created by Muhammad Rizqullah Akbar on 24/06/22.
//

import Foundation
import SwiftUI

struct QuizCompletedView: View {
    var gameManagerVM: GameManagerVM
    var body: some View {
        VStack {
            Image(systemName: "gamecontroller.fill")
                .foregroundColor(.yellow)
                .font(.system(size: 60))
                .padding()
            
            ReusableText(text: gameManagerVM.model.isWining ?
                         "That's a Wrap!" :
                            "Game Over!",
                         size: 30)
                .padding()
            
            ReusableText(text: gameManagerVM.model.isWining ?
                         "Thank You for Playing!" :
                            "You Noob!",
                         size: 30)
                .padding()
            
            Button {
                gameManagerVM.restartGame()
            } label: {
                HStack{
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .padding()
                    
                    Text("Play Again!")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                }
            }.frame(width: 300, height: 60, alignment: .center)
                .background(.purple.opacity(0.7))
                .cornerRadius(30)
                .padding()
        }
    }
}
