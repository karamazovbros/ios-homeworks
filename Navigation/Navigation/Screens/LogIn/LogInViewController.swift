//
//  Constraints.swift
//  Navigation
//
//  Created by Tatiana Volova on 28.01.2022.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func signIn(login: String, password: String) -> Bool
}

class LogInViewController: UIViewController {
    
    weak var delegate: LoginViewControllerDelegate?
    
    private let loginTextField = UITextField ()
    private let passWordTextField = UITextField ()
    
    private func checkCredentials () {
        guard
            let login = loginTextField.text,
            let password = passWordTextField.text
            else { return }
        
        guard let isValid = delegate?.signIn(login: login, password: password) else { return }
        
        if isValid == true {
            let profileVC = ProfileViewController()
            navigationController?.pushViewController(profileVC, animated: false)
            print("Вход выполнен")
        }
        else {
            let alertVC = UIAlertController(title: "Ошибка", message: "Такого пользователя не существует", preferredStyle: .alert)
                        let action = UIAlertAction(title: "ОК", style: .default, handler: nil)
                        alertVC.addAction(action)
            print("пароль неверный")
        }
    }

    // MARK: - UI-items
    private var layoutScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .red
        scrollView.alwaysBounceVertical = false
        scrollView.toAutoLayout()
        return scrollView
    }()
    
    private var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.toAutoLayout()
        return view
    }()
    
    private var logoImage: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
        logo.toAutoLayout()
        return logo
    }()
    
    private var loginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .systemGray6
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.distribution = .fillProportionally
        stackView.clipsToBounds = true
        stackView.toAutoLayout()
        return stackView
    }()
    
    private var logInTextField: UITextField = {
        let textField = UITextField()
        textField.leftViewMode = .always
        textField.placeholder = "Email or phone"
        textField.backgroundColor = .systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.toAutoLayout()
        return textField
    }()
    
    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.leftViewMode = .always
        textField.placeholder = "Password"
        textField.backgroundColor = .systemGray6
        textField.isSecureTextEntry = true
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.toAutoLayout()
        return textField
    }()
    
    private var logInButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.alpha = 1.0
        
        switch button.state {
        case .disabled:
            button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .disabled)
            button.alpha = 0.8
        case .selected:
            button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .selected)
            button.alpha = 0.8
        case .highlighted:
            button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .highlighted)
            button.alpha = 0.8
        default:
            break
        }
        
        button.addTarget(self, action: #selector(goToProfileVC), for: .touchUpInside)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.toAutoLayout()
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Selectors
    @objc private func goToProfileVC() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        logInTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true;
    }
    
    @objc func tap() {
        logInTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        checkCredentials()
    }
    
    @objc func keyboardShow(_ notification: Notification){
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            layoutScrollView.contentOffset.y = keyboardRectangle.height - (layoutScrollView.frame.height - logInButton.frame.minY)
        }
    }
    
    @objc func keyboardHide(_ notification: Notification){
        layoutScrollView.contentOffset = CGPoint(x: 0, y: 0)
    }
    
    // MARK: - Private
    private func configureUI() {
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
        view.addGestureRecognizer(hideKeyboardGesture)
        
        view.addSubview(layoutScrollView)
        layoutScrollView.addSubview(contentView)
        contentView.addSubview(logoImage)
        contentView.addSubview(loginStackView)
        loginStackView.addArrangedSubview(logInTextField)
        loginStackView.addArrangedSubview(passwordTextField)
        contentView.addSubview(logInButton)
    
        NSLayoutConstraint.activate([
            layoutScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            layoutScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            layoutScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            layoutScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: layoutScrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: layoutScrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: layoutScrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: layoutScrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            
            loginStackView.heightAnchor.constraint(equalToConstant: 100),
            loginStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginStackView.topAnchor.constraint(greaterThanOrEqualTo: logoImage.bottomAnchor, constant: 120),
            loginStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            logInTextField.heightAnchor.constraint(equalToConstant: 50),
            logInTextField.topAnchor.constraint(equalTo: loginStackView.topAnchor),
            
            passwordTextField.heightAnchor.constraint(equalTo: logInTextField.heightAnchor),
            passwordTextField.topAnchor.constraint(equalTo: logInTextField.bottomAnchor),
            
            logInButton.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
        ])

    }
}

public extension UIView {
    
    func toAutoLayout(){
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
