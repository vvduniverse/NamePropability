//
//  ViewController.swift
//  NamePropability
//
//  Created by Vahtee Boo on 08.08.2021.
//
//https://api.nationalize.io?name=michael

import UIKit

class ViewController: UIViewController {
    
    private var url = "https://api.nationalize.io?name="
    
    private var info: NameProbability? = nil

 
    @IBOutlet weak var userNameOutlet: UITextField!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let showInfoVC = segue.destination as? ShowInfoController else { return }
        showInfoVC.nameInfo = info
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
    
    @IBAction func showInfoButtonPressed() {
        guard let name = userNameOutlet.text else { return }
        url += name
        exampleParsing()
        performSegue(withIdentifier: "showInfoSeguey", sender: nil)
    }
    
    //    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
//
//    }

    
}

extension ViewController {
 
    private func exampleParsing() {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { jsonData, _, error in
            guard let jsonData = jsonData else {
                print(error ?? "No error descriprion")
                return
            }
            do {
                let nameProbability = try JSONDecoder().decode(NameProbability.self, from: jsonData)
                print(nameProbability)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

