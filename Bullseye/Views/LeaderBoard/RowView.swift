//
//  RowView.swift
//  Bullseye
//
//  Created by joel Alcantara on 30/12/21.
//

import Foundation
import SwiftUI

struct RowView: View {
    var index = 1
    var leaderBoardItem: LeaderboardItem
    
    var body: some View {
        HStack(spacing: 30) {
            RoundedLabelView(text: "\(index)")
            Spacer()
            ThemedTextView(text: leaderBoardItem.playerName)
            ThemedTextView(text: "\(leaderBoardItem.score)")
            ThemedDateTextView(date: leaderBoardItem.date)
                .frame(maxWidth: Constants.dateColumnMaxWidth)
        }.overlay(
            RoundedRectangle(cornerRadius: 100)
                .stroke(
                    ColorPalette.roundedImageStrokeColor,
                    lineWidth: DesignSystem.strokeWidth
                )
        )
    }
    
    enum Constants {
        static let dateColumnMaxWidth: CGFloat = 170.0
        static let scoreColumnMaxWidth: CGFloat = 50.0
    }
}

struct RoundedLabelView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title3)
            .foregroundColor(ColorPalette.fontColor)
            .bold()
            .frame(width: 56, height: 56)
            .overlay(
                Circle()
                    .stroke(lineWidth: DesignSystem.strokeWidth)
                    .fill(ColorPalette.roundedImageStrokeColor)
            )
    }
}

struct ThemedTextView: View {
    var text: String
    
    var body: some View {
        Text(text).font(.title3)
            .kerning(-0.2)
            .bold()
            .multilineTextAlignment(.center)
            .foregroundColor(ColorPalette.fontColor)
    }
}

struct ThemedDateTextView: View {
    var date: Date

    var body: some View {
        Text(date.timeStringAMPM)
            .font(.title3)
            .kerning(-0.2)
            .bold()
            .multilineTextAlignment(.center)
            .foregroundColor(ColorPalette.fontColor)
    }
}


struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(index: 1, leaderBoardItem: LeaderboardItem.list[1])
            .previewLayout(.sizeThatFits)
    }
}
