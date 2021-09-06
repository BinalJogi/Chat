//
//  ChatViewController.swift
//  Chat
//
//  Created by Binal on 06/09/2021.
//

import UIKit
import MessageKit

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
    
   
}

struct Sender: SenderType {
   
    var senderId: String
    var displayName: String
    
    
}

class ChatViewController: MessagesViewController {
     private var messages = [Message]()
    private var selfSender = Sender(senderId: "1",
                                    displayName: "Binal Jogi")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messages.append(Message(sender: selfSender,
                                messageId: "1",
                                sentDate: Date(),
                                kind: .text("Hello")))
        messages.append(Message(sender: selfSender,
                                messageId: "1",
                                sentDate: Date(),
                                kind: .text("Hello World")))


        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
    
}
extension ChatViewController: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate{
    func currentSender() -> SenderType {
        return selfSender
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
    
}
//class ChatViewController: MessagesViewController {
//
//    @IBOutlet weak var tblChat: UITableView!
//    @IBOutlet weak var txtField: UITextField!
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    @IBAction func btnSend(_ sender: Any) {
//
//    }
//}

//extension ChatViewController: UITableViewDelegate , UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 50
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UITableViewCell
//            else {
//            return UITableViewCell()
//        }
//
//        cell.textLabel?.text = "Binal"
//
//
//        return cell
//    }
//
//
//}
