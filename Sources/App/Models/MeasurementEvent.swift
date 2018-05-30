import FluentSQLite
import Vapor

/// A single entry of a MeasurementEvent list.
final class MeasurementEvent: SQLiteModel {
    /// The unique identifier for this `MeasurementEvent`.
    var id: Int?

    /// A timeStamp for when the measuremnt was recorded.
    var timeStamp: Date?

    /// A temperature measuremnt.
    var temperature: Float

    /// A humidity measuremnt.
    var humidity: Float

    /// Creates a new `MeasurementEvent`.
    init(id: Int? = nil, timeStamp: Date? = nil, temperature: Float, humidity: Float) {
        self.id = id
        if let timeStamp = timeStamp {
          self.timeStamp = timeStamp
        } else {
          self.timeStamp = Date()
        }
        self.temperature = temperature
        self.humidity = humidity
    }
}

/// Allows `MeasurementEvent` to be used as a dynamic migration.
extension MeasurementEvent: Migration { }

/// Allows `MeasurementEvent` to be encoded to and decoded from HTTP messages.
extension MeasurementEvent: Content { }

/// Allows `MeasurementEvent` to be used as a dynamic parameter in route definitions.
extension MeasurementEvent: Parameter { }
