import Foundation

protocol ToolDetailProtocol:AnyObject {
    func success()
    func failure(error: Error)
    func refresh()
}

protocol ToolDetailPresenterProtocol:AnyObject {
    init(view: ToolDetailProtocol, network: ToolDetailNetworkServiceProtocol, company: String)
    var details: Detail? { get set }
    func getDetails()
    
}

class ToolDetailPresenter:ToolDetailPresenterProtocol {
    var details: Detail?
    weak var view: ToolDetailProtocol?;
    let company: String!
    let network: ToolDetailNetworkServiceProtocol!;
    
    required init(view: ToolDetailProtocol, network: ToolDetailNetworkServiceProtocol, company: String) {
        self.view = view;
        self.network = network;
        self.company = company;
        getDetails()
    }
    
    func getDetails() {
        view?.refresh();
        network.getDetails(company: company) { [weak self] result in
            guard let self = self else {return}
            
            DispatchQueue.main.async {
                switch result {
                case .success(let details):
                    self.details = details;
                    self.view?.success();
                case .failure(let error):
                    self.view?.failure(error: error);
                }
            }
        }
    }
    
    
}
