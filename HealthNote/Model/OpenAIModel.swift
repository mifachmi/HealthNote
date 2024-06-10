//
//  OpenAIModel.swift
//  HealthNote
//
//  Created by Fachmi Dimas Ardhana on 06/06/24.
//

import Foundation

struct OpenAiResponse: Codable, Identifiable {
    var id, object: String
    var created: Int
    var model: String
    var choices: [Choice]
    var usage: Usage
    var systemFingerprint: String?
    
    enum CodingKeys: String, CodingKey {
        case id, object, created, model, choices, usage
        case systemFingerprint = "system_fingerprint"
    }
}

struct OpenAiRequestBody: Codable {
    var model: String
    var messages: [Message]
}

struct Choice: Codable {
    var index: Int
    var message: Message
    var logprobs: String?
    var finishReason: String
    
    enum CodingKeys: String, CodingKey {
        case index, message, logprobs
        case finishReason = "finish_reason"
    }
}

struct Message: Codable {
    var role, content: String
}

struct Usage: Codable {
    var promptTokens, completionTokens, totalTokens: Int
    
    enum CodingKeys: String, CodingKey {
        case promptTokens = "prompt_tokens"
                case completionTokens = "completion_tokens"
                case totalTokens = "total_tokens"
    }
}

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

enum NetworkError: Error {
    case BadURL
    case NoData
    case DecodingError
}

struct MappedOpenAIModel {
    let content: String
}
