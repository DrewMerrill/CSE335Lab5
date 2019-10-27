//
//  detailViewController.swift
//  Lab4
//
//  Created by Drew Merrill on 10/9/19.
//  Copyright © 2019 Drew Merrill. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var cityDescription: UILabel!
    
    var selectedCityName:String?
    var selectedCityImage:UIImage?
    var selectedCityDescription:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cityName.text = selectedCityName
        self.cityDescription.text = selectedCityDescription
        self.cityImage.image = selectedCityImage
        // Do any additional setup after loading the view.
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
