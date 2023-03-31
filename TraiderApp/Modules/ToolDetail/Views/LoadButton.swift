import UIKit

class LoadButton: UIButton {
    private let cornerRadius: CGFloat = 20;
    private let spinner:UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large);
        view.translatesAutoresizingMaskIntoConstraints = false;
        view.startAnimating();
        view.color = .white;
        return view;
    }()
    
    init(){
        super.init(frame: CGRect.zero);
        translatesAutoresizingMaskIntoConstraints = false;
        backgroundColor = .gray;
        layer.cornerRadius = cornerRadius;
        
        addSubview(spinner);
        
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
        ]);
    }
    
    func setLoading(_ isLoading: Bool){
        if isLoading {
            spinner.startAnimating();
            setTitle("", for: .normal)
        } else {
            spinner.stopAnimating();
            setTitle("Refresh", for: .normal)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
