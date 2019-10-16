//
//  FileManager+Extenstions.swift
//  M.SMS
//
//  Created by Kanishka Raveendra on 8/5/19.
//  Copyright © 2019 Kanishka Raveendra. All rights reserved.
//

import Foundation

extension FileManager {
    class func documentsDir() -> String {
        var paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as [String]
        return paths[0]
    }
    
    class func cachesDir() -> String {
        var paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true) as [String]
        return paths[0]
    }
    
    /*
    if let documentsPathString = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
        //This gives you the string formed path
        print("DocumentsPathString: \(documentsPathString)")
        // -->  /Users/kanishka/Library/Developer/CoreSimulator/Devices/0BBE8E20-C020-4CDB-9815-A5B873174159/data/Containers/Data/Application/00B97900-BA0D-494A-9C03-73EDB76F96C9/Documents
    }
    
    //recommendation is to use NSURLs for files and directories instead of NSString based paths
    if let documentsPathURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        //This gives you the URL of the path
        // --> file:///Users/kanishka/Library/Developer/CoreSimulator/Devices/0BBE8E20-C020-4CDB-9815-A5B873174159/data/Containers/Data/Application/00B97900-BA0D-494A-9C03-73EDB76F96C9/Documents
        print("DocumentsPathURL: \(documentsPathURL)")
    }
  */
}
