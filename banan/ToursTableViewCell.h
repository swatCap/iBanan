//
//  ToursTableViewCell.h
//  banan
//
//  Created by Artem Tkachuk on 11/4/14.
//  Copyright (c) 2014 Artem Tkachuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToursTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *tourImageView;
@property (weak, nonatomic) IBOutlet UIImageView *firstStar;
@property (weak, nonatomic) IBOutlet UIImageView *secondStar;
@property (weak, nonatomic) IBOutlet UIImageView *thirdStar;
@property (weak, nonatomic) IBOutlet UIImageView *fourthStar;
@property (weak, nonatomic) IBOutlet UIImageView *fifthStar;
@property (weak, nonatomic) IBOutlet UILabel *siteUrl;
@property (weak, nonatomic) IBOutlet UILabel *countryAndCityLabel;
@property (weak, nonatomic) IBOutlet UILabel *nomerInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *pitanieInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfHumansLabel;

@end
