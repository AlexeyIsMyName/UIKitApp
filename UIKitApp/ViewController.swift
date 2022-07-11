//
//  ViewController.swift
//  UIKitApp
//
//  Created by ALEKSEY SUSLOV on 10.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Segmented Control
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        // Slider
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        
        // Label
        mainLabel.text = """
        Label
        \(slider.value)
        """
        mainLabel.font = mainLabel.font.withSize(35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        // Button
        doneButton.tintColor = mainLabel.textColor
        doneButton.backgroundColor = segmentedControl.backgroundColor
        doneButton.layer.cornerRadius = 5
        
        // Date Picker
        datePicker.locale = Locale(identifier: "ru_RU")
    }

    
    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .blue
        case 2:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .yellow
        default: break
        }
    }
    
    @IBAction func sliderAction() {
        mainLabel.text = """
        Label
        \(slider.value)
        """
        
        let alphaValue = CGFloat(slider.value)
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(alphaValue)
    }
    
    @IBAction func doneButtonPressed() {
        guard let inputText = textField.text, !inputText.isEmpty else {
            showAlert(with: "Ошибка ввода", and: "текстовое поле пустое, введите свое имя")
            return
        }
        
        if let _ = Double(inputText) {
            showAlert(with: "Ошибка ввода", and: "ввели число, введите свое имя")
            return
        }
        
        mainLabel.text = """
        Ваше имя:
        \(inputText)
        """
    }
    
    @IBAction func datePickerAction() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "ru_RU")
        mainLabel.text = dateFormatter.string(from: datePicker.date)
    }
}

// MARK: - Alert Controller
extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok",
                                     style: .default) { _ in
            self.textField.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

