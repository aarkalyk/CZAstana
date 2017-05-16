//
//  AppDelegate.m
//  CZAstana
//
//  Created by ARKALYK AKASH on 5/3/17.
//  Copyright © 2017 ARKALYK AKASH. All rights reserved.
//

#import "VacanciesViewController.h"
#import "MenuViewController.h"
#import "NewsViewController.h"
#import "UIColor+CZColor.h"
#import "UIImage+CZImage.h"
#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    MenuViewController *menuVC  = [MenuViewController new];
    //menuVC.title = @"Menu";
    UINavigationController *navigationController1 = [[UINavigationController alloc] initWithRootViewController:menuVC];
    [navigationController1.navigationBar setTranslucent:NO];
    navigationController1.navigationBar.barTintColor = [UIColor mainGreenColor];
    navigationController1.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                                               [UIColor whiteColor], NSForegroundColorAttributeName,
                                                               [UIFont fontWithName:@"ArialMT" size:16.0], NSFontAttributeName,nil];
    navigationController1.navigationBar.tintColor = [UIColor whiteColor];
    
    VacanciesViewController *vacanciesVC = [VacanciesViewController new];
    //vacanciesVC.title = @"Vacancies";
    UINavigationController *navigationController2 = [[UINavigationController alloc] initWithRootViewController:vacanciesVC];
    [navigationController2.navigationBar setTranslucent:NO];
    navigationController2.navigationBar.barTintColor = [UIColor mainGreenColor];
    navigationController2.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                                               [UIColor whiteColor], NSForegroundColorAttributeName,
                                                               [UIFont fontWithName:@"ArialMT" size:16.0], NSFontAttributeName,nil];
    navigationController2.navigationBar.tintColor = [UIColor whiteColor];
    
    NewsViewController *newsVC = [NewsViewController new];
    //newsVC.title = @"News";
    UINavigationController *navigationController3 = [[UINavigationController alloc] initWithRootViewController:newsVC];
    [navigationController3.navigationBar setTranslucent:NO];
    navigationController3.navigationBar.barTintColor = [UIColor mainGreenColor];
    navigationController3.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                                               [UIColor whiteColor], NSForegroundColorAttributeName,
                                                               [UIFont fontWithName:@"ArialMT" size:16.0], NSFontAttributeName,nil];
    navigationController3.navigationBar.tintColor = [UIColor whiteColor];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[UIViewController new]];
    [navigationController.navigationBar setTranslucent:NO];
    navigationController.navigationBar.barTintColor = [UIColor mainGreenColor];
    navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                                               [UIColor whiteColor], NSForegroundColorAttributeName,
                                                               [UIFont fontWithName:@"ArialMT" size:16.0], NSFontAttributeName,nil];
    navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    UINavigationController *navigationController4 = [[UINavigationController alloc] initWithRootViewController:[UIViewController new]];
    [navigationController4.navigationBar setTranslucent:NO];
    navigationController4.navigationBar.barTintColor = [UIColor mainGreenColor];
    navigationController4.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                                               [UIColor whiteColor], NSForegroundColorAttributeName,
                                                               [UIFont fontWithName:@"ArialMT" size:16.0], NSFontAttributeName,nil];
    navigationController4.navigationBar.tintColor = [UIColor whiteColor];
    
    UINavigationController *navigationController5 = [[UINavigationController alloc] initWithRootViewController:[UIViewController new]];
    [navigationController5.navigationBar setTranslucent:NO];
    navigationController5.navigationBar.barTintColor = [UIColor mainGreenColor];
    navigationController5.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                                               [UIColor whiteColor], NSForegroundColorAttributeName,
                                                               [UIFont fontWithName:@"ArialMT" size:16.0], NSFontAttributeName,nil];
    navigationController5.navigationBar.tintColor = [UIColor whiteColor];
    
    self.tabBarController = [UITabBarController new];
    NSArray<UIViewController *> *controllers = [[NSArray alloc] initWithObjects: menuVC, navigationController, navigationController2, navigationController3, navigationController4, nil];
    self.tabBarController.viewControllers = controllers;
    UITabBarItem *item = self.tabBarController.tabBar.items[0];
    item.image = [UIImage imageNamed:@"star"];
    item.title = @"Избранные";
    UITabBarItem *item1 = self.tabBarController.tabBar.items[1];
    item1.image = [UIImage imageWithImage:[UIImage imageNamed:@"pin"] scaledToSize:CGSizeMake(30, 30)];
    item1.title = @"О нас";
    UITabBarItem *item2 = self.tabBarController.tabBar.items[2];
    item2.image = [UIImage imageNamed:@"home"];
    item2.title = @"Меню";
    UITabBarItem *item3 = self.tabBarController.tabBar.items[3];
    item3.image = [UIImage imageWithImage:[UIImage imageNamed:@"bell"] scaledToSize:CGSizeMake(30, 30)];
    item3.title = @"Уведомления";
    UITabBarItem *item4 = self.tabBarController.tabBar.items[4];
    item4.image = [UIImage imageWithImage:[UIImage imageNamed:@"settings"] scaledToSize:CGSizeMake(30, 30)];
    item4.title = @"Настройки";
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
