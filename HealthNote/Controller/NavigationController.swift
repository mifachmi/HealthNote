//
//  NavigationController.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 07/06/24.
//

import Foundation

@Observable
class NavigationController {
    var path: [String] = []
    
    func goToNextPage(screen: String) {
        path.append(screen)
    }
    
    func goToFirstScreen() {
        path.removeAll()
    }
}
