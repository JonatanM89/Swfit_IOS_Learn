//
//  Configuration.swift
//  Pensamentos
//
//  Created by Convidado on 23/08/20.
//  Copyright © 2020 Convidado. All rights reserved.
//

import Foundation

enum UserDefaultsKeys: String {
    case timeInterval =  "timeInterval"
    case colorSchema  =  "colorScheme"
    case autoRefresh  =  "autoRefresh"
}

struct Configuration {
    
    let defaults = UserDefaults.standard
    static var shared: Configuration = Configuration()
    
    var timeInterval: Double {
        get{
            return defaults.double(forKey: UserDefaultsKeys.timeInterval.rawValue)
        }
        set{
            defaults.set(newValue, forKey: UserDefaultsKeys.timeInterval.rawValue)
        }
    }
    
    
    var colorSchema: Int {
        get{
            return defaults.integer(forKey: UserDefaultsKeys.colorSchema.rawValue)
        }
        set{
            defaults.set(newValue, forKey: UserDefaultsKeys.colorSchema.rawValue)
        }
    }
    
    
    var autoRefresh: Bool {
        get{
            return defaults.bool(forKey: UserDefaultsKeys.autoRefresh.rawValue)
        }
        set{
            defaults.set(newValue, forKey: UserDefaultsKeys.autoRefresh.rawValue)
        }
    }
    
    
    
    private init(){
        if defaults.double(forKey: UserDefaultsKeys.timeInterval.rawValue) == 0 {
            defaults.set(5.0, forKey: UserDefaultsKeys.timeInterval.rawValue)
        }
    }
}
