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
        
        label.layer.shadowOffset = .zero
        label.layer.shadowOpacity = 0.3
        label.layer.shadowRadius = 7
        label.layer.shadowColor = UIColor.black.cgColor
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var connectWithLabel: UILabel = {
        let label = UILabel()
        label.text = "or connect with"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var dontHaveAccount: UILabel = {
        let label = UILabel()
        label.text = "Dont have account ?"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "sign up"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .blue
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
        tf.rightViewMode = UITextField.ViewMode.always
        
        let imageViewLeft = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let imageViewRight = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        
        let imagePerson = UIImage(systemName: "person")
        let imageCheckMark = UIImage(systemName: "checkmark.circle.fill")
        
        imageViewLeft.image = imagePerson
        imageViewRight.image = imageCheckMark
        imageViewLeft.tintColor = .gray
        imageViewRight.tintColor = .systemGreen
        
        tf.leftView = imageViewLeft
        tf.rightView = imageViewRight
        
        
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
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 8
        button.layer.shadowOpacity = 0.5
        
        config.baseForegroundColor = .white
        config.title = "Forgot your password ?"
        
        
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(forgotPassTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var faceBookButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.bordered()
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        
        if let originalImage = UIImage(named: "facebook"){
            let resizedImage = resizeImage(originalImage, targetSize: CGSize(width: 40, height: 40))
            
            config.image = resizedImage
        }
        
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .white
        config.title = "Facebook"
        config.cornerStyle = .capsule

        button.imageView?.layer.cornerRadius = 20
        button.imageView?.layer.masksToBounds = true
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(facebookTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var twitterButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.bordered()
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        
        if let originalImage = UIImage(named: "twitter"){
            let resizedImage = resizeImage(originalImage, targetSize: CGSize(width: 40, height: 40))
            
            config.image = resizedImage
        }
        
        config.baseBackgroundColor = .magenta
        config.baseForegroundColor = .white
        config.title = "Twitter"
        config.cornerStyle = .capsule

        button.imageView?.layer.cornerRadius = 20
        button.imageView?.layer.masksToBounds = true
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(twitterTapped), for: .touchUpInside)
        
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
        createGestureDismissKeyboard()
    }
    
    // MARK: - Setups
    
    private func createGestureDismissKeyboard() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewDismiss))
        view.addGestureRecognizer(gesture)
    }
    
    
    
    private func setupHierarchy() {
        view.backgroundColor = .cyan
        view.addSubview(loginLabel)
        view.addSubview(userTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(forgotPasswordButton)
        view.addSubview(connectWithLabel)
        view.addSubview(faceBookButton)
        view.addSubview(twitterButton)
        view.addSubview(dontHaveAccount)
        view.addSubview(signUpLabel)
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
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
            forgotPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            connectWithLabel.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 120),
            connectWithLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            faceBookButton.topAnchor.constraint(equalTo: connectWithLabel.bottomAnchor, constant: 30),
            faceBookButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            faceBookButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            faceBookButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -200),
            faceBookButton.heightAnchor.constraint(equalToConstant: 45),
            
            twitterButton.topAnchor.constraint(equalTo: connectWithLabel.bottomAnchor, constant: 30),
            twitterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 200),
            twitterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            twitterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            twitterButton.heightAnchor.constraint(equalToConstant: 45),
            
            dontHaveAccount.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dontHaveAccount.topAnchor.constraint(equalTo: faceBookButton.bottomAnchor, constant: 50),
            dontHaveAccount.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -110),
            
            signUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpLabel.topAnchor.constraint(equalTo: twitterButton.bottomAnchor, constant: 49),
            signUpLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -55),
            signUpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 255)
        ])
    }
    
    // MARK: - Actions
    
    @objc
    private func loginTapped() {
        print("Login tapped.")
    }
    
    @objc
    private func forgotPassTapped() {
        print("recovering password.")
    }
    
    @objc
    private func facebookTapped() {
        print("facebookTapped.")
    }
    
    @objc
    private func twitterTapped() {
        print("twitterTapped.")
    }
    
    @objc
    private func viewDismiss() {
        view.endEditing(true)
    }
    
    // Function to resize the image
    private func resizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        let newSize = widthRatio > heightRatio ? CGSize(width: size.width * heightRatio, height: size.height * heightRatio) : CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage ?? UIImage()
    }
    
    
}

