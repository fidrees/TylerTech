//
//  UserMapViewController.swift
//  TylerTech
//
//  Created by Fahad Idrees on 2019-04-28.
//  Copyright © 2019 Fahad Idrees. All rights reserved.
//

import UIKit
import MapKit

class UserMapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var userLocations: UILabel!
    var viewModel:UserMapVCViewModel?

    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView.delegate = self
        updateUI()
    }
    
    // MARK: - Private methods
    private func updateUI() {
        if let viewModel = viewModel {
            let location = CLLocation(latitude: viewModel.userLatitude, longitude: viewModel.userLongitude)
            let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.coordinate
            annotation.title = viewModel.userName
            mapView.addAnnotation(annotation)
            
            //Fetch and show countries user visited before
            viewModel.fetchUserPreviousCountriesLocation(completionHandler: {[weak self] (userPreviousCountries) in
                guard let self = self else {
                    return
                }
                self.userLocations.text = userPreviousCountries.joined(separator: ", ")
            })
        }
    }
}
