import UIKit

protocol BuilderProtocol {
    static func createToolListModule() -> UIViewController;
    static func createToolDetailModule(company:String) -> UIViewController;
}

class ModuleBuilder:BuilderProtocol {
    static func createToolDetailModule(company:String) -> UIViewController {
        let view = ToolDetailViewController();
        let network = ToolDetailNetworkService();
        let presenter = ToolDetailPresenter(view: view, network: network, company: company);
        view.presenter = presenter;
        return view;
    }
    
    static func createToolListModule() -> UIViewController {
        return ToolListViewController();
    }
}

