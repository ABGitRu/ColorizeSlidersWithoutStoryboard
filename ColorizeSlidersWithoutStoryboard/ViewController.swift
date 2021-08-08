//
//  ViewController.swift
//  ColorizeSlidersWithoutStoryboard
//
//  Created by Mac on 06.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var colorScreen: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 5
        view.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return view
    }()
    
    var redSlider: UISlider!
    var greenSlider: UISlider!
    var blueSlider: UISlider!
    
    var redLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Red slider value: 0"
        label.font = UIFont(name: "Apple SD Gothic Neo SemiBold", size: 20)
        label.layer.shadowOpacity = 0.5
        label.layer.shadowRadius = 5
        label.textColor = .red
        return label
    }()
    
    var greenLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Green slider value: 0"
        label.font = UIFont(name: "Apple SD Gothic Neo SemiBold", size: 20)
        label.layer.shadowOpacity = 0.5
        label.layer.shadowRadius = 5
        label.textColor = .green
        return label
    }()
    
    var blueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Blue slider value: 0"
        label.font = UIFont(name: "Apple SD Gothic Neo SemiBold", size: 20)
        label.layer.shadowOpacity = 0.5
        label.layer.shadowRadius = 5
        label.textColor = .blue
        return label
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSliders()
        setupViews()
        setupConstraints()
    }
    
    @objc private func sliderChanged() {
        colorScreen.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        let redValue = Int(roundf(redSlider.value * 255))
        let greenValue = Int(roundf(greenSlider.value * 255))
        let blueValue = Int(roundf(blueSlider.value * 255))
        redLabel.text = "Red slider value: \(redValue)"
        greenLabel.text = "Green slider value: \(greenValue)"
        blueLabel.text = "Blue slider value: \(blueValue)"
    }
    
    private func setupSlider() -> UISlider {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        return slider
    }
    
    private func setupSliders() {
        blueSlider = setupSlider()
        greenSlider = setupSlider()
        redSlider = setupSlider()
        redSlider.thumbTintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        greenSlider.thumbTintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        blueSlider.thumbTintColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
    }
    
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        view.addSubview(colorScreen)
        view.addSubview(redSlider)
        view.addSubview(greenSlider)
        view.addSubview(blueSlider)
        view.addSubview(redLabel)
        view.addSubview(greenLabel)
        view.addSubview(blueLabel)
    }
    
    private func setupConstraints() {
        
        let constraints = [
            colorScreen.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            colorScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            colorScreen.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            colorScreen.heightAnchor.constraint(equalToConstant: 100),
            
            redSlider.topAnchor.constraint(equalTo: colorScreen.bottomAnchor, constant: 40),
            redSlider.leadingAnchor.constraint(equalTo: colorScreen.leadingAnchor),
            redSlider.trailingAnchor.constraint(equalTo: colorScreen.trailingAnchor),
            
            greenSlider.topAnchor.constraint(equalTo: redSlider.bottomAnchor, constant: 30),
            greenSlider.leadingAnchor.constraint(equalTo: colorScreen.leadingAnchor),
            greenSlider.trailingAnchor.constraint(equalTo: colorScreen.trailingAnchor),
            
            blueSlider.topAnchor.constraint(equalTo: greenSlider.bottomAnchor, constant: 30),
            blueSlider.leadingAnchor.constraint(equalTo: colorScreen.leadingAnchor),
            blueSlider.trailingAnchor.constraint(equalTo: colorScreen.trailingAnchor),
            
            redLabel.topAnchor.constraint(equalTo: blueSlider.bottomAnchor, constant: 40),
            redLabel.leadingAnchor.constraint(equalTo: colorScreen.leadingAnchor),
            redLabel.trailingAnchor.constraint(equalTo: colorScreen.trailingAnchor),
            
            greenLabel.topAnchor.constraint(equalTo: redLabel.bottomAnchor, constant: 30),
            greenLabel.leadingAnchor.constraint(equalTo: colorScreen.leadingAnchor),
            greenLabel.trailingAnchor.constraint(equalTo: colorScreen.trailingAnchor),
            
            blueLabel.topAnchor.constraint(equalTo: greenLabel.bottomAnchor, constant: 30),
            blueLabel.leadingAnchor.constraint(equalTo: colorScreen.leadingAnchor),
            blueLabel.trailingAnchor.constraint(equalTo: colorScreen.trailingAnchor),
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

}

