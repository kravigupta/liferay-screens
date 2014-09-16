//
//  AssetListViewController.swift
//  Liferay-iOS-Widgets-Swift-Sample
//
//  Created by jmWork on 11/09/14.
//  Copyright (c) 2014 Liferay. All rights reserved.
//

import UIKit


public class AssetListViewController: UIViewController, AssetListWidgetDelegate {

	@IBOutlet weak var widget: AssetListWidget?

    override public func viewDidLoad() {
        super.viewDidLoad()

        widget!.delegate = self
    }

	@IBAction func loadAction(sender: AnyObject) {
		LiferayContext.instance().createSession("jose.navarro@liferay.com", password: "jm")
		widget!.loadList()
	}

	public func onAssetListResponse(entries:[AssetEntry]) {
		println("Loaded \(entries.count) entries")
		for e in entries {
			println("      \(e.title)")
		}
	}

	public func onAssetListError(error: NSError) {
	}

	public func onAssetSelected(entry:AssetEntry) {
		println("selected \(entry.title)")
	}

}
