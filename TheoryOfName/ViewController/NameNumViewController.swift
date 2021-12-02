//
//  NameNumViewController.swift
//  TheoryOfName
//
//  Created on 2021/11/7.
//⎡⎤⎣⎦⎜⎟△▲▽▼↓↑

import UIKit

class NameNumViewController: UIViewController {

    var firstName = ""
    var lastName = ""
    var birthdate = ""
    var arrays = [NameJson]()
    
    @IBOutlet weak var birthdateLabel: UILabel!
    @IBOutlet weak var movingNumLabel: UILabel!
    @IBOutlet weak var movingFive_eleLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var firstNameNumLabel: UILabel!
    @IBOutlet weak var secNameLabel: UILabel!
    @IBOutlet weak var secNameNumLabel: UILabel!
    @IBOutlet weak var thirdNameLabel: UILabel!
    @IBOutlet weak var thirdNameNumLabel: UILabel!
    @IBOutlet weak var fourNameLabel: UILabel!
    @IBOutlet weak var fourNameNumLabel: UILabel!
    @IBOutlet weak var parentsNumLabel: UILabel!
    @IBOutlet weak var parentsFive_eleLabel: UILabel!
    @IBOutlet weak var diseaseNumLabel: UILabel!
    @IBOutlet weak var diseaseFive_eleLabel: UILabel!
    @IBOutlet weak var friendsNumLabel: UILabel!
    @IBOutlet weak var friendsFive_eleLabel: UILabel!
    @IBOutlet weak var upBetweenLabel: UILabel!
    @IBOutlet weak var downBetweenLabel: UILabel!
    @IBOutlet weak var underLine: UILabel!
    @IBOutlet weak var totalNumLabel: UILabel!
    @IBOutlet weak var totalFive_eleLabel: UILabel!
    
    @IBOutlet weak var backFontButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var workOnButton: UIButton!
    @IBOutlet weak var waterMoveButton: UIButton!
    @IBOutlet weak var personalityButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sizeAndPosition()
        arrays = getData()
        DispatchQueue.main.async {
            self.calcuate()
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func sizeAndPosition() {
        let width = self.view.frame.width
        let height = self.view.frame.height
        let margins = birthdateLabel.superview!.layoutMarginsGuide
//        let tenOneHeight = height/4
        let threeOneWidth = width/2
        
        backFontButton.translatesAutoresizingMaskIntoConstraints = false
        backFontButton.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        backFontButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        backButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        birthdateLabel.translatesAutoresizingMaskIntoConstraints = false
        birthdateLabel.topAnchor.constraint(equalTo: backFontButton.bottomAnchor, constant: 15).isActive = true
        birthdateLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        firstNameLabel.topAnchor.constraint(equalTo: birthdateLabel.bottomAnchor, constant: 15).isActive = true
        firstNameNumLabel.translatesAutoresizingMaskIntoConstraints = false
        firstNameNumLabel.centerYAnchor.constraint(equalTo: firstNameLabel.centerYAnchor).isActive = true
        firstNameNumLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        firstNameNumLabel.widthAnchor.constraint(equalToConstant: 26).isActive = true
        firstNameLabel.trailingAnchor.constraint(equalTo: firstNameNumLabel.leadingAnchor, constant: -15).isActive = true
        
        secNameLabel.translatesAutoresizingMaskIntoConstraints = false
        secNameLabel.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 15).isActive = true
        secNameNumLabel.translatesAutoresizingMaskIntoConstraints = false
        secNameNumLabel.centerYAnchor.constraint(equalTo: secNameLabel.centerYAnchor).isActive = true
        secNameNumLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        secNameNumLabel.widthAnchor.constraint(equalToConstant: 26).isActive = true
        secNameLabel.trailingAnchor.constraint(equalTo: secNameNumLabel.leadingAnchor, constant: -15).isActive = true
        
        thirdNameLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdNameLabel.topAnchor.constraint(equalTo: secNameLabel.bottomAnchor, constant: 15).isActive = true
        thirdNameNumLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdNameNumLabel.centerYAnchor.constraint(equalTo: thirdNameLabel.centerYAnchor).isActive = true
        thirdNameNumLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        thirdNameNumLabel.widthAnchor.constraint(equalToConstant: 26).isActive = true
        thirdNameLabel.trailingAnchor.constraint(equalTo: thirdNameNumLabel.leadingAnchor, constant: -15).isActive = true
        
        fourNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fourNameLabel.topAnchor.constraint(equalTo: thirdNameLabel.bottomAnchor, constant: 15).isActive = true
        fourNameNumLabel.translatesAutoresizingMaskIntoConstraints = false
        fourNameNumLabel.centerYAnchor.constraint(equalTo: fourNameLabel.centerYAnchor).isActive = true
        fourNameNumLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        fourNameNumLabel.widthAnchor.constraint(equalToConstant: 26).isActive = true
        fourNameLabel.trailingAnchor.constraint(equalTo: fourNameNumLabel.leadingAnchor, constant: -15).isActive = true
        
        movingFive_eleLabel.translatesAutoresizingMaskIntoConstraints = false
        movingFive_eleLabel.centerYAnchor.constraint(equalTo: secNameLabel.bottomAnchor, constant: 7.5).isActive = true
        movingFive_eleLabel.trailingAnchor.constraint(equalTo: secNameLabel.leadingAnchor, constant: -15).isActive = true
        
        movingNumLabel.translatesAutoresizingMaskIntoConstraints = false
        movingNumLabel.centerYAnchor.constraint(equalTo: movingFive_eleLabel.centerYAnchor).isActive = true
        movingNumLabel.trailingAnchor.constraint(equalTo: movingFive_eleLabel.leadingAnchor).isActive = true
        
        parentsNumLabel.translatesAutoresizingMaskIntoConstraints = false
        parentsNumLabel.centerYAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 7.5).isActive = true
        parentsNumLabel.leadingAnchor.constraint(equalTo: firstNameNumLabel.trailingAnchor, constant: 15).isActive = true
        parentsNumLabel.widthAnchor.constraint(equalToConstant: 26).isActive = true
        
