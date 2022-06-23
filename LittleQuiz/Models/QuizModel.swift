//
//  QuizModel.swift
//  LittleQuiz
//
//  Created by Muhammad Rizqullah Akbar on 23/06/22.
//

import Foundation
import SwiftUI

struct Quiz {
    var questionID: Int
    var quizModel: QuizModel
    var isCompleted: Bool = false
    var isWining: Bool = false
}

struct QuizModel {
    var question: String
    var answer: String
    var optionList: [QuizOption]
}

struct QuizOption : Identifiable {
    var id: Int
    var optionId: String
    var option: String
    var color: Color
    var isSelected: Bool = false
    var isMatched: Bool = false
}
