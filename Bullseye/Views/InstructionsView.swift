//
//  InstructionsView.swift
//  Bullseye
//
//  Created by joel Alcantara on 21/12/21.
//

import SwiftUI

struct InstructionsView: View {
    var text: String
    var numberText: String
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                InstructionText(text: text)
                BigNumberTextView(text: numberText)
            }
        }
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        let text = "🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO"
        InstructionsView(text: text, numberText: "49").previewLayout(.sizeThatFits)
    }
}
