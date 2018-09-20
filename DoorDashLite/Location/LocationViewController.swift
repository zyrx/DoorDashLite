//
//  LocationViewController.swift
//  DoorDashLite
//
//  Created by Lech H. Conde on 18/09/2018.
//  Copyright © 2018 Lech H. Conde. All rights reserved.
//

import UIKit
import MapKit

protocol LocationViewControllerDelegate {
    func didChangeSelectedLocation(with location: Location)
}

class LocationViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    
    var delegate: LocationViewControllerDelegate?
    var locationViewModel: LocationViewable = LocationViewModel()
    
    var annotation: Annotation? {
        didSet {
            self.addressLabel.text = nil
            self.addressLabel.isHidden = true
            guard let annotation = self.annotation else { return }
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotation(annotation)
            annotation.address.bind { [weak self] address in
                self?.addressLabel.text = address
                self?.addressLabel.isHidden = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationViewModel.currentLocation.bind { [weak self] location in
            guard self?.locationViewModel.selectedLocation.value == nil,
                let location = location else { return }
            self?.annotation = Annotation(with: location)
            self?.centerMapOnLocation(location.cllocation)
        }
        
        locationViewModel.selectedLocation.bind { [weak self] location in
            guard let location = location else { return }
            self?.centerMapOnLocation(location.cllocation)
            if let annotations = self?.mapView.annotations {
                self?.mapView.removeAnnotations(annotations)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func confirmAddressAction(_ sender: Any) {
        if let location = self.annotation?.location {
            locationViewModel.selectedLocation.value = location
            delegate?.didChangeSelectedLocation(with: location)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func centerMapOnLocation(_ location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(
            location.coordinate,
            locationViewModel.regionRadius * 2.0,
            locationViewModel.regionRadius * 2.0
        )
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

extension LocationViewController: ReusableView { }

extension LocationViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let location = Location(lat: mapView.centerCoordinate.latitude, lng: mapView.centerCoordinate.longitude)
        mapView.removeAnnotations(mapView.annotations)
        annotation = Annotation(with: location)
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
        switch newState {
        case .starting:
            view.dragState = .dragging
        case .ending, .canceling:
            view.dragState = .none
        default: break
        }
    }
}
