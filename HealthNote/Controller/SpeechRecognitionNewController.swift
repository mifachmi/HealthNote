//
//  SpeechRecognitionNewController.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 01/06/24.
//

import Foundation
import Speech
import AVFoundation
import SwiftUI

@Observable class SpeechRecognitionNewController: NSObject, AVAudioRecorderDelegate {
    var transcription = ""
    var isRecording = false
    var timeStamp: TimeInterval = 0
    var audioLevels: [Float] = [] // Published variable to hold audio levels for waveform
    
    private var audioRecorder: AVAudioRecorder? // AVAudioRecorder instance for recording audio
    private var audioEngine = AVAudioEngine() // AVAudioEngine instance for handling audio input
    private var speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "id-ID")) // SFSpeechRecognizer instance for speech recognition
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest? // Request object for recognition
    private var recognitionTask: SFSpeechRecognitionTask? // Recognition task object
    
    private var lastTranscription: String = "" // Variable to store the last transcribed string
    private var timer: Timer? // Timer to track the recording duration
    private var startTime: Date? // Start time of the recording
    
    // Method to start both audio recording and live transcribing
    func startRecordingAndTranscribing() {
        startRecording() // Start audio recording
        startTranscribing() // Start live transcribing
        isRecording = true // Update the recording state
        startTimer() // Start the timer
    }
    
    // Method to stop both audio recording and live transcribing
    func stopRecordingAndTranscribing() {
        audioRecorder?.stop() // Stop audio recording
        audioEngine.stop() // Stop the audio engine
        recognitionRequest?.endAudio() // End the recognition request
        recognitionTask?.cancel() // Cancel the recognition task
        isRecording = false // Update the recording state
        stopTimer() // Stop the timer
    }
    
    // Method to start audio recording
    private func startRecording() {
        let audioSession = AVAudioSession.sharedInstance() // Get the shared audio session instance
        
        do {
            // Set the audio session category and activate it
            try audioSession.setCategory(.playAndRecord, mode: .default)
            try audioSession.setActive(true)
            
            // Define the settings for the audio recorder
            let settings = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 12000,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            
            // Define the file path for the recorded audio
            let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
            // Initialize the audio recorder
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder?.delegate = self // Set the delegate
            audioRecorder?.record() // Start recording
            startTime = Date() // Set the start time
            
        } catch {
            print("Failed to set up audio session: \(error.localizedDescription)")
        }
    }
    
    // Helper method to get the document directory path
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    // Method to start live transcribing
    private func startTranscribing() {
        guard let recognizer = speechRecognizer, recognizer.isAvailable else {
            print("Speech recognizer is not available")
            return
        }
        
        // Initialize a new recognition request and start the task
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create recognition request")
        }
        
        let inputNode = audioEngine.inputNode // Get the audio engine input node
        recognitionRequest.shouldReportPartialResults = true // Enable partial results reporting
        //recognitionRequest.requiresOnDeviceRecognition = true
        recognitionRequest.addsPunctuation = true
        
        // Start the recognition task
        recognitionTask = recognizer.recognitionTask(with: recognitionRequest) { result, error in
            if let result = result {
                // Append the new transcription result to the existing transcription
                DispatchQueue.main.async {
                    self.transcription = self.lastTranscription + result.bestTranscription.formattedString
                }
            }
            
            // Handle the end of the recognition task
            if error != nil || result?.isFinal == true {
                self.audioEngine.stop() // Stop the audio engine
                inputNode.removeTap(onBus: 0) // Remove the tap on the audio engine input node
                self.recognitionRequest = nil // Clear the recognition request
                self.recognitionTask = nil // Clear the recognition task
                
                // Save the latest transcription
                self.lastTranscription = self.transcription
                
                // Restart the transcription to handle continuous transcription
                if self.isRecording {
                    self.startTranscribing()
                }
            }
        }
        
        // Set the recording format and install a tap on the input node to get the audio buffers
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, when in
            self.recognitionRequest?.append(buffer) // Append the audio buffer to the recognition request
        }
        
        audioEngine.prepare() // Prepare the audio engine
        
        do {
            try audioEngine.start() // Start the audio engine
        } catch {
            print("Audio engine couldn't start: \(error.localizedDescription)")
        }
    }
    
    // Method to start the timer
    private func startTimer() {
        timeStamp = 0 // Reset the duration
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if let startTime = self.startTime {
                self.timeStamp = Date().timeIntervalSince(startTime) // Update the duration
            }
        }
    }
    
    // Method to stop the timer
    private func stopTimer() {
        timer?.invalidate() // Invalidate the timer
        timer = nil // Clear the timer
    }
    
    // Helper method to format the duration as a string
    func formatDuration(_ duration: TimeInterval) -> String {
        let minutes = Int(duration) / 60
        let seconds = Int(duration) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    // Method to update audio levels for waveform visualization
    private func updateAudioLevels(buffer: AVAudioPCMBuffer) {
        let channelData = buffer.floatChannelData![0]
        let channelDataValueArray = stride(from: 0,
                                           to: Int(buffer.frameLength),
                                           by: buffer.stride).map { channelData[$0] }
        let rms = sqrt(channelDataValueArray.map { $0 * $0 }.reduce(0, +) / Float(buffer.frameLength))
        let avgPower = 20 * log10(rms)
        DispatchQueue.main.async {
            self.audioLevels.append(avgPower)
            if self.audioLevels.count > 50 {
                self.audioLevels.removeFirst()
            }
        }
    }
    
}
