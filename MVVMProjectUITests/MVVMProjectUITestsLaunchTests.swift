//
//  MVVMProjectUITestsLaunchTests.swift
//  MVVMProjectUITests
//
//  Created by Софія Ярошович on 13.02.2026.
//  Copyright © 2026 MVVMProject. All rights reserved.
//

import XCTest

final class MVVMProjectUITestsLaunchTests: XCTestCase {

    override static var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
