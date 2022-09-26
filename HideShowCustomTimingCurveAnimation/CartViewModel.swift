//
//  CartViewModel.swift
//  MyApp
//
//  Created by Evgeniy Safin on 27.09.2022.
//

import Foundation

class CartViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var showAnimation: Bool = false
    @Published var setOrderStatus: ImageStatus? = nil
    
    private func loader() {
        self.isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.isLoading = false
            self.animationLoader()
        }
    }
    
    private func animationLoader() {
        self.showAnimation = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.showAnimation = false
        }
    }
    
    private func getStatus() {
        let randomNumber = Int.random(in: 1...2)
        switch randomNumber {
        case 1:
            self.setOrderStatus = ImageStatus.ok
        default:
            self.setOrderStatus = ImageStatus.none
        }
    }
    
    func sendOrder() {
        self.loader()
        self.getStatus()
    }
}
