//
//  SlideMenuViewController.m
//  banan
//
//  Created by Artem Tkachuk on 11/4/14.
//  Copyright (c) 2014 Artem Tkachuk. All rights reserved.
//

#import "SlideMenuViewController.h"
#import "AppDelegate.h"
#import "AASideMenuSeparatorView.h"
#import "SlideMenuTableViewCell.h"

@interface SlideMenuViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *menuItemsCaptionArray;
@property (strong, nonatomic) NSArray *menuItemsIconArray;
@property (strong, nonatomic) NSIndexPath *previousSelectedCellIndexPath;
@property (nonatomic) BOOL isViewAppeared;
@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) NSString *name;


@end

@implementation SlideMenuViewController

@synthesize currentSelectedCellIndexPath = _currentSelectedCellIndexPath;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.tableView setBackgroundColor:[UIColor grayColor]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.contentInset = UIEdgeInsetsMake(63, 0.0f, 0.0f, 0.0f);
    
    [self.navigationController.navigationBar addSubview:[[AASideMenuSeparatorView alloc] initWithFrame:CGRectMake(0, 43, 320, 2)]];
    
//    AMAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
//    NSManagedObjectContext *context = [delegate managedObjectContext];
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"MyInformation" inManagedObjectContext:context];
//    NSFetchRequest *request = [[NSFetchRequest alloc] init];
//    [request setEntity:entity];
//    
//    NSManagedObject *matches = nil;
//    
//    NSError *error = nil;
//    NSArray *objects = [context executeFetchRequest:request
//                                              error:&error];
//    
//    if (objects.count == 0)
//    {
//        self.menuItemsCaptionArray = @[@"Your Name",@"Dressing Room", @"Workout", @"Expert Tips"];
//        self.menuItemsIconArray = @[@"name", @"dressingRoom", @"workout", @"expertTips"];
//    }
//    else
//    {
//        matches = objects[0];
//        self.name = [matches valueForKey:@"name"];
//        
//        self.menuItemsCaptionArray = @[self.name ,@"Dressing Room", @"Workout", @"Expert Tips"];
//        self.menuItemsIconArray = @[@"name", @"dressingRoom", @"workout", @"expertTips"];
//    }
    
    self.menuItemsCaptionArray = @[@"Your Name",@"Dressing Room", @"Workout", @"Expert Tips"];
    self.menuItemsIconArray = @[@"name", @"dressingRoom", @"workout", @"expertTips"];
    
    // setting select index path for first cell by default
    self.currentSelectedCellIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SlideMenuTableViewCell *cell = (SlideMenuTableViewCell *)[self.tableView cellForRowAtIndexPath:self.currentSelectedCellIndexPath];
//        [self selectTableViewCell:cell forIndexPath:self.currentSelectedCellIndexPath ofTableView:self.tableView];
    });
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.isViewAppeared = YES;
}

#pragma mark - UITableViewDataSource
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.menuItemsCaptionArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Slide Menu Cell";
    
    SlideMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    
    
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
