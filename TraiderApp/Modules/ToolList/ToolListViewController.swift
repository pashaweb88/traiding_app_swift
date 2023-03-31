import UIKit

class ToolListViewController: UIViewController  {
    let cellId = "ToolCell";
    let tools = [
        "Apple": "AAPL",
        "Microsoft": "MSFT",
        "Google": "GOOG",
        "Amazon": "AMZN",
        "Facebook": "Fb"
    ]
    
    var tableView = UITableView();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Traider view";
        navigationController?.navigationBar.prefersLargeTitles = true;
        
        tableView = UITableView(frame: view.bounds, style: .plain);
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        tableView.dataSource = self;
        tableView.delegate = self;
    
        view.addSubview(tableView);
    }
}

extension ToolListViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tools.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath);
        cell.textLabel?.text = Array(tools.keys)[indexPath.row];
        cell.selectionStyle = .none;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let company = Array(tools.values)[indexPath.row];
        let vc = ModuleBuilder.createToolDetailModule(company: company);
        navigationController?.pushViewController(vc, animated: true);
    }
}
