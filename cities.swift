//
//  cities.swift
//  Lab4
//
//  Created by Drew Merrill on 10/9/19.
//  Copyright © 2019 Drew Merrill. All rights reserved.
//

import Foundation
import UIKit

class cities
{
    var cities:[city] = []
    
    init()
    {
        /*let c1 = city(cn: "Tempe", cd: "Where ASU campus is located", cin: "tempe.jpeg")
        let c2 = city(cn: "Tucson", cd: "A dumpster town", cin: "tucson.jpeg")
        let c3 = city(cn: "Paris", cd: "City of love", cin: "paris.jpeg")
        let c4 = city(cn: "Rome", cd: "veni vidi vici", cin: "rome.jpeg")
        let c5 = city(cn: "Glasgow", cd: "Most populous city in Scotland", cin: "glasgow.jpeg")
        
        cities.append(c1)
        cities.append(c2)
        cities.append(c3)
        cities.append(c4)
        cities.append(c5)*/
    }
    
    func getCount() -> Int
    {
        return cities.count
    }
    
    func getCityObject(item:Int) -> city
    {
        return cities[item]
    }
    
    func addCityObject(name:String, desc:String, image:String, cityImage:UIImage) -> city
    {
        let c = city(cn: name, cd:desc, cin: image, ci: cityImage)
        cities.append(c)
        return c
    }
    
    func removeCityObject(item:Int)
    {
        cities.remove(at: item)
    }
    
    func getCityName(loc: Int) -> String
    {
        return cities[loc].cityName!
    }
    
    func getCityImage(loc: Int) -> UIImage
    {
        return cities[loc].cityImage!
    }
    
    func getCityDescription(loc: Int) -> String
    {
        return cities[loc].cityDescription!
    }
}

class city
{
    var cityName:String?
    var cityDescription:String?
    var cityImageName:String?
    var cityImage:UIImage?
    
    init(cn:String, cd:String, cin:String, ci:UIImage)
    {
        cityName = cn
        cityDescription = cd
        cityImageName = cin
        cityImage = ci
    }
}
