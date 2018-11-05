//
//  RegistrationView.swift
//  ReatchallProjectABC
//
//  Created by PASHA on 03/11/18.
//  Copyright © 2018 Pasha. All rights reserved.
//

import UIKit

class RegistrationView: UIViewController {

  @IBOutlet weak var nameTF: UITextField!
  @IBOutlet weak var emailTF: UITextField!
  
  @IBOutlet weak var passwordTF: UITextField!
  @IBOutlet weak var mobileTF: UITextField!
  @IBOutlet weak var genderTF: UITextField!
  
  @IBOutlet weak var DOBTF: UITextField!
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  @IBAction func forgotPasswordTap(_ sender: Any) {
  }
  @IBAction func createTap(_ sender: Any) {
    
  
      jsonPostServer()
  }
  
  @IBAction func loginTap(_ sender: Any) {
   
    
  }
  
  
  func jsonPostServer() {
    
    let url = URL(string: "https://webapi.reatchall.com/vendor/register")
    
    let params = """
    {
      "name":"\(nameTF.text!)",
      "email":"\(emailTF.text!)",
      "gender" :"\(genderTF.text!)",
      "dob":"\(DOBTF.text!)",
      "mobile":"\(mobileTF.text!)",
      "password":"\(passwordTF.text!)",
      "referral_code":""
    }
    """
    
    print(params)
    let dd = params.data(using: .utf8)
    var request = URLRequest(url: url!)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
    request.httpBody = dd!
    
    let session = URLSession.shared
    session.dataTask(with: request) { (data, response, error) in
      
      if let data = data  {
        
        do {
          let ps = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
          print("data is : \(ps)")
        }
        catch{
          print(error.localizedDescription)
        }
        
      }
      
    }.resume()
    
    
    
  }
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
