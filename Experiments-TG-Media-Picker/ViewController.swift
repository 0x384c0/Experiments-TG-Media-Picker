//
//  ViewController.swift
//  Experiments-TG-Media-Picker
//
//  Created by 0x384c0 on 7/10/18.
//  Copyright © 2018 0x384c0. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let context = Context()
    weak var vc:TGMediaAssetsController?
    
    override func viewDidLoad() {
        LegacyComponentsGlobals.setProvider(ComponentsProvider())
    }
    
    
    @IBAction func pickAssetTap(_ sender: Any) {
        listSelectors(SSignal())
        vc = TGMediaAssetsController(context: context,
                                         assetGroup:nil,
                                         intent: TGMediaAssetsControllerSendMediaIntent,
                                         recipientName: "Test recipientName",
                                         saveEditedPhotos: false,
                                         allowGrouping: false)
        
        vc?.dismissalBlock = {[weak self] in
            self?.vc?.dismiss(animated: true)
        }
        vc?.completionBlock = {[weak self] signals in
            self?.vc?.dismiss(animated: true)
        }
        self.present(vc!, animated: true)
    }
    
    func listSelectors(_ obj:NSObject){
        var mc: UInt32 = 0
        let mcPointer = withUnsafeMutablePointer(to:&mc, { $0 })
        let mlist = class_copyMethodList(object_getClass(obj), mcPointer)!
        print("\(mc) methods")
        for i in 0...Int(mc) {
            print(String(format: "Method #%d: %s", arguments: [i, sel_getName(method_getName(mlist[i]))]))
        }
    }
    
}

class ComponentsProvider:NSObject,LegacyComponentsGlobalsProvider{
    func effectiveLocalization() -> TGLocalization! {
        return TGMediaLocalization()
    }
    
    func log(_ string: String!) {
        
    }
    
    func applicationWindows() -> [UIWindow]! {
        return UIApplication.shared.windows
    }
    
    func applicationStatusBarWindow() -> UIWindow! {
        return UIApplication.shared.keyWindow
    }
    
    func applicationKeyboardWindow() -> UIWindow! {
        return UIApplication.shared.keyWindow
    }
    
    func applicationInstance() -> UIApplication! {
        return UIApplication.shared
    }
    
    func applicationStatusBarOrientation() -> UIInterfaceOrientation {
        return UIInterfaceOrientation.portrait
    }
    
    func statusBarFrame() -> CGRect {
        return CGRect.zero
    }
    
    func isStatusBarHidden() -> Bool {
        return false
    }
    
    func setStatusBarHidden(_ hidden: Bool, with animation: UIStatusBarAnimation) {
        
    }
    
    func statusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.default
    }
    
    func setStatusBarStyle(_ statusBarStyle: UIStatusBarStyle, animated: Bool) {
        
    }
    
    func forceStatusBarAppearanceUpdate() {
        
    }
    
    func canOpen(_ url: URL!) -> Bool {
        return true
    }
    
    func open(_ url: URL!) {
        
    }
    
    func openURLNative(_ url: URL!) {
        
    }
    
    func disableUserInteraction(for timeInterval: TimeInterval) {
        
    }
    
    func setIdleTimerDisabled(_ value: Bool) {
        
    }
    
    func pauseMusicPlayback() {
        
    }
    
    func dataCachePath() -> String! {
        return nil
    }
    
    func accessChecker() -> LegacyComponentsAccessChecker! {
        return nil
    }
    
    func stickerPacksSignal() -> SSignal! {
        return nil
    }
    
    func maskStickerPacksSignal() -> SSignal! {
        return nil
    }
    
    func recentStickerMasksSignal() -> SSignal! {
        return nil
    }
    
    func request(_ type: TGAudioSessionType, interrupted: (() -> Void)!) -> SDisposable! {
        return nil
    }
    
    func currentWallpaperInfo() -> TGWallpaperInfo! {
        return nil
    }
    
    func currentWallpaperImage() -> UIImage! {
        return nil
    }
    
    func sharedMediaImageProcessingThreadPool() -> SThreadPool! {
        return nil
    }
    
    func sharedMediaMemoryImageCache() -> TGMemoryImageCache! {
        return nil
    }
    
    func squarePhotoThumbnail(_ imageAttachment: TGImageMediaAttachment!, of size: CGSize, threadPool: SThreadPool!, memoryCache: TGMemoryImageCache!, pixelProcessingBlock: ((UnsafeMutableRawPointer?, Int32, Int32, Int32) -> Void)!, downloadLargeImage: Bool, placeholder: SSignal!) -> SSignal! {
        return nil
    }
    
    func localDocumentDirectory(forLocalDocumentId localDocumentId: Int64, version: Int32) -> String! {
        return nil
    }
    
    func localDocumentDirectory(forDocumentId documentId: Int64, version: Int32) -> String! {
        return nil
    }
    
    func json(forHttpLocation httpLocation: String!) -> SSignal! {
        return nil
    }
    
    func data(forHttpLocation httpLocation: String!) -> SSignal! {
        return nil
    }
    
    func makeHTTPRequestOperation(with request: URLRequest!) -> (Operation & LegacyHTTPRequestOperation)! {
        return nil
    }
    
    func pausePictureInPicturePlayback() {
        
    }
    
    func resumePictureInPicturePlayback() {
        
    }
    
    func maybeReleaseVolumeOverlay() {
        
    }
    
    
    func dataStoragePath() -> String{
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!.absoluteString
    }
}

