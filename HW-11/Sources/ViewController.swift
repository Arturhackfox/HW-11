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
        tf.placeholder = "Enter your username.."
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
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            
            userTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 50),
            userTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userTextField.heightAnchor.constraint(equalToConstant: 50),
            userTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            userTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    // MARK: - Actions
    
    
}

