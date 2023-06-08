//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Ali Burak Baraç on 17.08.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons = [Simpson]()
    var chosenSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
        //Simpson Objects
        
        let homer = Simpson(simpsonName: "Rick", simpsonJob: "Nuclear Safety,Part Time Genius", simpsonImage: UIImage(named: "Rick")!)
        let marge = Simpson(simpsonName: "Morty", simpsonJob: "Little Slut", simpsonImage: UIImage(named: "morty")!)
        let bart = Simpson(simpsonName: "Beth", simpsonJob: "Depressed Mommy", simpsonImage: UIImage(named: "beth")!)
        let lisa = Simpson(simpsonName: "Summer", simpsonJob: "Horny Sister", simpsonImage: UIImage(named: "summer")!)
        let maggie = Simpson(simpsonName: "Jerry", simpsonJob: "Stupid Dad", simpsonImage: UIImage(named: "jerry")!)
        
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
        
        
        
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = chosenSimpson
        }
    }
}

