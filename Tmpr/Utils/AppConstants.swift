//
//  AppConstants.swift
//  M.SMS
//
//  Created by Kanishka Raveendra on 6/14/18.
//  Copyright © 2018 Kanishka Raveendra. All rights reserved.
//

import Foundation
import UIKit

struct KEY {
    
    struct UserDefaults {        
        
        static let ALREADY_LOGGEDIN_KEY = "is_already_loggedin_key"
        static let ACCOUNT_KEY = "account_key"
        static let ROLE_INTERNAL_ID_KEY = "role_internal_id_key"
        static let EMPLOYEE_ID_KEY = "employee_id_key"
        static let SUPERVISOR_ID_KEY = "supervisor_id_key"
        static let ROLE_TYPE_KEY = "role_type_key"
        
        static let ROW_SELECTED_SIDE_MENU_KEY = "row_selected_side_menu_key"
        
    }
    
    static let APP_DATE_FORMAT = "dd/MM/yyyy"
    
    enum ACTION: String {
        case GENERATE_PDF = "pendingSignature" // generate pdf
        case COMPLETED = "completed" //completed without signature
        case SIGNED_SVO = "signed" //completed with signature
        case CANCELLED_SVO = "cancelled" // svo cancelled
    }
    
}


struct ScreenSize {
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType {
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
}

struct iOSVersion {
    static let SYS_VERSION_FLOAT = (UIDevice.current.systemVersion as NSString).floatValue
    static let iOS7 = (iOSVersion.SYS_VERSION_FLOAT < 8.0 && iOSVersion.SYS_VERSION_FLOAT >= 7.0)
    static let iOS8 = (iOSVersion.SYS_VERSION_FLOAT >= 8.0 && iOSVersion.SYS_VERSION_FLOAT < 9.0)
    static let iOS9 = (iOSVersion.SYS_VERSION_FLOAT >= 9.0 && iOSVersion.SYS_VERSION_FLOAT < 10.0)
}
