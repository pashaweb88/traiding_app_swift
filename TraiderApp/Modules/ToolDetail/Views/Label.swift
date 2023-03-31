import UIKit

class Label: UILabel {

    init(_ title : String = "") {
        super.init(frame: CGRect.zero);
        translatesAutoresizingMaskIntoConstraints = false;
        text = title;
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
    }

}
