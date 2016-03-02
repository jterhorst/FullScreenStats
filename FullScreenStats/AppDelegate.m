//
//  AppDelegate.m
//  FullScreenStats
//
//  Created by Jason Terhorst on 3/1/16.
//  Copyright © 2016 Jason Terhorst. All rights reserved.
//

#import "AppDelegate.h"
#import <WebKit/WebKit.h>

@interface AppDelegate ()

@property (nonatomic, strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    _window = [[NSWindow alloc] initWithContentRect:[[NSScreen screens] lastObject].frame styleMask:NSBorderlessWindowMask backing:NSBackingStoreBuffered defer:NO screen:[[NSScreen screens] lastObject]];
    [_window makeKeyAndOrderFront:nil];
    _window.backgroundColor = [NSColor blackColor];
    [_window setFrame:[[NSScreen screens] lastObject].frame display:YES];
    _window.level = NSStatusWindowLevel + 1;
    
    WebView * webview = [[WebView alloc] initWithFrame:_window.contentView.bounds];
    [_window.contentView addSubview:webview];
    [[webview mainFrame] loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://google.com"]]];
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
