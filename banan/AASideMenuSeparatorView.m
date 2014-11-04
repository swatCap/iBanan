//
//  AASideMenuSeparatorView.m
//  IBSMobile
//
//  Created by anovoselskyi on 12/10/13.
//  Copyright (c) 2013 Alteso. All rights reserved.
//

#import "AASideMenuSeparatorView.h"

@implementation AASideMenuSeparatorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIView *topLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/2)];
        [topLineView setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.4]];
        [self addSubview:topLineView];
        
        UIView *bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height/2, self.frame.size.width, self.frame.size.height/2)];
        [bottomLineView setBackgroundColor:[UIColor colorWithRed:64/255.0 green:90/255.0 blue:103/255.0 alpha:0.3]];
        [self addSubview:bottomLineView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
