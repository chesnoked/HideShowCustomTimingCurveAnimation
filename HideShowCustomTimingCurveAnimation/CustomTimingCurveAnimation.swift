//
//  CustomTimingCurveAnimation.swift
//  MyApp
//
//  Created by Evgeniy Safin on 27.09.2022.
//

import SwiftUI

enum ImageStatus: String {
    case ok = "hand.thumbsup.fill"
    case none = "hand.thumbsdown.fill"
}

struct CustomTimingCurveAnimation: View {
    @State private var onAppearAnimationTrigger: Bool = false
    private let animation = Animation.linear
    let mode: ImageStatus
    var body: some View {
        Image(systemName: self.mode.rawValue)
            .foregroundColor(Color.pink)
            .saturation(1)
            .frame(width: 50, height: 50)
            .scaleEffect(self.onAppearAnimationTrigger ? 2.2 : 1)
            .onAppear {
                withAnimation(self.animation) {
                    self.onAppearAnimationTrigger.toggle()
                }
            }
    }
}
