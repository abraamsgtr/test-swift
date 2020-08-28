//
//  luckVC.swift
//  test-p
//
//  Created by mohammad 141 on 8/27/20.
//  Copyright © 2020 mohammad 141. All rights reserved.
//

import UIKit

class luckVC: UIViewController {
    @IBOutlet var numberLbl: UILabel!
    
    @IBOutlet var wheelBtn: UIButton!
    
    @IBOutlet var shansLbl: UILabel!
    
    //variables
    let randomColors = [UIColor.orange, UIColor.systemPink, UIColor.yellow, UIColor.purple, UIColor.green, UIColor.blue,UIColor.gray, UIColor.blue]
    
    let randomLuckyTexts = ["بد شانسی آوردی که", "باز از صفر بهتره", "هی بدک نیست", "روز خوبی برات خواهد بود", "کاری که میخوای رو انجام بده", "بد بیاری پشت سرته نکن اون کارو", "هی بدک نیست", "یدونه موند اا", "دیگه خودشه"]
    
    func getRandomNumber(index: Int) -> UInt32 {
        let lower : UInt32 = 0
        let upper : UInt32 = 8
        
        
        
        let randomNumber = arc4random_uniform(upper - lower) + lower
        
        self.wheelBtn.setTitle("\(self.getPersianNumber(number: randomNumber))", for: .normal)
        
        return randomNumber
    }
    
    func getPersianNumber(number: UInt32) -> String {
        switch number {
        case 0:
            return "۰"
            break
        case 1:
            return "۱"
            break
        case 2:
            return "۲"
            break
        case 3:
            return "۳"
            break
        case 4:
            return "۴"
            break
        case 5:
            return "۵"
            break
        case 6:
            return "۶"
            break
        case 7:
            return "۷"
            break
        default:
            return "۰"
        }
    }
    
    func setupView() {
        self.wheelBtn.layer.shadowColor = UIColor(rgb: 0xFFfddb3a).withAlphaComponent(0.5).cgColor
        self.wheelBtn.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        self.wheelBtn.layer.shadowOpacity = 1.0
        self.wheelBtn.layer.shadowRadius = 0.0
        self.wheelBtn.layer.masksToBounds = false
        self.wheelBtn.layer.cornerRadius = 4.0
        
        self.numberLbl.text = "۰"
        self.shansLbl.text = ""
    }
    
    func turnWheel() {
        
        var randomLuckyNumber: UInt32!
        
        DispatchQueue.global(qos: .background).async {
            for i in 0...7 {
                
                DispatchQueue.main.async {
                    
                    randomLuckyNumber = self.getRandomNumber(index: i)
                    self.wheelBtn.backgroundColor = self.randomColors[i]
                    print(i)
                    if (i == 7) {
                        self.wheelBtn.isEnabled = true
                        self.numberLbl.text = self.getPersianNumber(number: randomLuckyNumber!)
                        self.shansLbl.text = self.randomLuckyTexts[Int(randomLuckyNumber!)]
                        self.wheelBtn.setTitle("شانستو امتحان کن", for: .normal)
                    } else{
                        self.wheelBtn.isEnabled = false
                        self.shansLbl.text = ""
                    }
                }
                usleep(useconds_t(200000))
                
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("view did load")
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("view did appear")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("view did layout subview")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print("view will layout subviews")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("view did disppear")
    }
    
    
    @IBAction func luchBtnPressed(_ sender: Any) {
        self.turnWheel()
    }

}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
