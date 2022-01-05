//
//  LabelTextView.swift
//  Bullseye
//
//  Created by joel Alcantara on 25/12/21.
//

import SwiftUI

struct LabelTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.caption)
            .kerning(1.5)
            .bold()
            .foregroundColor(ColorPalette.fontColor)
    }
}

struct BigTitleLabelView: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .font(.title)
            .fontWeight(.black)
            .kerning(2.0)
            .foregroundColor(ColorPalette.fontColor)
    }
}

struct LabelTextView_Previews: PreviewProvider {
    static var previews: some View {
        LabelTextView(text: "Round").previewLayout(.sizeThatFits)
    }
}
