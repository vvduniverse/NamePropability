//
//  ViewController.swift
//  NamePropability
//
//  Created by Vahtee Boo on 08.08.2021.
//
//https://api.nationalize.io?name=michael

import UIKit

class ViewController: UIViewController {
    let startUrl = "https://api.nationalize.io?name="
    let url = "https://api.nationalize.io?name=michael"
//    let humanName = "Eugenia"
////    private let url: String
//    var url = ""
//
//    global init(url: String) {
//        self.url = startUrl + humanName
//    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exampleParsing()
        // Do any additional setup after loading the view.
    }
    //   let nameProbability = try? newJSONDecoder().decode(NameProbability.self, from: jsonData)

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

