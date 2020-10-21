//
//  ChildsTableViewModel.swift
//  project_alpha
//
//  Created by Tomas Boda on 21/10/2020.
//

import Foundation

class ChildsTableViewModel: ObservableObject{
    @Published var childs: [ChildViewModel]
    
    init() {
        self.childs = CoreDataManager.shared.getChilds().map(ChildViewModel.init)
    }
    
    func fetchAll() {
        self.childs = CoreDataManager.shared.getChilds().map(ChildViewModel.init)
    }
    
    func removeChild(child: ChildViewModel) {
        CoreDataManager.shared.removeChild(id: child.id)
        fetchAll()
    }
    
}
