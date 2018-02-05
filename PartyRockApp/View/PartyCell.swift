//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by Kirti Ahlawat on 03/02/18.
//  Copyright © 2018 xyz. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateUI(partyRock: PartyRock){
        videoTitle.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async {
            do{
                let data =  try Data(contentsOf: url)
                DispatchQueue.main.sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            }catch{
                //TODO: Handle the Error for URL
            }
            
            
        }
        
    }
}
