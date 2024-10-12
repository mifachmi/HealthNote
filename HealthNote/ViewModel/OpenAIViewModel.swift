//
//  OpenAIViewModel.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 06/06/24.
//

import Foundation

@Observable
class OpenAIViewModel {
    enum State {
        case idle
        case loading
        case failed(Error)
        case loaded(MappedOpenAIModel)
    }
    
    var state = State.idle
    var responseApi: String = ""
    var dataMappedOpenAiModel: MappedOpenAIModel?
    var resultSummary: String?
    
    func askToSummarize(prompt: String, modelGPT: String) {
        state = .loading
        
        NetworkService().askSummary(prompt: prompt, modelGPT: modelGPT) { dataResponse in
            switch dataResponse {
            case .success(let response):
                self.state = .loaded(response ?? MappedOpenAIModel(content: ""))
                self.dataMappedOpenAiModel = response
            case .failure(let error):
                self.state = .failed(error)
            }
        }
    }
}
