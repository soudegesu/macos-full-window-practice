//
//  AppDelegate.swift
//  macos-full-window-practice
//
//  Created by soudegesu on 2022/01/20.
//

import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {

  var window: NSWindow!


  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Create the SwiftUI view that provides the window contents.
    let contentView = ContentView()

    // Create the window and set the content view.
    // 最大化して、非表示メニューでも消えないようにする
    window = NSWindow(
        contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
      styleMask: [.fullSizeContentView,],
        backing: .buffered, defer: false)
    if let frame = NSScreen.main?.frame {
      debugPrint("width: \(frame.width), height: \(frame.height)")
      window.setFrame(frame, display: true)
      window.setFrameTopLeftPoint(NSPoint(x: 0, y: frame.height))
    }
    window.canHide = false
    // 背景を透明にする
    window.isOpaque = false
    window.hasShadow = false
    window.backgroundColor = .clear
    // バーは非表示
    window.titlebarAppearsTransparent = true
    window.titleVisibility = .hidden
    // ウインドウがついて回るようにする
    window.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]
    window.level = .floating
    // 最前面にいてもクリックできるようにする
    window.ignoresMouseEvents = true
    window.isReleasedWhenClosed = false
    // 別スクリーンに移動した時にプロファイルを更新する
    window.displaysWhenScreenProfileChanges = true
    
    window.contentView = NSHostingView(rootView: contentView)
    window.makeKeyAndOrderFront(nil)
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }


}

