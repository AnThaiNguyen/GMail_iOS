//
//  FoundationExtensions.swift
//  GMailApp
//
//  Created by Dao Duy Duong on 2/28/18.
//  Copyright © 2018 Nguyen Thai An. All rights reserved.
//

import Foundation

extension String {
    
    func index(of string: String, options: CompareOptions = .literal) -> Index? {
        return range(of: string, options: options)?.lowerBound
    }
    
}
