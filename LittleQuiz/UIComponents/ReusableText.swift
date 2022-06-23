//
//  ReusableText.swift
//  LittleQuiz
//
//  Created by Muhammad Rizqullah Akbar on 23/06/22.
//

import Foundation
import SwiftUI

struct ReusableText: View {
    var text: String
    var size: Int
    var body: some View {
        Text(text)
            .font(.system(size: CGFloat(size), weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .shadow(color: .gray, radius: 2, x: 0, y: 3)
    }
}
