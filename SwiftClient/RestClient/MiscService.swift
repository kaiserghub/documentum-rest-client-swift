//
//  MiscService.swift
//  RestClient
//
//  Created by Song, Michyo on 9/14/16.
//  Copyright © 2016 EMC Corporation. All rights reserved.
//

import UIKit

class MiscService {
    
    static func moveTo(object: RestObject, thisController: SysObjectViewController, completionHandler: () -> ()) {
        let clickedObject = Context.clickBoard
        let requestUrl = clickedObject.getLink(LinkRel.parentLinks.rawValue)! + "/" + clickedObject.getRawParentID()
        let dic = ["href": object.getId()]
        RestService.moveObject(requestUrl, requestBody: dic) { response, error in
            if let error = error {
                ErrorAlert.show(error.message, controller: thisController, dismissViewController: false)
            } else if let dic = response {
                let childId = dic["child-id"] as! String
                let parentID = dic["parent-id"] as! String
                print("Successfully move \(childId) to \(parentID).")
                completionHandler()
            }
        }
    }
    
    static func copyTo(object: RestObject, thisController: SysObjectViewController, completionHandler: () -> ()) {
        let clickedObject = Context.clickBoard
        let requestUrl = object.getLink(LinkRel.objects.rawValue)
        let dic = ["href": clickedObject.getId()]
        RestService.createWithAuth(requestUrl!, requestBody: dic) { response, error in
            if let error = error {
                ErrorAlert.show(error.message, controller: thisController, dismissViewController: false)
            } else if response != nil {
                completionHandler()
            }
        }
    }
    
    static func linkTo(object: RestObject, thisController: SysObjectViewController, completionHandler: () -> ()) {
        let clickedObject = Context.clickBoard
        let requestUrl = object.getLink(LinkRel.childLinks.rawValue)!
        let dic = ["href": clickedObject.getId()]
        RestService.createWithAuth(requestUrl, requestBody: dic) { response, error in
            if let error = error {
                ErrorAlert.show(error.message, controller: thisController, dismissViewController: false)
            } else if response != nil {
                completionHandler()
            }
        }
    }
}