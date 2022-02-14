//
//  ViewController.swift
//  SimpsonsBook
//
//  Created by Samed Semih Sürmeli on 13.02.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var simpsons = [Simpson]()
    var selectedSimpson : Simpson? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
       
        // MARK - MOCK DATA
        let homer = Simpson(_name: "Homer Simpson", _description: """
                            Homer Jay Simpson (born May 12 1956) is the main protagonist and one of the five main characters of The Simpsons series (or show). He is the spouse of Marge Simpson and father of Bart, Lisa and Maggie Simpson. Homer is overweight (said to be ~240 pounds), lazy, and often ignorant to the world around him. Although Homer has many flaws, he has shown to have great caring, love, and even bravery to those he cares about and, sometimes, even others he doesn't. He also serves as the main protagonist of the The Simpsons Movie. He is 39 years old. and he is born in 1951.
                            """, _image: UIImage(named: "Homer_Simpson")!)
        
        let maggie = Simpson(_name: "Maggie Simpson", _description: """
                            Margaret Evelyn Lenny "Maggie" Simpson (born January 12 1989) is the 1-year old daughter and youngest child of Marge and Homer Simpson, the baby sister to Bart and Lisa Simpson, and one of the five main characters of The Simpsons. She is often seen sucking on her pacifier, and when she walks, she trips over her clothing and falls on her face. Because she rarely ever talks, Maggie is the least seen and heard in the Simpson family. Maggie is the very young, infant age of 1.
                            """, _image:UIImage(named: "Maggie_Simpson")!)
        simpsons.append(homer)
        simpsons.append(maggie)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = simpsons[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSimpson = simpsons[indexPath.row]
        performSegue(withIdentifier: "toDetailsViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsViewController" {
            let destination = segue.destination as! DetailsViewController
            destination.selectedSimpson = selectedSimpson
        }
    }
}

