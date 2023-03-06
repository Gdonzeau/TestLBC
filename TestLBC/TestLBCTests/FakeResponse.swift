//
//  FakeResponse.swift
//  TestLBCTests
//
//  Created by Guillaume on 06/03/2023.
//

import Foundation

class FakeResponse {
    static var advertiseCorrectData: Data {
        let bundle = Bundle(for: FakeResponse.self)
        let url = bundle.url(forResource: "Advertise", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        return data
    }
    
    static let advertiseIncorrectData = "erreur".data(using: .utf8)!
    
    // MARK: - Response
    
    static let responseOK = HTTPURLResponse(
        url: URL(string: "https://www.gdtr.fr")!,
        statusCode: 200,
        httpVersion: nil,
        headerFields: [:])!
    
    static let responseKO = HTTPURLResponse(
        url: URL(string: "https://www.gdtr.fr")!,
        statusCode: 500,
        httpVersion: nil,
        headerFields: [:])!
    
    // MARK: - Error
    
    class AdvertiseError: Error {}
    static let error = AdvertiseError()
    
}
