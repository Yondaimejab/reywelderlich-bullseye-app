//
//  PointsView.swift
//  Bullseye
//
//  Created by joel Alcantara on 28/12/21.
//

import SwiftUI

struct PointsView: View {
    var title: String
    var number: Int
    var bodyText: String
    var buttonTitle: String
    var action: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            InstructionText(text: title)
            BigNumberTextView(text: "\(number)")
            BodyText(text: bodyText)
            Button(action: action, label: {
                ButtonText(title: buttonTitle)
            })
        }.padding()
        .frame(maxWidth: 300)
        .background(ColorPalette.backgroundColor)
        .cornerRadius(DesignSystem.defaultCornerRadius)
        .shadow(color: ColorPalette.fontColor, radius: 10)
        .foregroundColor(ColorPalette.fontColor)
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView(
            title: "The Slider Value is",
            number: 89,
            bodyText: "You Scored 79 points\n🎉🎉🎉",
            buttonTitle: "Start New Round",
            action: {}
        ).previewLayout(.sizeThatFits)
    }
}
