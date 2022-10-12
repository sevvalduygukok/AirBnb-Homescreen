//
//  TableListItems.swift
//  AirBnb Homescreen
//
//  Created by Gogua on 11.10.2022.
//

import Foundation

struct Description {
    var imageName : String?
    var title : String?
    var desc : String?
    var date : String?
    var price : String?
    var nightPrice : String?
    var starred : String?
    
    init(imageName : String, title: String, desc: String , date: String, price: String, nightPrice: String , starred: String ) {
        self.imageName = imageName
        self.title = title
        self.desc = desc
        self.date = date
        self.price = price
        self.nightPrice = nightPrice
        self.starred = starred
    }
}

