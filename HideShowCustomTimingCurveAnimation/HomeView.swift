//
//  ContentView.swift
//  MyApp
//
//  Created by Evgeniy Safin on 27.09.2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var cartVM = CartViewModel()
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                // send order button
                sendOrderButton
                // show animation
                showAnimation
            }
            .animation(Animation.linear)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
    
    // MARK: Send order button
    @ViewBuilder private var sendOrderButton: some View {
        if !self.cartVM.isLoading && !self.cartVM.showAnimation {
            Button(action: {
                self.cartVM.sendOrder()
            }, label: {
                Text("send order")
                    .font(.headline)
                    .foregroundColor(Color.white)
            })
        }
    }
    
    // MARK: Show animation
    private var showAnimation: some View {
        Group {
            if self.cartVM.isLoading {
                ProgressView()
                    .tint(Color.white)
            } else if self.cartVM.showAnimation {
                if let setOrderStatus = self.cartVM.setOrderStatus {
                    CustomTimingCurveAnimation(mode: setOrderStatus)
                        .animation(Animation.timingCurve(0.34, 1.56, 0.88, 1.2, duration: 1))
                }
            }
        }
    }
}
