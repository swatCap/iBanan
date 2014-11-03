//
//  WebAPI.m
//  banan
//
//  Created by Artem Tkachuk on 11/4/14.
//  Copyright (c) 2014 Artem Tkachuk. All rights reserved.
//

#import "WebAPI.h"

@implementation WebAPI

+(instancetype)sharedWebAPI
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

@end
