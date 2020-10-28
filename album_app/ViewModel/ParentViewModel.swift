//
//  ParentViewModel.swift
//  album_app
//
//  Created by Tomas Boda on 24/10/2020.
//

import Foundation

class ParentViewModel: Identifiable {
    
    var name: String
    var image: Data
    
    init(name: String,image: Data) {
        self.name = name
        self.image = image
    }
    
    init(parent: ParentModel) {
        self.name = parent.name!
        self.image = parent.image!
    }
}
