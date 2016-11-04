//
//  AppDelegate.h
//  FMFA7
//
//  Created by Web Libre Consulting on 03/11/2016.
//  Copyright © 2016 Belzanti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

