//
//  HapticFeedbackManager.swift
//  Heirloom
//
//  Created by Tyler Brodsky on 9/13/24.
//

import UIKit

final class FeedbackGeneratorManager {
    static let shared = FeedbackGeneratorManager()
    
    private let feedbackGenerator = UINotificationFeedbackGenerator()
    
    private init() {
        feedbackGenerator.prepare()
    }
    
    func generateSuccessFeedback() {
        feedbackGenerator.notificationOccurred(.success)
    }
    
    func generateErrorFeedback() {
        feedbackGenerator.notificationOccurred(.error)
    }
    
    func generateWarningFeedback() {
        feedbackGenerator.notificationOccurred(.warning)
    }
}

final class HapticFeedbackManager {
    static let shared = HapticFeedbackManager()
    
    private init() {}
    
    func triggerImpactFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
    }
}
