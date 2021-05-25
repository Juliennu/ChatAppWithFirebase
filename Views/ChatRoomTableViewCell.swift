//
//  ChatRoomTableViewCell.swift
//  ChatAppWithFirebase
//
//  Created by Juri Ohto on 2021/05/24.
//

import UIKit

class ChatRoomTableViewCell: UITableViewCell {
    
    var messageText: String? {
        didSet {
            guard  let text = messageText else { return }
            let width = estimateFrameForTextView(text: text).width + 20
            
            messageTextViewWidthConstraint.constant = width
            messageTextView.text = text
        }
    }
    
    
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var messageTextView: UITextView!
    
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBOutlet weak var messageTextViewWidthConstraint: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        userImageView.layer.cornerRadius = 30
        messageTextView.layer.cornerRadius = 15
        

        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
//    Message Text Viewの大きさの最大値を定義し、文字数に合わせて変動的にする
    private func estimateFrameForTextView(text: String) -> CGRect{
        let size = CGSize(width: 200, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], context: nil)
    }
    
    
    
    
    
}
