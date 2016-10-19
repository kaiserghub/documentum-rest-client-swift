//
//  ItemTableViewCell.swift
//  RestClient
//
//  Created by Song, Michyo on 3/29/16.
//  Copyright © 2016 EMC Corporation. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var fileNameLabel: UILabel!
    @IBOutlet weak var thumbnailPhotoImageView: UIImageView!
    @IBOutlet weak var fileTypeLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    
    func initCell(filename: String, fileType: String) {
        fileNameLabel.text = filename
        if let image = UIImage(named: fileType) {
            thumbnailPhotoImageView.image = image
        } else {
            thumbnailPhotoImageView.image = UIImage(named: "SysObject")
        }
    }
    
    func initCell(object: RestObject) {
        initCell(object.getName(), fileType: object.getType())
    }
}
