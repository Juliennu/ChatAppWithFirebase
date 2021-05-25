//
//  ChatInputAccessoryView.swift
//  ChatAppWithFirebase
//
//  Created by Juri Ohto on 2021/05/24.
//

import UIKit

//xibファイルのFile's Ownerと紐付けをする
class ChatInputAccessoryView: UIView {
    
    
    @IBOutlet weak var chatTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
         
        nibInit()
        setUpViews()
        autoresizingMask = .flexibleHeight
    }
    
//    chatTextView（メッセージ入力欄）とsendButtonの設定
    private func setUpViews() {
        chatTextView.layer.cornerRadius = 15
        chatTextView.layer.borderColor = UIColor.rgb(red: 230, green: 230, blue: 230).cgColor
        chatTextView.layer.borderWidth = 1
        
        sendButton.layer.cornerRadius = 15
        sendButton.imageView?.contentMode = .scaleAspectFill//imageにaspect fillを設定
        sendButton.contentHorizontalAlignment = .fill
        sendButton.contentVerticalAlignment = .fill
        sendButton.isEnabled = false//初期の状態でボタンを押せないようにする
    }
//chatTextView（メッセージ入力欄）の高さを文字数によって変動させる
    override var intrinsicContentSize: CGSize {
        return .zero
    }
    
    
    
    
    
    
    private func nibInit() {
        let nib = UINib(nibName: "ChatInputAccessoryView", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return
            
        }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
        
        
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
