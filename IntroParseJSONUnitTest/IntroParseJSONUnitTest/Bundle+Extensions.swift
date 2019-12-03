//
//  Bundle+Extensions.swift
//  IntroParseJSONUnitTest
//
//  Created by Juan Ceballos on 12/3/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import Foundation

extension Bundle    {
    static func ParseJSONData(filename: String, ext: String) -> Data {
        
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: ext)
            else    {
                fatalError("trouble accessing file")
        }
        
        var data: Data!
        
        do  {
            data = try Data.init(contentsOf: fileURL)
        }
        
        catch   {
            fatalError("")
        }
        
        return data
    }
}