        parentsFive_eleLabel.translatesAutoresizingMaskIntoConstraints = false
        parentsFive_eleLabel.centerYAnchor.constraint(equalTo: parentsNumLabel.centerYAnchor).isActive = true
        parentsFive_eleLabel.leadingAnchor.constraint(equalTo: parentsNumLabel.trailingAnchor).isActive = true
        
        diseaseNumLabel.translatesAutoresizingMaskIntoConstraints = false
        diseaseNumLabel.centerYAnchor.constraint(equalTo: secNameLabel.bottomAnchor, constant: 7.5).isActive = true
        diseaseNumLabel.leadingAnchor.constraint(equalTo: secNameNumLabel.trailingAnchor, constant: 15).isActive = true
        diseaseNumLabel.widthAnchor.constraint(equalToConstant: 26).isActive = true
        
        diseaseFive_eleLabel.translatesAutoresizingMaskIntoConstraints = false
        diseaseFive_eleLabel.centerYAnchor.constraint(equalTo: diseaseNumLabel.centerYAnchor).isActive = true
        diseaseFive_eleLabel.leadingAnchor.constraint(equalTo: diseaseNumLabel.trailingAnchor).isActive = true
        
        friendsNumLabel.translatesAutoresizingMaskIntoConstraints = false
        friendsNumLabel.centerYAnchor.constraint(equalTo: thirdNameLabel.bottomAnchor, constant: 7.5).isActive = true
        friendsNumLabel.leadingAnchor.constraint(equalTo: thirdNameNumLabel.trailingAnchor, constant: 15).isActive = true
        friendsNumLabel.widthAnchor.constraint(equalToConstant: 26).isActive = true
        
        friendsFive_eleLabel.translatesAutoresizingMaskIntoConstraints = false
        friendsFive_eleLabel.centerYAnchor.constraint(equalTo: friendsNumLabel.centerYAnchor).isActive = true
        friendsFive_eleLabel.leadingAnchor.constraint(equalTo: friendsNumLabel.trailingAnchor).isActive = true
        
        upBetweenLabel.translatesAutoresizingMaskIntoConstraints = false
        upBetweenLabel.centerXAnchor.constraint(equalTo: parentsNumLabel.trailingAnchor).isActive = true
        upBetweenLabel.centerYAnchor.constraint(equalTo: secNameNumLabel.centerYAnchor).isActive = true
        
