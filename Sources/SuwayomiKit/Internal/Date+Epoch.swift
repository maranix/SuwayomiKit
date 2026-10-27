import Foundation

extension Date {
    init?(epochMilliseconds: String?) {
        guard let rawString = epochMilliseconds,
            let milliseconds = Double(rawString),
            milliseconds > 0
        else {
            return nil
        }
        self.init(timeIntervalSince1970: milliseconds / 1000.0)
    }
}
