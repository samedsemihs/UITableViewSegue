//
//  DetailsViewController.swift
//  SimpsonsBook
//
//  Created by Samed Semih Sürmeli on 13.02.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var selectedSimpson : Simpson? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailsLabel.numberOfLines = 10
        
        imageView.image = selectedSimpson?.image
        nameLabel.text = selectedSimpson?.name
        detailsLabel.text = selectedSimpson?.description
    }
    
}