class Context:NSObject,LegacyComponentsContext{
    func safeAreaInset() -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func fullscreenBounds() -> CGRect {
        return UIApplication.shared.keyWindow!.frame
    }
    
    func keyCommandController() -> TGKeyCommandController! {
        return nil
    }
    
    func statusBarFrame() -> CGRect {
        return CGRect.zero
    }
    
    func isStatusBarHidden() -> Bool {
        return false
    }
    
    func setStatusBarHidden(_ hidden: Bool, with animation: UIStatusBarAnimation) {
        
    }
    
    func forceSetStatusBarHidden(_ hidden: Bool, with animation: UIStatusBarAnimation) {
        
    }
    
    func statusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.default
    }
    
    func setStatusBarStyle(_ statusBarStyle: UIStatusBarStyle, animated: Bool) {
        
    }
    
    func forceStatusBarAppearanceUpdate() {
        
    }
    
    func applicationStatusBarAlpha() -> CGFloat {
        return 1
    }
    
    func setApplicationStatusBarAlpha(_ alpha: CGFloat) {
        
    }
    
    func animateApplicationStatusBarAppearance(_ statusBarAnimation: Int32, delay: TimeInterval, duration: TimeInterval, completion: (() -> Void)!) {
        
    }
    
    func animateApplicationStatusBarAppearance(_ statusBarAnimation: Int32, duration: TimeInterval, completion: (() -> Void)!) {
        
    }
    
    func animateApplicationStatusBarStyleTransition(withDuration duration: TimeInterval) {
        
    }
    
    func rootCallStatusBarHidden() -> Bool {
        return false
    }
    
    func currentlyInSplitView() -> Bool {
        return false
    }
    
    func currentSizeClass() -> UIUserInterfaceSizeClass {
        return UIUserInterfaceSizeClass.regular
    }
    
    func currentHorizontalSizeClass() -> UIUserInterfaceSizeClass {
        return UIUserInterfaceSizeClass.regular
    }
    
    func currentVerticalSizeClass() -> UIUserInterfaceSizeClass {
        return UIUserInterfaceSizeClass.regular
    }
    
    func sizeClassSignal() -> SSignal! {
        return nil
    }
    
    func canOpen(_ url: URL!) -> Bool {
        return true
    }
    
    func open(_ url: URL!) {
        
    }
    
    func serverMediaData(forAssetUrl url: String!) -> [AnyHashable : Any]! {
        return nil
    }
    
    func presentActionSheet(_ actions: [LegacyComponentsActionSheetAction]!, view: UIView!, completion: ((LegacyComponentsActionSheetAction?) -> Void)!) {
    }
    
    func makeOverlayWindowManager() -> LegacyComponentsOverlayWindowManager! {
        return OverlayWindowManager(context:self)
    }
    
    
}

class TGMediaLocalization:TGLocalization{
    override func get(_ key: String?) -> String? {
        return key?.localized
    }
}

class OverlayWindowManager:NSObject,LegacyComponentsOverlayWindowManager{
    let _context:LegacyComponentsContext
    init(context:LegacyComponentsContext){
        _context = context
    }
    
    func context() -> LegacyComponentsContext! {
        return _context
    }
    
    func bindController(_ controller: UIViewController!) {
        
    }
    
    func managesWindow() -> Bool {
        return false;
    }
    
    func setHidden(_ hidden: Bool, window: UIWindow!) {
        window.isHidden = hidden
    }
    
}

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}

