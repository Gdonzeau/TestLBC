//
//  TestLBCTests.swift
//  TestLBCTests
//
//  Created by Guillaume on 01/03/2023.
//

import XCTest
@testable import TestLBC

final class TestLBCTests: XCTestCase {
    
    func testGetAdvertisesShouldPostFailedCallbackIfIncorrectUrl() {
        let errorExpected:APIErrors = .invalidURL
        var errorReceived:APIErrors = .noError
        let urlAdress = "Truc muche"
        XCTAssertNotEqual(errorExpected, errorReceived)
        // No URL to configure...
        let serviceAPI = ServiceAPI(
            session: URLSessionFake(data: nil, response: nil, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        serviceAPI.getAdvertises(stringAdress: urlAdress) { result in
            
            switch result {
                    
                case.success( _):
                    XCTFail("Should not have succeeded")
                    
                case.failure(let error):
                    //Then
                    XCTAssertEqual(errorExpected, error)
                    errorReceived = error
            }
            XCTAssertEqual(errorExpected, errorReceived)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.00)
    }
    
    func testGetAdvertisesShouldPostFailedCallbackIfError() {
        let errorExpected:APIErrors = .errorGenerated
        var errorReceived:APIErrors = .noError
        let urlAdress = "http://www.bonneAdresseUrl.com"
        XCTAssertNotEqual(errorExpected, errorReceived)
        let serviceAPI = ServiceAPI(
            session: URLSessionFake(data: FakeResponse.advertiseCorrectData, response: FakeResponse.responseOK, error: FakeResponse.error))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        serviceAPI.getAdvertises(stringAdress: urlAdress) { result in
            
            switch result {
                    
                case.success( _):
                    XCTFail("Should not have succeeded")
                    
                case.failure(let error):
                    // Then
                    XCTAssertEqual(errorExpected, error)
                    errorReceived = error
            }
            XCTAssertEqual(errorExpected, errorReceived)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetAdvertisesShouldPostFailedCallbackIfNoData() {
        let errorExpected:APIErrors = .noData
        var errorReceived:APIErrors = .noError
        let urlAdress = "http://www.bonneAdresseUrl.com"
        XCTAssertNotEqual(errorExpected, errorReceived)
        let serviceAPI = ServiceAPI(
            session: URLSessionFake(data: nil, response: nil, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        serviceAPI.getAdvertises(stringAdress: urlAdress) { result in
            
            switch result {
                    
                case.success( _):
                    XCTFail("Should not have succeeded")
                    
                case.failure(let error):
                    //Then
                    XCTAssertEqual(errorExpected, error)
                    errorReceived = error
            }
            XCTAssertEqual(errorExpected, errorReceived)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetAdvertisesShouldPostFailedCallbackIfIncorrectResponse() {
        let errorExpected:APIErrors = .invalidStatusCode
        var errorReceived:APIErrors = .noError
        let urlAdress = "http://www.bonneAdresseUrl.com"
        XCTAssertNotEqual(errorExpected, errorReceived)
        let serviceAPI = ServiceAPI(
            session: URLSessionFake(data: FakeResponse.advertiseCorrectData, response: FakeResponse.responseKO, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        serviceAPI.getAdvertises(stringAdress: urlAdress) { result in
            
            switch result {
                    
                case.success( _):
                    XCTFail("Should not have succeeded")
                    
                case.failure(let error):
                    //Then
                    XCTAssertEqual(errorExpected, error)
                    errorReceived = error
            }
            XCTAssertEqual(errorExpected, errorReceived)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetAdvertisesShouldPostFailedCallbackIfIncorrectData() {
        let errorExpected:APIErrors = .decodingError
        var errorReceived:APIErrors = .noError
        let urlAdress = "http://www.bonneAdresseUrl.com"
        XCTAssertNotEqual(errorExpected, errorReceived)
        let serviceAPI = ServiceAPI(
            session: URLSessionFake(data: FakeResponse.advertiseIncorrectData, response: FakeResponse.responseOK, error: nil))
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        serviceAPI.getAdvertises(stringAdress: urlAdress) { result in
            
            switch result {
                    
                case.success( _):
                    XCTFail("Should not have succeeded")
                    
                case.failure(let error):
                    //Then
                    XCTAssertEqual(errorExpected, error)
                    errorReceived = error
            }
            XCTAssertEqual(errorExpected, errorReceived)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetAdvertisesShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        //Given
        let adressImageExpected = "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/254308d0083d9293657d938f782c079bfa4a0b3a.jpg"
        var adressImage = "Mauvaise adresse"
        let urlAdress = "http://www.bonneAdresseUrl.com"
        XCTAssertNotEqual(adressImageExpected, adressImage)
        let serviceAPI = ServiceAPI(
            session: URLSessionFake(data: FakeResponse.advertiseCorrectData, response: FakeResponse.responseOK, error: nil))
        
        //When
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        serviceAPI.getAdvertises(stringAdress: urlAdress) { result in
            
            switch result {
                case.success(let data):
                    guard let adressImageUnwrapped = data[0].imagesUrl["small"] else {
                        return
                    }
                    XCTAssertEqual(adressImageExpected, adressImageUnwrapped)
                    adressImage = adressImageUnwrapped
                    
                case.failure(let error):
                    XCTFail("Should not have failed with : \(error)")
            }
            //Then
            XCTAssertEqual(adressImageExpected, adressImage)
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 0.01)
    }
    
}
