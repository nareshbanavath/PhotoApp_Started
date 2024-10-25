//
//  SignupFormModelValidator.swift
//  PhotoApp_StartedTests
//
//  Created by Naresh Banavath on 07/10/24.
//

import XCTest
@testable import PhotoApp_Started

final class SignupFormModelValidatorTests: XCTestCase {
    var sut: SignupFormModelValidator!
    
    override func setUpWithError() throws {
        sut = SignupFormModelValidator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    //MARK: - FirstName Validations
    
    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        // Arrange
       
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Naresh")
        
        // Assert
        
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should return TRUE but it returned false")
    }
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {

        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "N")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should return False for first name that is shorted than \(SignupConstants.firstNameMinLength) characters but it has returned true")
    }
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {

        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "NareshNaresh")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should return False for first name that is longer than \(SignupConstants.firstNameMaxLength) characters but it has returned true")
    }
    
    //MARK: - LastName Validation
    
    func testSignupFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Banavath")
        // Assert
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should return TRUE but it returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse(){
        
         //Act
        
        let isValidLastName = sut.isLastNameValid(lastName: "B")
        
        // Assert
        
        XCTAssertFalse(isValidLastName, "The isLastNameValid() should return false when character count is less than 2")
    }
    
    func testSignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse(){
        
         //Act
        
        let isValidLastName = sut.isLastNameValid(lastName: "Banavath Banavath")
        
        // Assert
        
        XCTAssertFalse(isValidLastName, "The isLastNameValid() should return false when character count is greater than 10")
    }
    
    //MARK: - Email Validation
    
    func testSignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        
        //Act
        let isValidEmail = sut.isValidEmailFormat(email: "naresh@gmail.com")
        
        //Assert
        
        XCTAssertTrue(isValidEmail, "Not a valid email")
    }
    
    func testSignupFormModelValidator_WhenEmailisInvalid_ShouldReturnFalse() {
        
        //Act
        let isValidEmail = sut.isValidEmailFormat(email: "naresh.com")
        
        XCTAssertFalse(isValidEmail, "isValidEmail() should return false when we give email without symbol")
    }
 

}
