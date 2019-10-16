//
//  Constants.swift
//  2six4
//
//  Created by Macbook on 2/1/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import Foundation
import UIKit

private var frameBounds = UIScreen.main.bounds

struct UserDefaultsKeys {
    static let languageType = "Language_Type"
    static let selectedContacts = "Selected_Contacts"
}

struct AppURLs {
    struct Domains {
        static let sandBoxURL = "https://ifortradies.com/login/api/"
        static let liveURL = "https://i4tradies.com/login/api/"
        static let googleSearchPlaceURL = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
        static let googlePlaceDetailURL = "https://maps.googleapis.com/maps/api/place/details/json?"
    }
}

struct GoogleAPI{
    static let key = "AIzaSyAcWT949t3x0n6O4RgDbs68Lh_Ug-5DvCc"
}

