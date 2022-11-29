//
//  CoreDataViewController.swift
//  SampleAppTemplates
//
//  Created by Janani on 28/11/22.
//

import UIKit

class CoreDataViewController: UIViewController {

    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var personTableView: UITableView!
    
    var items : [Person]?

    var i = 0
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchPeople()
        // Do any additional setup after loading the view.
    }
    
    func fetchPeople() {
        // Fetch
        do {
            self.items = try context.fetch(Person.fetchRequest())
            DispatchQueue.main.async {
                self.personTableView.reloadData()
            }
        } catch  {
            
        }
        
    }
    
    @IBAction func addPersonButtonClick(_ sender: Any) {
        i = i + 1
        var newPerson = Person(context: context)
        newPerson.name = "User\(i)"
        newPerson.age = 20
        newPerson.gender = "Male"
        
        do {
            try self.context.save()
        } catch {
            
        }
        fetchPeople()
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


extension CoreDataViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        
        let eachPerson = self.items![indexPath.row]
        cell.textLabel?.text = eachPerson.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            let personToRemove = self.items![indexPath.row]
            self.context.delete(personToRemove)
            try! self.context.save()
            
            self.fetchPeople()
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
}
