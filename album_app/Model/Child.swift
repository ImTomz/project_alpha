//
//  Child.swift
//  project_alpha
//
//  Created by Tomas Boda on 16/10/2020.
//

import Foundation
import CoreData

public class Child:NSManagedObject {
    
    @NSManaged public var name: String?
    @NSManaged public var birthDate: String?
    @NSManaged public var id: UUID?
}
