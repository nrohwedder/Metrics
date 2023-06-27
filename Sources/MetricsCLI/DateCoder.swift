import Foundation

public final class DateCoder {
    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter
    }()
    
    public static func encode(date: Date) -> String {
        dateFormatter.string(from: date)
    }
    
    public static func decode(string: String) -> Date? {
        dateFormatter.date(from: string)
    }
}
