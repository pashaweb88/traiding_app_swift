import Foundation

struct Detail:Decodable {
    var companyName: String;
    var symbol: String;
    var latestPrice: Double;
    var change: Double;
}
