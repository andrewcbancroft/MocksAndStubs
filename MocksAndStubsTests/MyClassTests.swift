import UIKit
import XCTest
import CoreData // <-- Make sure to import CoreData or you will get errors when you try to use NSManagedObjectContext

class MyClassTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

	// Yay for verbose test names!  :]
	func testDatabaseHasRecordsForSomeEntityReturnsTrueWhenFetchRequestReturnsNonEmptyArray() {
		class MockNSManagedObjectContext: NSManagedObjectContext {
			override func executeFetchRequest(request: NSFetchRequest, error: NSErrorPointer) -> [AnyObject]? {
				return ["object 1"]
			}
		}
		
		// Instantiate mock
		let mockContext = MockNSManagedObjectContext()
		
		// Instantiate class under test
		let myClassInstance = MyClass(managedObjectContext: mockContext)
		
		// Call the method under test and store its return value for XCTAssert
		let returnValue = myClassInstance.databaseHasRecordsForSomeEntity()
		
		XCTAssertTrue(returnValue == true, "The return value should be been true")
	}
	
	func testDatabaseHasRecordsForSomeEntityReturnsTrueWhenFetchRequestReturnsEMPTYArray() {
		class MockNSManagedObjectContext: NSManagedObjectContext {
			override func executeFetchRequest(request: NSFetchRequest, error: NSErrorPointer) -> [AnyObject]? {
				return [] // Provided a different stub implementation to test the "false" branch of my method under test
			}
		}
		
		// Instantiate mock
		let mockContext = MockNSManagedObjectContext()
		
		// Instantiate class under test
		let myClassInstance = MyClass(managedObjectContext: mockContext)
		
		// Call the method under test and store its return value for XCTAssert
		let returnValue = myClassInstance.databaseHasRecordsForSomeEntity()
		
		XCTAssertTrue(returnValue == false, "The return value should be been false")
	}
}
