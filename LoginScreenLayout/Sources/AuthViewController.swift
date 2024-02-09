import UIKit

class AuthViewController: UIViewController {

    // MARK: - UI Elements

    private lazy var backgroundImageView: UIImageView = {
        let image = UIImage(named: "backgroundLoginScreen")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    private lazy var loginTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()

    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        let loginIcon = UIImage(named: "loginIcon")
        let checkIcon = UIImage(named: "checkIcon")

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.setLeftIcon(loginIcon!)
        textField.setRightIcon(checkIcon!)
        textField.backgroundColor = .white
        textField.layer.cornerRadius = Metric.cornerRadiusTextFieldRatio * Metric.screenHeight
        textField.textColor = .black
        textField.textAlignment = .left
        textField.placeholder = "login"
        textField.isUserInteractionEnabled = true
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        let passwordIcon = UIImage(named: "passwordIcon")

        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.setLeftIcon(passwordIcon!)
        textField.backgroundColor = .white
        textField.layer.cornerRadius = Metric.cornerRadiusTextFieldRatio * Metric.screenHeight
        textField.textColor = .black
        textField.textAlignment = .left
        textField.placeholder = "Password"
        textField.isUserInteractionEnabled = true
        return textField
    }()

    private lazy var buttonLogin: UIButton = {
        let button = UIButton(type: .system)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0.42, green: 0.45, blue: 0.81, alpha: 1)
        button.layer.cornerRadius = Metric.cornerRadiusButtonRatio * Metric.screenHeight
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        button.setTitleColor(.white, for: .normal)

        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale

