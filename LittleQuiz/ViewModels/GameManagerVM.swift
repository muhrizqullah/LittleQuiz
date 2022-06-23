//
//  GameManagerVM.swift
//  LittleQuiz
//
//  Created by Muhammad Rizqullah Akbar on 23/06/22.
//

import Foundation

class GameManagerVM {
    var data = quizData[0]
}

extension GameManagerVM
{
    static var quizData: [QuizModel] {
        [
            QuizModel(question: "Siapa Presiden Pertama NKRI?",
                      answer: "Soekarno",
                      optionList: [
                        QuizOption(id: 11, optionId: "A", option: "Soekarno", color: .red),
                        QuizOption(id: 12, optionId: "B", option: "Soeharto", color: .yellow),
                        QuizOption(id: 13, optionId: "C", option: "Gusdur", color: .green),
                        QuizOption(id: 14, optionId: "D", option: "Megawati", color: .blue)]),
            
            QuizModel(question: "Kapan Indonesia Merdeka?",
                      answer: "17 Agustus 1945",
                      optionList: [
                        QuizOption(id: 11, optionId: "A", option: "17 Agustus 1945", color: .red),
                        QuizOption(id: 12, optionId: "B", option: "19 Agustus 1954", color: .yellow),
                        QuizOption(id: 13, optionId: "C", option: "17 Agustus 1954", color: .green),
                        QuizOption(id: 14, optionId: "D", option: "19 Agustus 1945", color: .blue)]),
            
            QuizModel(question: "Dimanakah Ibu Kota Negara Indonesia?",
                      answer: "Nusantara",
                      optionList: [
                        QuizOption(id: 11, optionId: "A", option: "Jakarta", color: .red),
                        QuizOption(id: 12, optionId: "B", option: "Yogyakarta", color: .yellow),
                        QuizOption(id: 13, optionId: "C", option: "Surakarta", color: .green),
                        QuizOption(id: 14, optionId: "D", option: "Nusantara", color: .blue)]),
        ]
    }
}
