//
//  KeyInNameViewController.swift
//  TheoryOfName
//
//  Create on 2021/11/7.
//

import UIKit

class KeyInNameViewController: UIViewController {

    let style = itemStyle()
    let keyMoving = keyboardMove()
    var firstName = ""
    var lastName = ""
    
    @IBOutlet weak var backFontButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstNameTitleLabel: UILabel!
    @IBOutlet weak var nameTitleLabel: UILabel!
    @IBOutlet weak var birthdayTitleLabel: UILabel!
    
    @IBOutlet weak var birthdatePicker: UIDatePicker!
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var firstNameTF: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sizeAndPosition()
        outlookShowing()
        
//        keyMoving.registerForKeyboardNotifications(controller: self) { keyboard in
//            self.keyMoving.keyboardWasShown(keyboard, view: self.view)
//        } hideHandle: { disapear in
//            self.keyMoving.keyboardWillBeHidden(disapear, view: self.view)
//        }
        keyMoving.addTapGesture(controller: self, view: self.view, selector: #selector(hideKeyboard))
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func confirmButton(_ sender: Any) {
        
        let keyInFirst = firstNameTF.text!
        let keyInLast = nameTF.text!
        
        if keyInFirst.count < 1 || keyInLast.count < 1 {
            print("輸入不完整")
        }else{
            firstName = keyInFirst
            lastName = keyInLast
            performSegue(withIdentifier: "ToNameNumSegue", sender: nil)
        }
        
    }
    
    func sizeAndPosition() {
        let width = self.view.frame.width
        let height = self.view.frame.height
        let margins = titleLabel.superview!.layoutMarginsGuide
        let fiveOneHeight = height/7
        let sevenOneWidth = width/7
        
        backFontButton.translatesAutoresizingMaskIntoConstraints = false
        backFontButton.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        backFontButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        backButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
//        birthdatePicker.preferredDatePickerStyle = .inline
        birthdatePicker.translatesAutoresizingMaskIntoConstraints = false
        birthdatePicker.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        birthdatePicker.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: fiveOneHeight).isActive = true
//        birthdatePicker.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
//        birthdatePicker.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15).isActive = true
        
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        confirmButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        
        birthdayTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        birthdayTitleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        birthdayTitleLabel.bottomAnchor.constraint(equalTo: birthdatePicker.topAnchor, constant: -10).isActive = true
        
        nameTF.translatesAutoresizingMaskIntoConstraints = false
        nameTF.widthAnchor.constraint(equalToConstant: width/7*2).isActive = true
        nameTF.heightAnchor.constraint(equalToConstant: 45).isActive = true
        nameTF.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: sevenOneWidth).isActive = true
        nameTF.trailingAnchor.constraint(equalTo: firstNameTF.leadingAnchor, constant: -sevenOneWidth).isActive = true
        nameTF.bottomAnchor.constraint(equalTo: birthdayTitleLabel.topAnchor, constant: -50).isActive = true
        
        firstNameTF.translatesAutoresizingMaskIntoConstraints = false
        firstNameTF.widthAnchor.constraint(equalToConstant: width/7*2).isActive = true
        firstNameTF.heightAnchor.constraint(equalToConstant: 45).isActive = true
        firstNameTF.centerYAnchor.constraint(equalTo: nameTF.centerYAnchor).isActive = true
        
        nameTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTitleLabel.centerXAnchor.constraint(equalTo: nameTF.centerXAnchor).isActive = true
        nameTitleLabel.bottomAnchor.constraint(equalTo: nameTF.topAnchor, constant: -10).isActive = true
        
        firstNameTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        firstNameTitleLabel.centerXAnchor.constraint(equalTo: firstNameTF.centerXAnchor).isActive = true
        firstNameTitleLabel.bottomAnchor.constraint(equalTo: nameTF.topAnchor, constant: -10).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: nameTitleLabel.topAnchor, constant: -45).isActive = true
    }
    
    
    func outlookShowing() {
        let now = Date()
        birthdatePicker.maximumDate = now
        
        style.blackLabel(label: titleLabel, size: 20)
        
        nameTitleLabel.text = "姓氏"
        firstNameTitleLabel.text = "名字"
        birthdayTitleLabel.text = "請選擇出生日期"
        
    }
    //結束鍵盤
        @objc private func hideKeyboard() {
            self.view.endEditing(true)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ToNameNumSegue":
            if let controller = segue.destination as? NameNumViewController {
                controller.firstName = self.firstName
                controller.lastName = self.lastName
                let birth = birthdatePicker.date
                let dateformatter = DateFormatter()
                dateformatter.dateFormat = "YYYY"
                let years = dateformatter.string(from: birth)
                var Taiwan = 0
                if let yearNum = Int(years) {
                    Taiwan = yearNum - 1911
                }
                dateformatter.dateFormat = "MM / dd"
                let date = dateformatter.string(from: birth)
                controller.birthdate = "\(Taiwan) / \(date)"
            }
        default: break
        }
    }
    
    
}
