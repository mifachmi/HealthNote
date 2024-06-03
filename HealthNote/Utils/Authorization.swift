//
//  Authorization.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 30/05/24.
//

import Speech
import UIKit

extension RecordButtonView {
    func requestSpeechRecognitionAuthorization(completion: @escaping (Bool) -> Void) {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            DispatchQueue.main.async {
                switch authStatus {
                case .authorized:
                    completion(true)
                case .denied, .restricted, .notDetermined:
                    completion(false)
                @unknown default:
                    completion(false)
                }
            }
        }
    }
}

func showSettingsAlert() {
    guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
        return
    }
    
    if UIApplication.shared.canOpenURL(settingsUrl) {
        UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
    }
}
