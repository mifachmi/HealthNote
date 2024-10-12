//
//  NetworkServices.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 05/06/24.
//

import Foundation

class NetworkService {
    private let apiKey = ProcessInfo.processInfo.environment["openai_api_key"] ?? ""
    
    func askSummary(prompt: String, modelGPT: String, completion: @escaping (Result<MappedOpenAIModel?, NetworkError>) -> Void) {
        let messagesRequestBody = [Message(role: "user", content: prompt)]
        let requestBody = OpenAiRequestBody(model: modelGPT, messages: messagesRequestBody)
        
        guard let url = URL(string: "https://api.openai.com/v1/chat/completions") else {
            completion(.failure(.BadURL))
            return
        }
        
        let headers = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(self.apiKey)"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        
        do {
            // Encode the request body to JSON
            let jsonData = try JSONEncoder().encode(requestBody)
            request.httpBody = jsonData
        } catch {
            completion(.failure(.DecodingError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data received")
                completion(.failure(.NoData))
                return
            }
            
            do {
                let dataResponse = try JSONDecoder().decode(OpenAiResponse.self, from: data)
                let content = MappedOpenAIModel(content: dataResponse.choices[0].message.content)
                DispatchQueue.main.async {
                    completion(.success(content))
                }
            } catch {
                completion(.failure(.DecodingError))
                print("Failed to decode JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func decodeChatCompletionResponse(from jsonData: Data) {
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(OpenAiResponse.self, from: jsonData)
            print("Response: \(response)")
            
            // Example: Access the content of the message
            if let firstChoice = response.choices.first {
                print("Message Content: \(firstChoice.message.content)")
            }
        } catch {
            print("Failed to decode JSON: \(error.localizedDescription)")
        }
    }
}

