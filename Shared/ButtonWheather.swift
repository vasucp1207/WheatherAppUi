//
//  ButtonWheather.swift
//  WheatherApp
//
//  Created by vasu  on 04/09/22.
//

import SwiftUI

struct ButtonWheather: View {
    var title: String
    var background: Color
    var text: Color
    
    var body: some View {
        Text("\(title)")
            .frame(width: 280, height: 60)
            .font(.system(size: 20, weight: .bold, design: .default))
            .background(background)
            .foregroundColor(text)
            .cornerRadius(10)

    }
}
