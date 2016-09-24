//
//  LoginViewController.swift
//  Cashoop
//
//  Created by Isgi Arriza on 9/17/16.
//  Copyright © 2016 Isgi Arriza. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    var apiController = ApiController()
    
    @IBAction func buttonLogin(sender: AnyObject) {
        let usernm = textFieldUsername.text
        let password = textFieldPassword.text
        
        apiController.postLogin({ result in
            guard result.error == nil else {
                print("Error: \(result.error)")
                print("Status: Gagal")
                return
            }
            if let value = result.value{
                print("Status jaringan: Sukses")
                let errorCode = value["status"]["code"].int
                switch errorCode {
                case 400? :
                    print("Status data: Gagal")
                    break
                case 200? :
                    print("Status data: Sukses")
                    print("Data: \(value)")
    
//                    let results = value["data"]
//                    let id_pengguna = results["id_pengguna"].intValue
//                    let usernm = results["usernm"].stringValue
//                    let email = results["email"].stringValue
//                    let created_at = results["created_at"].stringValue
//                    let updated_at = results["updated_at"].stringValue
//                    let token = results["token"].stringValue
//                    let nama_depan = results["detail_pengguna"]["nama_depan"].stringValue
//                    let nama_belakang = results["detail_pengguna"]["nama_belakang"].stringValue
//                    let kelamin = results["detail_pengguna"]["kelamin"].stringValue
//                    let tanggal_lahir = results["detail_pengguna"]["tanggal_lahir"].stringValue
//                    let alamat = results["detail_pengguna"]["alamat"].stringValue
//                    let hp = results["detail_pengguna"]["hp"].stringValue
                    
                    NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn")
                    NSUserDefaults.standardUserDefaults().synchronize()
                    
                    let myViewController : DashboardViewController = self.storyboard!.instantiateViewControllerWithIdentifier("dashboardViewController") as! DashboardViewController
                    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                    appDelegate.window?.rootViewController = myViewController
                    appDelegate.window?.makeKeyAndVisible()
                    
                    break
                default :
                    print("Status data: Gagal, Status code \(errorCode)")
                    break
                }
                
            }
        }, usernm: usernm!, password: password!)
        
    }
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //textFieldUsername.delegate = self
        //textFieldPassword.delegate = self
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            if view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height-160
            }
            else {
                
            }
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            if view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height-160
            }
            else {
                
            }
        }
    }
    
    //tombol return keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == textFieldUsername {
            textFieldPassword.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    //sentuh layar untuk mendisable keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