        downBetweenLabel.translatesAutoresizingMaskIntoConstraints = false
        downBetweenLabel.centerXAnchor.constraint(equalTo: parentsNumLabel.trailingAnchor).isActive = true
        downBetweenLabel.centerYAnchor.constraint(equalTo: thirdNameNumLabel.centerYAnchor).isActive = true
        
        underLine.translatesAutoresizingMaskIntoConstraints = false
        underLine.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        underLine.topAnchor.constraint(equalTo: fourNameLabel.bottomAnchor, constant: 20).isActive = true
        
        totalNumLabel.translatesAutoresizingMaskIntoConstraints = false
        totalNumLabel.centerXAnchor.constraint(equalTo: firstNameLabel.centerXAnchor).isActive = true
        totalNumLabel.topAnchor.constraint(equalTo: underLine.bottomAnchor, constant: 15).isActive = true
        totalNumLabel.widthAnchor.constraint(equalToConstant: 26).isActive = true
        
        totalFive_eleLabel.translatesAutoresizingMaskIntoConstraints = false
        totalFive_eleLabel.leadingAnchor.constraint(equalTo: totalNumLabel.trailingAnchor).isActive = true
        totalFive_eleLabel.centerYAnchor.constraint(equalTo: totalNumLabel.centerYAnchor).isActive = true
        
        workOnButton.translatesAutoresizingMaskIntoConstraints = false
        workOnButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -threeOneWidth/2).isActive = true
        workOnButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -15).isActive = true
        
        waterMoveButton.translatesAutoresizingMaskIntoConstraints = false
        waterMoveButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        waterMoveButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -15).isActive = true
        
        personalityButton.translatesAutoresizingMaskIntoConstraints = false
        personalityButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: threeOneWidth/2).isActive = true
        personalityButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -15).isActive = true
    }
    
    func calcuate() {
        //先算筆畫 取數字 算五行 生剋平
        let nameArrays = countName(lastName: lastName, firstName: firstName, arrays: arrays)
        
        let firstNum = nameArrays[0].writingNum
        let secNum = nameArrays[1].writingNum
        let thirdNum = nameArrays[2].writingNum
        let fourthNum = nameArrays[3].writingNum
        
        let movingNum = firstNum + fourthNum
        let parentNum = firstNum + secNum
        let diseaseNum = secNum + thirdNum
        let friendsNum = thirdNum + fourthNum
        var totalNum = 0
        
        if firstNum == 1 && fourthNum == 1 {
            totalNum = secNum + thirdNum
        }else if firstNum == 1 && fourthNum != 1{
            totalNum = secNum + thirdNum + fourthNum
        }else if firstNum != 1 && fourthNum == 1{
            totalNum = firstNum + secNum + thirdNum
        }else{
            totalNum = firstNum + secNum + thirdNum + fourthNum
        }
        
        let numArrays: [Int] = [movingNum, parentNum, diseaseNum, friendsNum, totalNum]
        var fiveArrays: [String] = []
        
        for k in 0...4 {
            fiveArrays.append(fiveDoing(putIn: numArrays[k]))
        }
        let upText = whatArrow(first: fiveArrays[1], last: fiveArrays[2])
        let downText = whatArrow(first: fiveArrays[2], last: fiveArrays[3])
        
        
        
        
        firstNameLabel.text = nameArrays[0].word
        firstNameNumLabel.text = String(firstNum)
        secNameLabel.text = nameArrays[1].word
        secNameNumLabel.text = String(secNum)
        thirdNameLabel.text = nameArrays[2].word
        thirdNameNumLabel.text = String(thirdNum)
        fourNameLabel.text = nameArrays[3].word
        fourNameNumLabel.text = String(fourthNum)
        movingNumLabel.text = String(movingNum)
        movingFive_eleLabel.text = fiveArrays[0]
        parentsNumLabel.text = String(parentNum)
        parentsFive_eleLabel.text = fiveArrays[1]
        diseaseNumLabel.text = String(diseaseNum)
        diseaseFive_eleLabel.text = fiveArrays[2]
        friendsNumLabel.text = String(friendsNum)
        friendsFive_eleLabel.text = fiveArrays[3]
        totalNumLabel.text = String(totalNum)
        totalFive_eleLabel.text = fiveArrays[4]
        upBetweenLabel.text = upText
        downBetweenLabel.text = downText
        
        birthdateLabel.text = "出生日期：" + birthdate
        
    }
    
    
}