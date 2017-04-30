//
//  AKGPushAnimatorDemoUITests.swift
//  AKGPushAnimatorDemoUITests
//
//  Created by AHMET KAZIM GUNAY on 30/04/2017.
//  Copyright © 2017 AHMET KAZIM GUNAY. All rights reserved.
//

import XCTest

class AKGPushAnimatorDemoUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPushViewControllerWithAnimator() {
        // given
        let app = XCUIApplication()
        app.otherElements.containing(.navigationBar, identifier:"First").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .button).element.tap()
        
        let element = app.otherElements.containing(.navigationBar, identifier:"Second").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.swipeRight()
    }
    
}
