import UIKit

extension UITextField {
    func setLeftIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 40, y: 0, width: 15, height: 15))
        iconView.image = image
        let iconContrainerView: UIView = UIView(frame: CGRect(x: 40, y: 0, width: 80, height: 15))
        iconContrainerView.addSubview(iconView)
        leftView = iconContrainerView
        leftViewMode = .always
    }

    func setRightIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))
        iconView.image = image
        let iconContrainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 15))
        iconContrainerView.addSubview(iconView)
        rightView = iconContrainerView
        rightViewMode = .always
    }
}
