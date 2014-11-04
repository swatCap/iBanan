//
//  ToursViewController.m
//  banan
//
//  Created by Artem Tkachuk on 11/4/14.
//  Copyright (c) 2014 Artem Tkachuk. All rights reserved.
//

#import "ToursViewController.h"
#import "ToursTableViewCell.h"
#import "WebAPI.h"

@interface ToursViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *toursArray;
@property (strong, nonatomic) NSMutableDictionary *currentTour;



@property (nonatomic) NSInteger pageNumber;
@property (nonatomic) NSInteger recordsPerPage;

@end

@implementation ToursViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    self.pageNumber = 0;
    self.recordsPerPage = 20;
    
    [self loadInformationAboutTours];
    
    self.toursArray = [[NSMutableArray alloc] init];
    self.currentTour = [[NSMutableDictionary alloc] init];
    
    [self.navigationItem setTitle:@"Banan"];
}

#pragma mark - LOAD INFO ABOUT TOURS
-(void) loadInformationAboutTours
{
    [[WebAPI sharedWebAPI] getHotelsInformationWithPageNumber:self.pageNumber
                                               recordsPerPage:self.recordsPerPage
                                                       sortId:0
                                                  withSuccess:^(id response) {
                                                      [self.toursArray addObjectsFromArray:response];
                                                      
                                                      [self.tableView reloadData];
                                                  } withFailure:^(NSError *error) {
        
                                                  }];
}

#pragma mark - UITABLEVIEW METHODS

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.toursArray.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Tour Cell";
    ToursTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    self.currentTour = [self.toursArray objectAtIndex:indexPath.row];
    
    
    
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}











@end
