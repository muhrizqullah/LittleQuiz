//
//  OptionGrid.swift
//  LittleQuiz
//
//  Created by Muhammad Rizqullah Akbar on 23/06/22.
//

import Foundation
import SwiftUI

struct OptionGridView: View {
    var columns: [GridItem] = Array(repeating: GridItem(.fixed(170), spacing: 0), count: 2)
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(GameManagerVM.quizData[0].optionList) {
                quizOption in OptionCardView(quizOption: quizOption)
            }
        }
    }
}

struct OptionCardView : View {
    var quizOption: QuizOption
    var body: some View {
        VStack {
            if (quizOption.isMatched) && (quizOption.isSelected) {
                OptionStatusImageView(imageName: "checkmark")
            } else if (!(quizOption.isMatched) && (quizOption.isSelected)) {
                OptionStatusImageView(imageName: "xmark")
            } else {
                OptionView(quizOption: quizOption)
            }
        }.frame(width: 150, height: 150)
            .background(setBackgroundColor())
            .cornerRadius(40)
    }
    
    func setBackgroundColor() -> Color {
        if (quizOption.isMatched) && (quizOption.isSelected) {
            return .green
        } else if (!(quizOption.isMatched) && (quizOption.isSelected)) {
            return .red
        } else {
            return .white
        }
    }
}

struct OptionView: View {
    var quizOption: QuizOption
    var body: some View {
        VStack {
            Text(quizOption.optionId)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .frame(width: 50, height: 50)
                .background(quizOption.color.opacity(0.8))
                .foregroundColor(.white)
            
            Text(quizOption.option)
                .frame(width: 150, height: 38)
                .font(.system(size: 20, weight: .bold, design: .rounded))
        }
    }
}

struct OptionStatusImageView: View {
    var imageName: String
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
            .foregroundColor(.white)
    }
}
