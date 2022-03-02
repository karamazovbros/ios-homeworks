//
//  Constraints.swift
//  Navigation
//
//  Created by Tatiana Volova on 28.01.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: - UI-items
    private var layoutScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .red
        scrollView.alwaysBounceVertical = false
        return scrollView
    }()
    
    private var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private var logoImage: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
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
        return button
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Selectors
    @objc private func goToProfileVC() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Private
    private func configureUI() {
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(hideKeyboardGesture)
        
        view.addSubview(layoutScrollView)
        layoutScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            layoutScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            layoutScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            layoutScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            layoutScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        layoutScrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: layoutScrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: layoutScrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: layoutScrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: layoutScrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
        
        contentView.addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        contentView.addSubview(loginStackView)
        loginStackView.addArrangedSubview(logInTextField)
        loginStackView.addArrangedSubview(passwordTextField)
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        logInTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginStackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            loginStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        contentView.addSubview(logInButton)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
