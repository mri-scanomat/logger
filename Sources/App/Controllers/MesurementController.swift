import Vapor

/// Controls basic CRUD operations on `Measuremnt`s.
final class MeasuremntController {
    /// Returns a list of all `Measuremnt`s.
    func index(_ req: Request) throws -> Future<[MeasurementEvent]> {
        return MeasurementEvent.query(on: req).all()
    }

    /// Saves a decoded `Measuremnt` to the database.
    func create(_ req: Request) throws -> Future<MeasurementEvent> {
        return try req.content.decode(MeasurementEvent.self).flatMap { event in
          event.timeStamp = Date()
            return event.save(on: req)
        }
    }

    /// Deletes a parameterized `Measuremnt`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(MeasurementEvent.self).flatMap { event in
            return event.delete(on: req)
        }.transform(to: .ok)
    }
}
