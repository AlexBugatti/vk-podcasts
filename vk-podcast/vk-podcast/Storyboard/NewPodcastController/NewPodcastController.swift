//
//  NewPodcastController.swift
//  vk-podcast
//
//  Created by Александр on 16.09.2020.
//  Copyright © 2020 AlexBugatti. All rights reserved.
//

import UIKit
import AVFoundation

class NewPodcastController: UIViewController {

    var url: URL?
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    private var pickerController: UIImagePickerController!
    
    private lazy var inputPodcastView: InputPodcastView = {
        var view = InputPodcastView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    private lazy var uploadView: UploadPodcastView = {
        var view = UploadPodcastView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    private var podcastView: PodcastView = {
        var view = PodcastView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        view.alpha = 0
        
        return view
    }()
    
    private var observers = [NSObjectProtocol]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        registerKeyboardNotifications()
        self.navigationItem.title = "Новый подкаст"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        unregisterKeyboardNotifications()
        self.navigationItem.title = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyboardWhenTappedAround()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        self.navigationController?.navigationBar.showSeparateView()
          
        self.inputPodcastView.didActionTapped = {
            self.presentPicker(from: self.inputPodcastView)
        }
        self.uploadView.didUploadTapped = {
            DispatchQueue.main.async {
                self.showDocumentController()
            }
        }
        
        self.podcastView.didUploadAction = {
            DispatchQueue.main.async {
                self.showDocumentController()
            }
        }
        self.podcastView.didEditAction = {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "toEdit", sender: self.url)
            }
        }
        
        let checkbox = CheckboxPodcastView()
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        
        self.stackView.addArrangedSubview(inputPodcastView)
        self.stackView.addArrangedSubview(uploadView)
        self.stackView.addArrangedSubview(podcastView)
        self.stackView.addArrangedSubview(checkbox)
    }
    
    func showDocumentController() {
        let documentProvider = UIDocumentPickerViewController(documentTypes: ["public.audio"], in: .import)
        documentProvider.delegate = self

        self.present(documentProvider, animated: true, completion: nil)
    }
    
    func onDidSelectedAudioURL(_ url: URL) {
        self.url = url
        let info = self.prepareAudioInfo(url: url)
        self.podcastView.setup(title: info.0, duration: info.1)
        
        UIView.animate(withDuration: 0.1, animations: {
            self.uploadView.alpha = 0
        }) { (complete) in
            self.uploadView.isHidden = true
            self.podcastView.isHidden = false
            UIView.animate(withDuration: 0.3) {
                self.podcastView.alpha = 1
            }
        }
    }
    
    func prepareAudioInfo(url: URL) -> (String, String) {
        let asset = AVAsset(url: url)
        let duration = Int(asset.duration.seconds).toDateString()
        let title = url.lastPathComponent
        
        return (title, String(duration))
    }
    
    func createPodcast() -> Podcast? {
        
        if let info = self.inputPodcastView.getInfo(), let url = self.url {
            let podcast = Podcast(title: info.1, description: info.2, image: info.0, url: url)
            
            return podcast
        }
        
        let alert = UIAlertController(title: "Не все данные заполнены", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
        
        return nil
    }
    
    @IBAction func onDidNextTapped(_ sender: Any) {
        if let podcast = self.createPodcast() {
            self.performSegue(withIdentifier: "toPrepare", sender: nil)
        }
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toEdit", let vc = segue.destination as? EditPodcastController {
            vc.url = sender as? URL
        }
    }


}

extension NewPodcastController {
    
    // MARK: - Keyboard Observations
    
    func registerKeyboardNotifications() {
        let center = NotificationCenter.default
        
        let willShowObserver = center.addObserver(with: UIViewController.keyboardWillShow) { payload in
            self.bottomConstraint.constant = -payload.endFrame.height
            UIView.animate(withDuration: 0.2, animations: {
                self.view.layoutIfNeeded()
            }) { (success) in
//                self.scrollView.contentOffset = CGPoint(x: self.scrollView.contentOffset.x,
//                                                        y: self.scrollView.contentOffset.y + 20)
            }
        }
        
        let willHideObserver = center.addObserver(with: UIViewController.keyboardWillHide) { payload in
            self.bottomConstraint.constant = 8
            UIView.animate(withDuration: 0.2, animations: { self.view.layoutIfNeeded() })
        }
        
        observers = [willShowObserver, willHideObserver]
    }
    
    func unregisterKeyboardNotifications() {
        observers.forEach({ NotificationCenter.default.removeObserver($0) })
    }
}

extension NewPodcastController: UIDocumentPickerDelegate {
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        if let url = urls.first {
            self.onDidSelectedAudioURL(url)
        }
        print(urls)
    }
    
}

extension NewPodcastController: UIImagePickerControllerDelegate {
    
    private func action(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
        guard UIImagePickerController.isSourceTypeAvailable(type) else {
            return nil
        }

        let action = UIAlertAction(title: title, style: .default) { (action) in
            self.showImagePicker(type: type)
        }
        
       return action
    }
    
    func showImagePicker(type: UIImagePickerController.SourceType) {
        self.pickerController = UIImagePickerController()
        self.pickerController.sourceType = type
        self.pickerController.delegate = self
        self.pickerController.allowsEditing = true
        self.pickerController.mediaTypes = ["public.image"]
        self.present(self.pickerController, animated: true)
    }

    public func presentPicker(from sourceView: UIView) {

        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        if let action = self.action(for: .camera, title: "Сделать фото") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .savedPhotosAlbum, title: "Камера") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .photoLibrary, title: "Галерея") {
            alertController.addAction(action)
        }

        alertController.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))

        if UIDevice.current.userInterfaceIdiom == .pad {
            alertController.popoverPresentationController?.sourceView = sourceView
            alertController.popoverPresentationController?.sourceRect = sourceView.bounds
            alertController.popoverPresentationController?.permittedArrowDirections = [.down, .up]
        }

        self.present(alertController, animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.inputPodcastView.setImage(chosenImage)
        
        picker.dismiss(animated:true, completion: nil)
    }

    
}

extension NewPodcastController: UINavigationControllerDelegate {}
