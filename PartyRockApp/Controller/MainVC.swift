//
//  MainVC.swift
//  PartyRockApp
//
//  Created by Kirti Ahlawat on 03/02/18.
//  Copyright © 2018 xyz. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        //https://www.youtube.com/embed/gOEmIq_0cpY
        let p1 = PartyRock(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<iframe width=\"100%\" height=\"100%\" src=\"https://www.youtube.com/embed/gOEmIq_0cpY\" frameborder=\"0\" allow=\"autoplay; encrypted-media\"></iframe>", videoTitle: "Where the sun goes down")
        
        let p2 = PartyRock(imageURL: "http://www.croshalgroup.com/wp-content/uploads/2015/05/Redfoo-Website.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/1w9DiGlZksU\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", videoTitle: "Let's get Ridiculous")
        
         let p3 = PartyRock(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/gOEmIq_0cpY\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", videoTitle: "Where the sun goes down")
        
         let p4 = PartyRock(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/gOEmIq_0cpY\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", videoTitle: "Where the sun goes down")
        
         let p5 = PartyRock(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/gOEmIq_0cpY\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>", videoTitle: "Where the sun goes down")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell{
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "mainToVideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mainToVideoVC"{
            if let destination = segue.destination as? VideoVC{
                if let partyRock = sender as? PartyRock{
                    destination.partyRock = partyRock
                }
            }
        }
    }
    
}

