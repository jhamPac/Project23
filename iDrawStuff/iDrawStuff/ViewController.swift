//
//  ViewController.swift
//  iDrawStuff
//
//  Created by jhampac on 2/12/16.
//  Copyright © 2016 jhampac. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var currentDrawType = 0
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func redrawTapped(sender: UIButton)
    {
        currentDrawType += 1
        
        if currentDrawType > 5
        {
            currentDrawType = 0
        }
        
        switch currentDrawType {
        case 0:
            drawRectangle()
            
        default:
            break
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        drawRectangle()
    }
    
    func drawRectangle()
    {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 512, height: 512), false, 0)
        let context = UIGraphicsGetCurrentContext()
        
        let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512)
        
        CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextSetStrokeColorWithColor(context, UIColor.greenColor().CGColor)
        CGContextSetLineWidth(context, 10)
        
        CGContextAddRect(context, rectangle)
        CGContextDrawPath(context, .FillStroke)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        imageView.image = img
    }
}

