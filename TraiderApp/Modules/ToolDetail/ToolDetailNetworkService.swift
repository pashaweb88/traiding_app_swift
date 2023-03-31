import Foundation

protocol ToolDetailNetworkServiceProtocol {
    func getDetails(company: String, completion: @escaping (Result<Detail?, Error>) -> Void)
}

class ToolDetailNetworkService: ToolDetailNetworkServiceProtocol {
    func getDetails(company: String, completion: @escaping (Result<Detail?, Error>) -> Void) {
        let urlString = "https://cloud.iexapis.com/stable/stock/\(company)/quote?&token=pk_b6545ca7f86a4372a10854fab5c5f66b";
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error));
                return;
            }
            
            do {
                let obj = try JSONDecoder().decode(Detail.self, from: data!);
                completion(.success(obj));
            } catch {
                completion(.failure(error))
            }
        }
        .resume();
    }
}
