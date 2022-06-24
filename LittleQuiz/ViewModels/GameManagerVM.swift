//
//  GameManagerVM.swift
//  LittleQuiz
//
//  Created by Muhammad Rizqullah Akbar on 23/06/22.
//

import Foundation

class GameManagerVM: ObservableObject {
    static var currentIndex = 0
    
    static func createGameModel(i: Int) -> Quiz {
        return Quiz(questionID: i, quizModel: quizData[i])
    }
    
    @Published var model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
    
    var timer = Timer()
    var maxProgress = 15
    @Published var progress = 0
    
    init() {
        self.start()
    }
    
    func verifyAnswer(selectedOption: QuizOption) {
        for index in model.quizModel.optionList.indices {
            model.quizModel.optionList[index].isMatched = false
            model.quizModel.optionList[index].isSelected = false
        }
        if let index = model.quizModel.optionList.firstIndex(where: {$0.optionId == selectedOption.optionId}) {
            if selectedOption.optionId == model.quizModel.answer {
                model.quizModel.optionList[index].isMatched = true
                model.quizModel.optionList[index].isSelected = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if (GameManagerVM.currentIndex < 2 ) {
                        GameManagerVM.currentIndex += 1
                        self.model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
                    } else {
                        self.model.isCompleted = true
                        self.model.isWining = true
                    }
                }
            } else {
                model.quizModel.optionList[index].isMatched = false
                model.quizModel.optionList[index].isSelected = true
            }
        }
    }
    
    func restartGame() {
        GameManagerVM.currentIndex = 0
        model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
        self.start()
    }
    
    func start() {
        self.reset()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {time in
            if self.progress == self.maxProgress {
                self.model.isCompleted = true
                self.model.isWining = false
                self.reset()
            } else {
                self.progress += 1
            }
        })
    }
    
    func reset() {
        timer.invalidate()
        self.progress = 0
    }
}

extension GameManagerVM
{
    static var quizData: [QuizModel] {
        [
            QuizModel(question: "Siapa Presiden Pertama NKRI?",
                      answer: "A",
                      optionList: [
                        QuizOption(id: 11, optionId: "A", option: "Soekarno", color: .red),
                        QuizOption(id: 12, optionId: "B", option: "Soeharto", color: .yellow),
                        QuizOption(id: 13, optionId: "C", option: "Gusdur", color: .green),
                        QuizOption(id: 14, optionId: "D", option: "Megawati", color: .blue)]),
            
            QuizModel(question: "Kapan Indonesia Merdeka?",
                      answer: "A",
                      optionList: [
                        QuizOption(id: 11, optionId: "A", option: "17 Agustus 1945", color: .red),
                        QuizOption(id: 12, optionId: "B", option: "19 Agustus 1954", color: .yellow),
                        QuizOption(id: 13, optionId: "C", option: "17 Agustus 1954", color: .green),
                        QuizOption(id: 14, optionId: "D", option: "19 Agustus 1945", color: .blue)]),
            
            QuizModel(question: "Dimanakah Ibu Kota Negara Indonesia?",
                      answer: "D",
                      optionList: [
                        QuizOption(id: 11, optionId: "A", option: "Jakarta", color: .red),
                        QuizOption(id: 12, optionId: "B", option: "Yogyakarta", color: .yellow),
                        QuizOption(id: 13, optionId: "C", option: "Surakarta", color: .green),
                        QuizOption(id: 14, optionId: "D", option: "Nusantara", color: .blue)]),
        ]
    }
}
