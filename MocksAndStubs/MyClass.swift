import Foundation
import CoreData

class MyClass {
	let context: NSManagedObjectContext
	
	init(managedObjectContext: NSManagedObjectContext) {
		self.context = managedObjectContext
	}
	
	// If the array returned from executing a fetch request contains objects, return true; if empty, return false
	func databaseHasRecordsForSomeEntity() -> Bool {
		let fetchRequest = NSFetchRequest(entityName: "SomeEntity")
		let fetchRequestResults = self.context.executeFetchRequest(fetchRequest, error: nil) // May want to do something with the error in real life...
		return (fetchRequestResults?.count > 0)
	}
}