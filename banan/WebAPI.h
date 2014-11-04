//
//  WebAPI.h
//  banan
//
//  Created by Artem Tkachuk on 11/4/14.
//  Copyright (c) 2014 Artem Tkachuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebAPI : NSObject

+(instancetype)sharedWebAPI;

#pragma mark - GET HOTELS INFO

-(void) getHotelsInformationWithPageNumber:(NSInteger) pageNumber
                            recordsPerPage:(NSInteger) recordsPerPage
                                    sortId:(NSInteger) sortId
                               withSuccess:(void(^)(id response)) success
                               withFailure:(void(^)(NSError *error)) failure;

@end
