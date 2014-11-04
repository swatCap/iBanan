//
//  SlideMenuViewController.h
//  banan
//
//  Created by Artem Tkachuk on 11/4/14.
//  Copyright (c) 2014 Artem Tkachuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideMenuViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSIndexPath *currentSelectedCellIndexPath;

- (void)selectTableViewCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath ofTableView:(UITableView *)tableView;
- (void)deselectTableViewCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath ofTableView:(UITableView *)tableView;

@end
