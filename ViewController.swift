//
//  ViewController.swift
//  Lab4
//
//  Created by Drew Merrill on 10/9/19.
//  Copyright © 2019 Drew Merrill. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    var myCityList:cities = cities()
    @IBOutlet weak var cityTable: UITableView!
    @IBOutlet weak var imageSource: UISegmentedControl!
    let picker = UIImagePickerController()
    var image:UIImage?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.cityTable.rowHeight = 100.0
        picker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // calling the model to get the city count
        return myCityList.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityTableViewCell
        cell.layer.borderWidth = 1.0
        let cityItem = myCityList.getCityObject(item:indexPath.row)
        cell.cityTitle.text = cityItem.cityName;
        cell.cityImage.image = image
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell.EditingStyle
    {
        return UITableViewCell.EditingStyle.delete
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        myCityList.removeCityObject(item: indexPath.row)
        self.cityTable.beginUpdates()
        self.cityTable.deleteRows(at: [indexPath], with: .automatic)
        self.cityTable.endUpdates()
    }
    
    
    @IBAction func refresh(_ sender: AnyObject)
    {
        if self.imageSource.selectedSegmentIndex == 0
        {
            if UIImagePickerController.isSourceTypeAvailable(.camera)
            {
                self.picker.allowsEditing = false
                self.picker.sourceType = UIImagePickerController.SourceType.camera
                self.picker.cameraCaptureMode = .photo
                self.picker.modalPresentationStyle = .fullScreen
                self.present(self.picker,animated: true,completion: nil)
            }
            else
            {
                print("No camera")
            }
        }
        else
        {
            self.picker.allowsEditing = false
            self.picker.sourceType = .photoLibrary
            self.picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.picker.modalPresentationStyle = .popover
            self.present(self.picker, animated: true, completion: nil)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let selectedIndex: IndexPath = self.cityTable.indexPath(for: sender as! UITableViewCell)!
        let name = myCityList.getCityName(loc: selectedIndex.row)
        let description = myCityList.getCityDescription(loc: selectedIndex.row)
        let img = myCityList.getCityImage(loc: selectedIndex.row)
        if(segue.identifier == "detailSegue")
        {
            if let viewController: detailViewController = segue.destination as? detailViewController
            {
                viewController.selectedCityName = name
                viewController.selectedCityDescription = description
                viewController.selectedCityImage = img
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
            let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
            picker .dismiss(animated: true, completion: nil)
            image=info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage
            let alert = UIAlertController(title: "Add City", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addTextField(configurationHandler: { textField in textField.placeholder = "Enter Name of the City here"})
            alert.addTextField(configurationHandler: { textField in textField.placeholder = "Enter city description here"})
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler:
            { action in
                if let name = alert.textFields?.first?.text
                {
                    let descr = alert.textFields?[1].text
                    self.myCityList.addCityObject(name: name, desc: descr!, image: "city.jpeg", cityImage: self.image!)
                    let indexPath = IndexPath (row: self.myCityList.getCount() - 1, section: 0)
                    self.cityTable.beginUpdates()
                    self.cityTable.insertRows(at: [indexPath], with: .automatic)
                    self.cityTable.endUpdates()
                }
            }))
            self.present(alert, animated: true)
            self.dismiss(animated: true, completion: nil)
        }
        
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
        {
            dismiss(animated: true, completion: nil)
        }
    
    @IBAction func returnToViewController(segue: UIStoryboardSegue)
    {
        if let sourceViewController = segue.source as? detailViewController{}
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Helper function inserted by Swift 4.2 migrator.
    fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any]
    {
        return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
    }

    // Helper function inserted by Swift 4.2 migrator.
    fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String
    {
        return input.rawValue
    }

}

