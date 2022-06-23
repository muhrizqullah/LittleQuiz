//
//  ContentView.swift
//  LittleQuiz
//
//  Created by Muhammad Rizqullah Akbar on 23/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .ignoresSafeArea()
            
            LinearGradient(colors: [.purple.opacity(0.4), .blue.opacity(0.4)],
                           startPoint: .topLeading, endPoint: .bottomLeading) .ignoresSafeArea()
            
            VStack {
                ReusableText(text: "Welcome To The Quiz!", size: 30)
                    .padding()
                
                ReusableText(text: GameManagerVM().data.question, size: 25)
                    .lineLimit(3)
                    .frame(width: UIScreen.main.bounds.size.width - 20, height: 60, alignment: .center)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                OptionGridView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
