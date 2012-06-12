//
//  AppDelegate.h
//  MenuLevel
//
//  Created by Danilo Priore on 10/06/12.
//  Copyright Prioregroup.com 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
