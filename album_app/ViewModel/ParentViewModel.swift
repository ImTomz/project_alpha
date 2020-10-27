//
//  ParentViewModel.swift
//  album_app
//
//  Created by Tomas Boda on 24/10/2020.
//

import Foundation

class ParentViewModel: Identifiable {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    init(parent: ParentModel) {
        self.name = parent.name!
    }
}
