//
//  String+extension.swift
//  GithubProfile
//
//  Created by Vaibhav Gupta on 11/02/25.
//

import Foundation

extension String{
    
    func toReadableDate() -> String?{
        let currentDateFormatter = DateFormatter()
        currentDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        currentDateFormatter.locale = .current
        currentDateFormatter.timeZone = .current
        
        guard let date = currentDateFormatter.date(from: self) else {return nil}
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = .current
        dateFormatter.timeStyle = .medium
        
        return dateFormatter.string(from: date)
        
        
    }
    
}
