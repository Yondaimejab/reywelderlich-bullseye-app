//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by joel Alcantara on 30/12/21.
//

import SwiftUI

struct LeaderBoardView: View {
    @Binding var leaderboardShowing: Bool
    
    var body: some View {
        ZStack {
            ColorPalette.backgroundColor.edgesIgnoringSafeArea(.all)
            VStack {
                HStack(alignment: .center) {
                    Spacer()
                    BigTitleLabelView(text: "Leaderboard")
                    Spacer()
                    Button(action: {
                        self.leaderboardShowing.toggle()
                    }) {
                        RoundedImageViewFilled(
                            name: "xmark",
                            fillColor: ColorPalette.fontColor,
                            foregroundColor: ColorPalette.inverseFontColor
                        )
                    }
                }
                HStack(alignment: .center, spacing: 30) {
                    Spacer()
                    LabelTextView(text: "Player")
                    LabelTextView(text: "Score")
                    LabelTextView(text: "Rounds")
                        .frame(maxWidth: RowView.Constants.dateColumnMaxWidth)
                }.frame(maxWidth: Constants.rowMaxWidth)
                    .padding(.horizontal)
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(1..<LeaderboardItem.list.count + 1) {
                            RowView(
                                index: $0,
                                leaderBoardItem: LeaderboardItem.list[$0 - 1]
                            ).frame(maxWidth: Constants.rowMaxWidth)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 5)
                }
            }.padding()
        }
    }
    
    enum Constants {
        static let rowMaxWidth: CGFloat = 480.0
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView(leaderboardShowing: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
