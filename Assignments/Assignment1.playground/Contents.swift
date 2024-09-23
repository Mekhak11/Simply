import Cocoa
import Foundation

struct SimpleDate {
    var year: Int
    var month: Int
    var day: Int
    var time: Time
    
    func getTimeWith(_ format: Format) -> String {
        switch format {
        case .dateOnly:
            return "\(month.formatize())/\(day.formatize())/\(year)"
        case .short:
            return "\(month.formatize())/\((year % 100).formatize())"
        case .standartFull:
            return "\(month.formatize())/\(day.formatize())/\(year) \(time.getTimeWith(.standard))"
        case .amPmFull:
            return "\(month.formatize())/\(day.formatize())/\(year) \(time.getTimeWith(.amPm))"
        }
    }
}

struct Time {
    var hour: Int
    var minute: Int
    
    func getTimeWith(_ sector: TimeSector) -> String {
        switch sector {
        case .standard:
            return "\(hour.formatize()):\(minute.formatize())"
        case .amPm:
            let timeSector = hour < 12 ? "am" : "pm"
            return "\((hour % 12 == 0 ? 12 : hour % 12).formatize()):\(minute.formatize()) \(timeSector)"
        }
    }
}

enum Format: String {
    case dateOnly = "MM'/'dd'/'yyyy"
    case short = "MM'/'yy"
    case standartFull = "MM'/'dd'/'yyyy hh:mm"
    case amPmFull = "MM'/'dd'/'yyyy hh:mm a"
}

enum TimeSector {
    case standard, amPm
}

extension Int {
    func formatize() -> String {
        return self > 9 ? "\(self)" : "0\(self)"
    }
}


var date = SimpleDate(year: 2024, month: 1, day: 3, time: Time(hour: 23, minute: 8))
date.getTimeWith(.amPmFull)
date.getTimeWith(.dateOnly)
date.getTimeWith(.short)
date.getTimeWith(.standartFull)
