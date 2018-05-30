import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { _ in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)

    let measuremntController = MeasuremntController()
    router.get("event", use: measuremntController.index)
    router.post("event", use: measuremntController.create)
    router.delete("event", MeasurementEvent.parameter, use: measuremntController.delete)
}