        return button
    }()

    private lazy var buttonForgotPassword: UIButton = {
        let button = UIButton(type: .system)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitle("Forgot your password?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.contentHorizontalAlignment = .center

        return button
    }()

    private lazy var orConnectLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "or connect with"
        label.textColor = UIColor(red: 0.48, green: 0.48, blue: 0.48, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .center
        return label
    }()

    private lazy var leftDivider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.48, green: 0.48, blue: 0.48, alpha: 1)
        return view
    }()

    private lazy var rightDivider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.48, green: 0.48, blue: 0.48, alpha: 1)
        return view
    }()

    private lazy var buttonFacebook: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()

        config.background.backgroundColor = UIColor(red: 0.21, green: 0.65, blue: 0.94, alpha: 1)
        config.background.cornerRadius = Metric.cornerRadiusButtonRatio * Metric.screenHeight
        config.title = "Facebook"
        config.baseForegroundColor = .white
        config.attributedTitle?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        config.image = UIImage(named: "facebookIcon")
        config.imagePlacement = .leading
        config.imagePadding = 17

        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = config
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale

        return button
    }()

    private lazy var buttonTwitter: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()

        config.background.backgroundColor = UIColor(red: 0.31, green: 0.45, blue: 0.71, alpha: 1)
        config.background.cornerRadius = Metric.cornerRadiusButtonRatio * Metric.screenHeight
        config.title = "Twitter"
        config.baseForegroundColor = .white
        config.attributedTitle?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        config.image = UIImage(named: "twitterIcon")
        config.imagePlacement = .leading
        config.imagePadding = 14

        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = config
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale

        return button
    }()

    private lazy var authButtonsStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 21
        stack.addArrangedSubview(buttonFacebook)
        stack.addArrangedSubview(buttonTwitter)
        return stack
    }()

    private lazy var textSignUp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Don't have an account?"
        label.font = UIFont.systemFont(ofSize: 12, weight:  .regular)
        label.textColor = UIColor(red: 0.48, green: 0.48, blue: 0.48, alpha: 1)
        return label
    }()

    private lazy var buttonSignUp: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign up", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        button.setTitleColor(UIColor(red: 0.42, green: 0.45, blue: 0.81, alpha: 1), for: .normal)
        return button
    }()

    private lazy var signUpStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        stack.alignment = .center
        stack.addArrangedSubview(textSignUp)
        stack.addArrangedSubview(buttonSignUp)
        return stack
    }()

    // MARK: - Lificycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setups

    // Set up the initial view properties
    private func setupView() {
        view.backgroundColor = .white
    }

    // Add UI elements to the view hierarchy
    private func setupHierarchy() {
        view.addSubViews([
            backgroundImageView,
            loginTitleLabel,
            loginTextField,
            passwordTextField,
            buttonLogin,
            buttonForgotPassword,
            orConnectLabel,
            leftDivider,
            rightDivider,
            authButtonsStackView,
            signUpStackView
        ])
    }

    // Set up layout constraints for UI elements
    private func setupLayout() {
        let backgroundImageHeight = Metric.screenHeight * Metric.backgroundImageHeightRatio
        let centerYOffsetTitleLabel = Metric.screenHeight * Metric.centerYOffsetTitleLabelRatio
        let topMarginLoginTextField = Metric.screenHeight * Metric.topMarginLoginTextFieldRatio
        let leadingTrailingMargin = Metric.screenWidth * Metric.leadingTrailingMarginRatio
        let heightTextField = Metric.screenHeight * Metric.heightTextFieldRatio
        let heightButton = Metric.screenHeight * Metric.heightButtonRatio
        let topMarginPasswordTextField = Metric.screenHeight * Metric.topMarginPasswordTextFieldRatio
        let topMarginButtonLogin = Metric.screenHeight * Metric.topMarginLoginButtonRation
        let topMarginButtonForgot = Metric.screenHeight * Metric.topMarginButtonForgotRatio
        let topMarginOrLabel = Metric.screenHeight * Metric.topMarginOrLabelRatio
        let topMarginDividerOr = orConnectLabel.font.pointSize * Metric.topMarginDividerOrRatio
        let leadingTralingMarginDivider = Metric.screenWidth * Metric.leadingTralingMarginDividerRatio
        let heightDivider = Metric.heightDividerRatio
        let topMarginAuthButton = Metric.screenHeight * Metric.topMarginAuthButtonRatio
        let widthAuthButton = Metric.screenWidth * Metric.widthAuthButtonRation
        let topMarginSingUp = Metric.screenHeight * Metric.topMarginSingUpRatio

        NSLayoutConstraint.activate([
            // Background Image View
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.heightAnchor.constraint(equalToConstant: backgroundImageHeight),

            // Login Title Label
            loginTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTitleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: centerYOffsetTitleLabel),

            // Login Text Field
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingTrailingMargin),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -leadingTrailingMargin),
            loginTextField.topAnchor.constraint(equalTo: loginTitleLabel.bottomAnchor, constant: topMarginLoginTextField),
            loginTextField.heightAnchor.constraint(equalToConstant: heightTextField),

            // Password Text Field
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingTrailingMargin),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -leadingTrailingMargin),
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: topMarginPasswordTextField),
            passwordTextField.heightAnchor.constraint(equalToConstant: heightTextField),

            // Login Button
            buttonLogin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingTrailingMargin),
            buttonLogin.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -leadingTrailingMargin),
            buttonLogin.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: topMarginButtonLogin),
            buttonLogin.heightAnchor.constraint(equalToConstant: heightButton),

            // Forgot Password Button
            buttonForgotPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonForgotPassword.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: topMarginButtonForgot),

            // Or Connect With Label
            orConnectLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            orConnectLabel.topAnchor.constraint(equalTo: buttonForgotPassword.bottomAnchor, constant: topMarginOrLabel),

            // Left Divider
            leftDivider.topAnchor.constraint(equalTo: orConnectLabel.topAnchor, constant: topMarginDividerOr),
            leftDivider.trailingAnchor.constraint(equalTo: orConnectLabel.leadingAnchor, constant: -leadingTralingMarginDivider),
            leftDivider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingTralingMarginDivider),
            leftDivider.heightAnchor.constraint(equalToConstant: heightDivider),

            // Right Divider
            rightDivider.topAnchor.constraint(equalTo: orConnectLabel.topAnchor, constant: topMarginDividerOr),
            rightDivider.leadingAnchor.constraint(equalTo: orConnectLabel.trailingAnchor, constant: leadingTralingMarginDivider),
            rightDivider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -leadingTralingMarginDivider),
            rightDivider.heightAnchor.constraint(equalToConstant: heightDivider),

            // Auth Buttons Stack View
            authButtonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            authButtonsStackView.topAnchor.constraint(equalTo: orConnectLabel.bottomAnchor, constant: topMarginAuthButton),
            authButtonsStackView.heightAnchor.constraint(equalToConstant: heightButton),
            authButtonsStackView.widthAnchor.constraint(equalToConstant: widthAuthButton),

            // Sign Up Stack View
            signUpStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpStackView.topAnchor.constraint(equalTo: authButtonsStackView.bottomAnchor, constant: topMarginSingUp)
        ])
    }
}

extension AuthViewController {
    private struct Metric {
        static let screenWidth = UIScreen.main.bounds.width
        static let screenHeight = UIScreen.main.bounds.height

        static let backgroundImageHeightRatio: CGFloat = 0.65
        static let centerYOffsetTitleLabelRatio: CGFloat = -0.35
        static let topMarginLoginTextFieldRatio: CGFloat = 0.045
        static let leadingTrailingMarginRatio: CGFloat = 0.18
        static let heightTextFieldRatio: CGFloat = 0.05
        static let topMarginPasswordTextFieldRatio: CGFloat = 0.022
        static let topMarginLoginButtonRation: CGFloat = 0.06
        static let heightButtonRatio: CGFloat = 0.045
        static let topMarginButtonForgotRatio: CGFloat = 0.03
        static let topMarginOrLabelRatio: CGFloat = 0.225
        static let topMarginDividerOrRatio: CGFloat = 0.5
        static let leadingTralingMarginDividerRatio: CGFloat = 0.03
        static let heightDividerRatio: CGFloat = 1
        static let topMarginAuthButtonRatio: CGFloat = 0.03
        static let widthAuthButtonRation: CGFloat = 0.855
        static let topMarginSingUpRatio: CGFloat = 0.08
        static let cornerRadiusTextFieldRatio: CGFloat = 0.025
        static let cornerRadiusButtonRatio: CGFloat = 0.0225
    }
}
