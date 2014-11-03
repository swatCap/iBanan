//
//  AppDelegate.h
//  banan
//
//  Created by Artem Tkachuk on 11/3/14.
//  Copyright (c) 2014 Artem Tkachuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMDrawerController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (MMDrawerController *)createSideMenuController;

@end

