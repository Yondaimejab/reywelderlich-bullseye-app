//
//  HitMeButtonView.swift
//  Bullseye
//
//  Created by joel Alcantara on 21/12/21.
//

import SwiftUI

struct HitMeButtonView: View {
    var buttonTitle: String = "Hit Me"
    @Binding var indicatorValue: CGFloat
    @Binding var alertVisible: Bool
    
    var body: some View {
        HStack {
            ThemedButton(title: buttonTitle, shouldShowAlert: $alertVisible)
        }
    }
    
    enum Constants {
        static let alertTitle = Text("Hello There!").font(.title)
    }
}

struct ThemedButton: View {
    var title: String
    var cornerRadius: CGFloat = DesignSystem.defaultCornerRadius
    var backgroundColor: Color = ColorPalette.buttonColor
    
    @Binding var shouldShowAlert: Bool
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.shouldShowAlert.toggle()
            }
        }) {
            Text(title.uppercased())
                .foregroundColor(Color.white)
                .bold()
                .font(.title3)
        }.padding()
            .background(
                ZStack {
                    let colors = [Color.white.opacity(0.3), Color.clear]
                    backgroundColor
                    LinearGradient(colors: colors, startPoint: .top, endPoint: .bottom)
                }
            )
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(Color.white, lineWidth: DesignSystem.strokeWidth)
            )
            .shadow(color: .black.opacity(0.5), radius: 5.0)
    }
}

struct HitMeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HitMeButtonView(
            indicatorValue: .constant(50.0),
            alertVisible: .constant(true)
        )
    }
}
