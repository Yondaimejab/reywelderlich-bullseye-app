//
//  BackgroundView.swift
//  Bullseye
//
//  Created by joel Alcantara on 25/12/21.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(RingsView())
    }
}

struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            ColorPalette.backgroundColor.edgesIgnoringSafeArea(.all)
            let startOpacity = Constants.baseOpacity * (colorScheme == .light ? 0.3 : 0.1)
            ForEach(0..<6) { ring in
                let size = CGFloat(ring * Constants.baseRing)
                let colors: [Color] = [
                    ColorPalette.roundedImageStrokeColor.opacity(startOpacity),
                    ColorPalette.roundedImageStrokeColor.opacity(0.0)
                ]
                Circle()
                    .stroke(lineWidth: Constants.lineWidth)
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: colors),
                            center: .center,
                            startRadius: Constants.startRadius,
                            endRadius: Constants.endRadius
                        )
                    )
                    .frame(width: size, height: size)
            }
        }
    }
    
    enum Constants {
        static let startRadius = CGFloat(100)
        static let endRadius = CGFloat(300)
        static let baseRing = 100
        static let lineWidth = CGFloat(20)
        static let baseOpacity = CGFloat(0.8)
    }
}

struct TopView: View {
    @Binding var game: Game
    @State private var leaderboardShowing = false
    
    var body: some View {
        HStack {
            Button(action: {
                self.game.restartGame()
            }, label: {
                RoundedImageViewStroked(name: "arrow.counterclockwise")
            })
            Spacer()
            Button(action: {
                self.leaderboardShowing.toggle()
            }) {
                RoundedImageViewStroked(name: "list.dash")
            }.sheet(isPresented: self.$leaderboardShowing, content: {
                LeaderBoardView(leaderboardShowing: $leaderboardShowing)
            })
        }
    }
}

struct BoardView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack(spacing: 5.0) {
            LabelTextView(text: title)
            RoundedRectTextView(text: text)
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            BoardView(title: "Score", text: "\(game.score)")
            Spacer()
            BoardView(title: "Round", text: "\(game.round)")
        }
    }
}



struct backgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
