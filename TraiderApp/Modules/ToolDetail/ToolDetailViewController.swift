import UIKit

class ToolDetailViewController: UIViewController {
    
    var presenter:ToolDetailPresenter!
    let padding:CGFloat = 20;
    let height:CGFloat = 60;
    
    let companyTitle:UILabel = Label("Компания:")
    let symbolTitle:UILabel = Label("Имя:")
    let priceTitle:UILabel = Label("Цена:")
    let changeTitle:UILabel = Label("Движение:")
    
    let company:UILabel = Label()
    let symbol:UILabel = Label()
    let price:UILabel = Label()
    let change:UILabel = Label()
    
    let loadingButton = LoadButton();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        navigationController?.navigationBar.prefersLargeTitles = true;
        view.backgroundColor = .white;
        
        view.addSubview(company);
        view.addSubview(symbol);
        view.addSubview(price);
        view.addSubview(change);
        view.addSubview(companyTitle);
        view.addSubview(symbolTitle);
        view.addSubview(priceTitle);
        view.addSubview(changeTitle);
        view.addSubview(loadingButton);
        
        loadingButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside);
        
        NSLayoutConstraint.activate([
            companyTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            companyTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            symbolTitle.topAnchor.constraint(equalTo: companyTitle.bottomAnchor, constant: padding),
            symbolTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            priceTitle.topAnchor.constraint(equalTo: symbolTitle.bottomAnchor, constant: padding),
            priceTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            changeTitle.topAnchor.constraint(equalTo: priceTitle.bottomAnchor, constant: padding),
            changeTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            company.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            company.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            symbol.topAnchor.constraint(equalTo: company.bottomAnchor, constant: padding),
            symbol.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            price.topAnchor.constraint(equalTo: symbol.bottomAnchor, constant: padding),
            price.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            change.topAnchor.constraint(equalTo: price.bottomAnchor, constant: padding),
            change.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            loadingButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            loadingButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            loadingButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            loadingButton.heightAnchor.constraint(equalToConstant: height),
        ]);
    }
    
    @objc private func buttonTapped() {
        presenter.getDetails();
    }
}

extension ToolDetailViewController:ToolDetailProtocol {
    func success() {
        loadingButton.setLoading(false);
        company.text = presenter.details?.companyName;
        symbol.text = presenter.details?.symbol;
        price.text = "\(presenter.details?.latestPrice ?? 0)";
        change.text = "\(presenter.details?.change ?? 0)";
        change.textColor = (presenter.details?.change ?? 0) < 0 ? .red : .systemGreen;
        
        UIView.animate(withDuration: 0.3, delay: 0) {
            self.loadingButton.backgroundColor = .black;
        }
    }
    
    func failure(error: Error) {
        print("Error");
    }
    
    func refresh() {
        loadingButton.setLoading(true);
        company.text = "";
        symbol.text = "";
        price.text = "";
        change.text = "";
        
        UIView.animate(withDuration: 0.3, delay: 0) {
            self.loadingButton.backgroundColor = .gray;
        }
    }
}
