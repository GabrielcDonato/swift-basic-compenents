//
//  ViewController.swift
//  boarding
//
//  Created by Premiersoft on 11/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var stateSwitch: UISwitch!
    
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.keyboardType = .default
        emailTextField.keyboardType = .emailAddress
        passwordTextField.keyboardType = .default
        passwordTextField.isSecureTextEntry = true
        // Do any additional setup after loading the view.

        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self

        registerButton.isEnabled = false
        registerButton.setTitleColor(.red, for:.disabled)
        registerButton.setTitleColor(.blue, for: .normal)
        
        
//        progressView.progress = 0.7
        progressView.tintColor = .green
        progressView.trackTintColor = .gray
        let total = Progress(totalUnitCount: 500)
        total.completedUnitCount = 25
        progressView.setProgress(Float(total.fractionCompleted), animated: true)
        
        
        stateSwitch.isOn = false
        stateSwitch.onTintColor = .red
        
        ////
        slider.backgroundColor = .black
        slider.tintColor = .red
        slider.minimumValue = 0
        //valor que ele esta nesse momento
        slider.value = 5
        slider.maximumValue = 20
        slider.minimumTrackTintColor = .blue
        slider.maximumTrackTintColor = .green
        
        slider.thumbTintColor = .orange
        
    }


    @IBAction func tappedRegisterButton(_ sender: Any) {
        print("aweiawea")
    }
    
    @IBAction func tappedSwitchAction(_ sender: UISwitch) {
        print(sender.isOn)
        
        
        if sender.isOn {
            view.backgroundColor = .white
        } else {
            view.backgroundColor = .darkGray
        }
    }
    
    
    @IBAction func tappedSlider(_ sender: UISlider) {
    
        print(Int(sender.value))
    }
    
    func validateTextField(){
        if nameTextField.text != "" && emailTextField.text != "" && passwordTextField.text != "" {
            
            registerButton.isEnabled = true
        }else {
            registerButton.isEnabled = false
        }
    }
    
    
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function) //printa o nome da funcao
        
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.borderWidth = 1
        
        //ao abrir o teclado
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function) //printa o nome da funcao
        textField.layer.borderWidth = 0
        validateTextField() // colocando essa funcao aq pq o teclado smp fecha, se fosse ao clicar no botao n funcionaria caso eu abrisse outro input

        
        //ao fechar o teclado
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function) //printa o nome da funcao

        textField.resignFirstResponder()
        //funcao para fechar o teclado
    
        return true
        //ao clicar no botao return que fecha o teclado
    }
    
}

