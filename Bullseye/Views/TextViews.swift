//
//  TextViews.swift
//  Bullseye
//
//  Created by joel Alcantara on 21/12/21.
//

import SwiftUI

struct InstructionText: View {
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .kerning(Constants.kerning)
            .bold()
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
    }
    
    enum Constants {
        static let kerning = CGFloat(2)
    }
}

struct BigNumberTextView: View {
    var text: String
    
    var body: some View {
        Text(text).font(.largeTitle)
            .kerning(Constants.kerning)
            .fontWeight(.black)
            .multilineTextAlignment(.center)
    }
    
    enum Constants {
        static let kerning = CGFloat(-1)
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text).foregroundColor(ColorPalette.fontColor)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(Constants.lineSpace)
        
    }
    
    enum Constants {
        static let lineSpace = CGFloat(12)
    }
}

struct ButtonText: View {
    var title: String
    
    var body: some View {
        Text(title).foregroundColor(ColorPalette.inverseFontColor)
            .font(.body).bold()
            .padding().frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(DesignSystem.mediumCornerRadius)
    }
}

struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        let text = "🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO"
        Group {
            InstructionText(text: text).previewLayout(.sizeThatFits)
            BigNumberTextView(text: "49").previewLayout(.sizeThatFits)
            BodyText(text: "You scored 200 Points\n🎉🎉🎉").previewLayout(.sizeThatFits)
            VStack {
                Button(action: {}, label: {
                    ButtonText(title: "Start New Round")
                }).frame(height: 44.0)
            }.padding().previewLayout(.sizeThatFits)
        }
    }
}
