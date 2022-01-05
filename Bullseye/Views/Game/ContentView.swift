//
//  ContentView.swift
//  Bullseye
//
//  Created by joel Alcantara on 16/12/21.
//

import SwiftUI

struct ContentView: View {
    @State private var alertVisible = false
    @State private var game: Game = Game()
    @State private var sliderValue: CGFloat = 0.0 {
        didSet {
            if sliderValue > 100.0 { sliderValue = 100.0 } else if sliderValue < 100.0 { sliderValue = 0 }
        }
    }
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack(alignment: .center) {
                // Top Stack
                InstructionsView(
                    text: Constants.instructions,
                    numberText: "\(game.target)"
                ).padding(.bottom, alertVisible ? 0 : 100)
                // Bottom Stack
                if !alertVisible {
                    HitMeButtonView(
                        indicatorValue: $sliderValue,
                        alertVisible: $alertVisible
                    ).transition(.scale)
                } else {
                    let selection = Int(sliderValue.rounded())
                    let points = game.points(selection: selection)
                    PointsView(
                        title: "The slider value is:",
                        number: selection,
                        bodyText: "You scored \(points)\n 🎉🎉🎉",
                        buttonTitle: "Start New Round",
                        action: {
                            self.game.startNewRound(points: points)
                            withAnimation {
                                self.alertVisible.toggle()
                            }
                        }
                    ).transition(.scale)
                }
            }.foregroundColor(ColorPalette.fontColor)
            if !alertVisible {
                SliderView(indicatorValue: $sliderValue).transition(.scale)
            }
        }
    }
    
    enum Constants {
        static let instructions = "🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO"
        static let alertTitle = Text("Hello There!").font(.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewInterfaceOrientation(.portrait)
    }
}
