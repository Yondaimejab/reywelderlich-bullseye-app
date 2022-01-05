//
//  RoundedRectTextView.swift
//  Bullseye
//
//  Created by joel Alcantara on 25/12/21.
//

import SwiftUI

struct RoundedRectTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title3)
            .kerning(-0.2)
            .foregroundColor(ColorPalette.fontColor)
            .bold()
            .frame(width: 68, height: 56)
            .overlay(
                RoundedRectangle(cornerRadius: DesignSystem.defaultCornerRadius)
                    .strokeBorder(
                        ColorPalette.roundedImageStrokeColor,
                        lineWidth: DesignSystem.strokeWidth
                    )
            )
    }
}

struct RoundedRectTextView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectTextView(text: "999")
            .previewLayout(.sizeThatFits)
    }
}
