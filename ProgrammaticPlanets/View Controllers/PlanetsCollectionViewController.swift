//
//  PlanetsCollectionViewController.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class PlanetsCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    let planetController = PlanetController()
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }

    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planetController.planets.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlanetCell", for: indexPath) as! PlanetCollectionViewCell

        let planet = planetController.planets[indexPath.item]
        
        cell.planet = planet
    
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSettings",
            let settingsVC = segue.destination as? SettingsViewController {
            
            settingsVC.delegate = self
        }
    }
    
}

extension PlanetsCollectionViewController: SettingsViewControllerDelegate {
    func dataChanged() {
        collectionView.reloadData()
    }
}
