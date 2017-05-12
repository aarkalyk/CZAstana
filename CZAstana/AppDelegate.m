//
//  AppDelegate.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/3/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "VacanciesViewController.h"
#import "MenuViewController.h"
#import "UIColor+CZColor.h"
#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    MenuViewController *menuVC  = [MenuViewController new];
    menuVC.title = @"Menu";
    UINavigationController *navigationController1 = [[UINavigationController alloc] initWithRootViewController:menuVC];
    [navigationController1.navigationBar setTranslucent:NO];
    navigationController1.navigationBar.barTintColor = [UIColor mainGreenColor];
    navigationController1.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                                               [UIColor whiteColor], NSForegroundColorAttributeName,
                                                               [UIFont fontWithName:@"ArialMT" size:16.0], NSFontAttributeName,nil];
    navigationController1.navigationBar.tintColor = [UIColor whiteColor];
    
    VacanciesViewController *vacanciesVC = [VacanciesViewController new];
    vacanciesVC.title = @"Vacancies";
    UINavigationController *navigationController2 = [[UINavigationController alloc] initWithRootViewController:vacanciesVC];
    [navigationController2.navigationBar setTranslucent:NO];
    navigationController2.navigationBar.barTintColor = [UIColor mainGreenColor];
    navigationController2.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                                               [UIColor whiteColor], NSForegroundColorAttributeName,
                                                               [UIFont fontWithName:@"ArialMT" size:16.0], NSFontAttributeName,nil];
    navigationController2.navigationBar.tintColor = [UIColor whiteColor];
    
    self.tabBarController = [UITabBarController new];
    NSArray<UIViewController *> *controllers = [[NSArray alloc] initWithObjects: menuVC, navigationController1, navigationController2, nil];
    self.tabBarController.viewControllers = controllers;
    UITabBarItem *item = self.tabBarController.tabBar.items[0];
    item.title = @"MENU";
    item.image = [UIImage imageNamed:@"home.png"];
    UITabBarItem *item1 = self.tabBarController.tabBar.items[1];
    item1.title = @"FAVORITE";
    item1.image = [UIImage imageNamed:@"star.png"];
    self.tabBarController.tabBar.barTintColor = [UIColor mainGreenColor];
    self.tabBarController.tabBar.shadowImage = [UIImage new];
    self.tabBarController.tabBar.tintColor = [UIColor yellowColor];
    self.tabBarController.tabBar.unselectedItemTintColor = [UIColor whiteColor];
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
