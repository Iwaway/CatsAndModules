import XCTest

final class CatsAndModulesScreenshotTests: XCTestCase {
    func testTakeScreenshots() throws {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        
//        let fullScreen = app.otherElements["CatDetailView"]

        snapshot("MainScreen")
        app.tap()
//        fullScreen.tap()
        sleep(1)
        snapshot("DetailsScreen")
    }
}


