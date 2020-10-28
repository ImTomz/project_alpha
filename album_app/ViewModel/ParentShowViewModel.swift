//
//  ParentShowViewModel.swift
//  album_app
//
//  Created by Tomas Boda on 25/10/2020.
//

import Foundation

class ParentShowViewModel: ObservableObject{
    
    @Published var parent: [ParentViewModel]
    
    init() {
        self.parent = CoreDataManager.shared.getParent().map(ParentViewModel.init)
    }
    
    func fetchAll() {
        self.parent = CoreDataManager.shared.getParent().map(ParentViewModel.init)
    }
    
    func editParent(parent: ParentViewModel) {
        CoreDataManager.shared.editParent(name: parent.name,image: parent.image)
        fetchAll()
    }
}
