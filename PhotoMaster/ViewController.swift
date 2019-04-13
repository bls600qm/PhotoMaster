//
//  ViewController.swift
//  PhotoMaster
//
//  Created by Rika Sumitomo on 2019/04/13.
//  Copyright © 2019 Rika Sumitomo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func onTappedCameraButton() {
        presentPickerController(sourceType: .camera)
    }
    
    @IBAction func onTappedAlbumButton() {
        presentPickerController(sourceType: .photoLibrary)
    }
    
    //カメラ，アルバムの呼び出しメソッド
    func presentPickerController(sourceType: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
        }
    }
    //写真が選択されたときに呼ばれるメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        self.dismiss(animated: true, completion: nil)
        photoImageView.image = info[.originalImage] as? UIImage //画像を出力
    }
    
    //元の画像にテキストを合成するメソッド
    func drawText(image: UIImage) -> UIImage {
        
        let text = "LifeisTech!"
        
        //文字の特性　せってい
        let textFontAttributes = [NSAttributedString.Key.font: UIFont(name: "Arial", size: 120)!, NSAttributedString.Key.foregroundColor: UIColor.red]
        
        //Graphicコンテキスト編集開始
        UIGraphicsBeginImageContext(image.size)
        
        let margin: CGFloat = 5.0
        let textRect = CGRect(x: margin, y: margin, width: image.size.width - margin, height: image.size.height - margin)
        
        image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        text.draw(in: textRect, withAttributes: textFontAttributes)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    //元の画像にイラストを合成するメソッド
    func drawMaskImage(image: UIImage) -> UIImage {
        
        let maskImage = UIImage(named: "sakura")
        
        UIGraphicsBeginImageContext(image.size)
        
        image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        
        let margin: CGFloat = 50.0
        
        let maskRect = CGRect(x: image.size.width - (maskImage?.size.width)! - margin,
                              y: image.size.height - (maskImage?.size.height)! - margin,
                              width: (maskImage?.size.width)!,
                              height: (maskImage?.size.height)!)
        
        maskImage?.draw(in: maskRect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    //画像がなかった時のために　テキスト
    @IBAction func onTappedTextButton() {
        if photoImageView.image != nil {
            photoImageView.image = drawText(image: photoImageView.image!)
        } else {
            print("画像がありません")
        }
    }
     //画像がなかった時のために いらすと
    @IBAction func onTappedIllustButton() {
        if photoImageView.image != nil {
            photoImageView.image = drawMaskImage(image: photoImageView.image!)
        } else {
            print("画像がありません")
        }
    }


}

