//
//  HapticFeedbackManager.swift
//  Heirloom
//
//  Created by Tyler Brodsky on 9/13/24.
//

import UIKit

final class HapticFeedbackManager {
    static let shared = HapticFeedbackManager()
    
    private init() {}
    
    func triggerImpactFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
    }
}
