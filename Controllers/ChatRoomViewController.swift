//
//  ChatRoomViewController.swift
//  ChatAppWithFirebase
//
//  Created by Juri Ohto on 2021/05/24.
//

import UIKit

class ChatRoomViewController: UIViewController {
    
    private let cellId = "cellId"
    private var messages = [String]()
    
    private lazy var chatInputAccessoryView: ChatInputAccessoryView = {
        let view = ChatInputAccessoryView()
        view.frame = .init(x: 0, y: 0, width: view.frame.width, height: 100)
        view.delegate = self
        return view
    }()
    
    @IBOutlet weak var chatRoomTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        chatRoomTableView.delegate = self
        chatRoomTableView.dataSource = self
//registerで別ファイルで作ったChatRoomTableViewCelltと紐付ける
        chatRoomTableView.register(UINib(nibName: "ChatRoomTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
        chatRoomTableView.backgroundColor = .rgb(red: 118, green: 140, blue: 180)
    }
    
//    キーボードがViewに合わせて動くアニメーションが実装できる
    override var inputAccessoryView: UIView? {
        get {
            return chatInputAccessoryView
        }
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
}

extension ChatRoomViewController: ChatInputAccessoryViewDelegate {
    func tappedSendButton(text: String) {
        messages.append(text)
        chatInputAccessoryView.removeText()
        chatRoomTableView.reloadData()
        print("chatInputAccessoryViewDelegate text: ", text)
    }
    
    
}



extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource {
//    messageTaxtLabelの高さを最低20とし、メッセージの長さに応じて高さが自動的に変動するようにする
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        chatRoomTableView.estimatedRowHeight = 20
        return UITableView.automaticDimension
    }
//    セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatRoomTableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatRoomTableViewCell
//        cell.messageTextView.text = messages[indexPath.row]
        cell.messageText = messages[indexPath.row]
        return cell
    }
    
    
}
