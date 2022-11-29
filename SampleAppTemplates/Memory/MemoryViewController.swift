//
//  MemoryViewController.swift
//  SampleAppTemplates
//
//  Created by Janani on 27/11/22.
//

import UIKit

class Child {
    var myInt : Int = 5
    
    deinit {
        print("Deallocating child")
    }
}

class Parent {
    var child = Child()
    deinit {
        print("Deallocating Parent")
    }
}

class Job {
    var person : Player?
    deinit {
        print("Deallocating Job")
    }

}

class Player {
   weak var job : Job?
    deinit {
        print("Deallocating Person")
    }

}


class MemoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        basicRefrence()
        removingParent()
          orphan()
    }
    
   
    func basicRefrence(){
        var first : Child? = Child()
        var second = first
        var third = first

        first = nil
        second = nil
        third = nil
    }
    
    func removingParent(){
        var mom : Parent? = Parent()
        
        mom = nil
    }
    
    func orphan() {
        var joe : Player? = Player()
        var dev : Job? = Job()
        
        joe?.job = dev
        dev?.person = joe
        
        joe = nil
        dev = nil
        
        // Not deallocated,it forms retain cycle
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
