//
//  Models.swift
//  FiverrOrderMay18SwiftUI
//
//  Created by Gleb Serediuk on 21.05.2022.
//

import SwiftUI

struct SectionData {
    
    let id: String = UUID().uuidString
    let sectionTitle: String
    let items: [CellData]
    var isCollapsed: Bool
    
    init(sectionTitle: String, items: [CellData], isCollapsed: Bool = false) {
        self.sectionTitle = sectionTitle
        self.items = items
        self.isCollapsed = isCollapsed
    }
    
}

struct CellData {
    
    let title: String
    let description: String?
    let value: String?
    let icon: String?
    
    init(title: String, description: String? = nil, value: String? = nil, icon: String? = nil) {
        self.title = title
        self.description = description
        self.value = value
        self.icon = icon
    }
    
}

