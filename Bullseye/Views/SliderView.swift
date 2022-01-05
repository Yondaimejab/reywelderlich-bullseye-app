//
//  SliderView.swift
//  Bullseye
//
//  Created by joel Alcantara on 21/12/21.
//

import Foundation
import SwiftUI

struct SliderView: View {
    @Binding var indicatorValue: CGFloat
    let range: ClosedRange<CGFloat> = 1.0...100.0
    
    var body: some View {
        HStack {
            SliderLabelText(text: "\(Int(range.lowerBound))")
            Slider(value: $indicatorValue, in: range)
            SliderLabelText(text: "\(Int(range.upperBound))")
        }
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .bold()
            .frame(width: 35.0)
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(indicatorValue: .constant(50.0))
            .previewLayout(.sizeThatFits)
    }
}
