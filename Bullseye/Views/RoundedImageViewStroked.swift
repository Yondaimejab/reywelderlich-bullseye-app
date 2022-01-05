//
//  RoundedImageButton.swift
//  Bullseye
//
//  Created by joel Alcantara on 21/12/21.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var name: String = "arrow.counterclockwise"
    
    var body: some View {
        Image(systemName: name)
            .font(.title)
            .foregroundColor(ColorPalette.fontColor)
            .frame(width: 56, height: 56)
            .overlay(
                Circle()
                    .strokeBorder(
                        ColorPalette.roundedImageStrokeColor,
                        lineWidth: DesignSystem.strokeWidth
                    )
            )
    }
}

struct RoundedImageViewFilled: View {
    var name: String = "arrow.counterclockwise"
    var fillColor: Color = ColorPalette.inverseFontColor
    var foregroundColor = ColorPalette.fontColor
    
    var body: some View {
        Image(systemName: name)
            .font(.title)
            .foregroundColor(foregroundColor)
            .frame(width: 56, height: 56)
            .background(
                Circle().fill(fillColor)
            )
    }
}

struct RoundedImageButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImageViewStroked().previewLayout(.sizeThatFits)
        RoundedImageViewFilled().previewLayout(.sizeThatFits).preferredColorScheme(.dark)
    }
}
