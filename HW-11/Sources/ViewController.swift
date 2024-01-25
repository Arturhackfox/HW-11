//
//  ViewController.swift
//  HW-11
//
//  Created by Arthur Sh on 25.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var userTextField: UITextField = {
        let tf = UITextField()
        tf.layer.cornerRadius = 20
        tf.placeholder = "Username.."
        tf.backgroundColor = .white
        
        tf.layer.shadowOpacity = 0.3
        tf.layer.shadowRadius = 10
        tf.layer.shadowOffset = CGSize.zero
        tf.layer.shadowColor = UIColor.black.cgColor
        
        tf.leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(systemName: "person")
        imageView.image = image
        tf.leftView = imageView
        tf.tintColor = .gray
        
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    private lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.layer.cornerRadius = 20
        tf.placeholder = "Password.."
        tf.backgroundColor = .white
        
        tf.layer.shadowOpacity = 0.3
        tf.layer.shadowRadius = 10
        tf.layer.shadowOffset = CGSize.zero
        tf.layer.shadowColor = UIColor.black.cgColor
        
        tf.leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(systemName: "lock")
        imageView.image = image
        tf.leftView = imageView
        tf.tintColor = .gray
        
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    private lazy var loginButton: UIButton = {
       let button = UIButton()
        var config = UIButton.Configuration.bordered()
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        
        config.baseBackgroundColor = .purple
        config.baseForegroundColor = .white
        config.title = "Login"
        config.cornerStyle = .capsule
        
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: Inits
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setups
    
    private func setupHierarchy() {
        view.backgroundColor = .cyan
        view.addSubview(loginLabel)
        view.addSubview(userTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            
            userTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 50),
            userTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userTextField.heightAnchor.constraint(equalToConstant: 45),
            userTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            userTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            passwordTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 50),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 45),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    // MARK: - Actions
    
    @objc
    private func loginTapped() {
        print("Login tapped.")
    }

}

