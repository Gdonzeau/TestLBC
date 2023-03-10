//
//  APIService.swift
//  TestLBC
//
//  Created by Guillaume on 06/03/2023.
//

import Foundation

class ServiceAPI {
    static var shared = ServiceAPI()
    private init() {}
    private var session = URLSession(configuration: .default)
    
    init(session:URLSession) {
        self.session = session
    }
    
    private var task:URLSessionDataTask?
    
    // Preparation to ask request
    func getDataFromAPI(stringAdress: String, infoBack: @escaping (Result<Any,APIErrors>)->Void) {
        // Check that string URL is correct
        guard let url = URL(string: stringAdress) else {
            infoBack(.failure(.invalidURL))
            return
        }
        // Then prepare request
        let request = createAdvertisesRequest(url:url)
        // The request is sent
        task?.cancel()
        task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard error == nil  else {// In case of error...
                    infoBack(.failure(.errorGenerated))
                    return
                }
                guard let dataUnwrapped = data else {// No data
                    infoBack(.failure(.noData))
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {// Check status code
                    infoBack(.failure(.invalidStatusCode))
                    return
                }
                    infoBack(.success(dataUnwrapped))
            }
        }
        task?.resume()
    }
    
    // To prepare request, add POST and different specifications
    func createAdvertisesRequest(url:URL) -> URLRequest {
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        
        return request
    }
    
}
