//
//  ViewController.swift
//  ShowMessage
//
//  Created by Moises on 11/25/17.
//  Copyright © 2017 Moises. All rights reserved.
//

import UIKit
import SnapKit
import Toaster
import TTGSnackbar

class ViewController: UIViewController {

    let toastButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show Toast", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .purple
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(showToast), for: .touchUpInside)
        return button
    }()
    
    @objc func showToast(){
        showToastNow(message: "Hola gente iOS")
    }
    
    private func showToastNow(message: String){
        Toast(text: message, delay: 0, duration: Delay.short).show()
    }
    
    let snackbarButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show snackbar", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .purple
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(showSnackbar), for: .touchUpInside)
        return button
    }()
    
    @objc func showSnackbar(){
        let snackbar = TTGSnackbar(message: "Hola gente iOS", duration: .long, actionText: "Action!", actionBlock: { snackbar in
            self.showToast()
            snackbar.dismiss()
        })
        snackbar.show();
    }
    
    let alertButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show alert", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .purple
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        return button
    }()
    
    @objc func showAlert(){
        let alert = UIAlertController(title: "Confirmar", message: "Te gusto el video?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Si", style: .default, handler: { action in
            self.showToastNow(message: "Si me gusto :)")
        }))
        alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: { action in
            self.showToastNow(message: "No me gusto :(")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    let alertWithActivityControllerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show alert with activity indicator", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .purple
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(showAlertWithActivityIndicator), for: .touchUpInside)
        return button
    }()
    
    @objc func showAlertWithActivityIndicator(){
        let alert = UIAlertController(title: "Please wait", message: "Loading...", preferredStyle: .alert)
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.startAnimating()
        alert.view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.left.equalTo(alert.view.snp.left).offset(20)
            make.centerY.equalTo(alert.view)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    let alertWithTextFieldButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show alert with textfield", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .purple
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(showAlertWithTextField), for: .touchUpInside)
        return button
    }()
    
    @objc func showAlertWithTextField(){
        let alert = UIAlertController(title: "Nombre", message: "Introduzca su nombre", preferredStyle: .alert)
        alert.addTextField { (textfield) in
            textfield.placeholder = "Nombre"
        }
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { action in
            let textField = alert.textFields![0] as UITextField
            self.showToastNow(message: textField.text!)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
    }
    
    private func addViews(){
        view.addSubview(toastButton)
        view.addSubview(snackbarButton)
        view.addSubview(alertButton)
        view.addSubview(alertWithActivityControllerButton)
        view.addSubview(alertWithTextFieldButton)
        
        toastButton.snp.makeConstraints { (make)in
            make.centerY.equalTo(view)
            make.leftMargin.equalTo(10)
            make.rightMargin.equalTo(-10)
            make.height.equalTo(40)
        }
        
        snackbarButton.snp.makeConstraints { (make) in
            make.top.equalTo(toastButton.snp.bottom).offset(3)
            make.leftMargin.equalTo(10)
            make.rightMargin.equalTo(-10)
            make.height.equalTo(40)
        }
        
        alertButton.snp.makeConstraints { (make) in
            make.top.equalTo(snackbarButton.snp.bottom).offset(3)
            make.leftMargin.equalTo(10)
            make.rightMargin.equalTo(-10)
            make.height.equalTo(40)
        }
        
        alertWithActivityControllerButton.snp.makeConstraints { (make) in
            make.top.equalTo(alertButton.snp.bottom).offset(3)
            make.leftMargin.equalTo(10)
            make.rightMargin.equalTo(-10)
            make.height.equalTo(40)
        }
        
        alertWithTextFieldButton.snp.makeConstraints { (make) in
            make.top.equalTo(alertWithActivityControllerButton.snp.bottom).offset(3)
            make.leftMargin.equalTo(10)
            make.rightMargin.equalTo(-10)
            make.height.equalTo(40)
        }
    }
}













