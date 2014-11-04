//
//  WebAPI.m
//  banan
//
//  Created by Artem Tkachuk on 11/4/14.
//  Copyright (c) 2014 Artem Tkachuk. All rights reserved.
//

#import "WebAPI.h"
#import <AFNetworking/AFNetworking.h>

NSInteger const kTimeout = 10;
NSInteger const kImagesUploadTimeout = 20;
NSString *const kURL = @"http://gdebanan.com/";
static NSString * const JSONResponseSerializerWithDataKey = @"JSONResponseSerializerWithDataKey";

@implementation WebAPI

static NSURL *webAPIURL;

+ (void)setWebAPIURL:(NSURL *)url
{
    webAPIURL = url;
}

+ (NSURL *)webAPIURL
{
    return webAPIURL;
}

+(instancetype)sharedWebAPI
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    
    [[self class] setWebAPIURL:[NSURL URLWithString:kURL]];
    
    return sharedInstance;
}

#pragma mark - GET HOTELS INFO

-(void) getHotelsInformationWithPageNumber:(NSInteger) pageNumber
                            recordsPerPage:(NSInteger) recordsPerPage
                                    sortId:(NSInteger) sortId
                               withSuccess:(void(^)(id response)) success
                               withFailure:(void(^)(NSError *error)) failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@jsonNearestTours?page=%i&recordsPerPage=%i&sortId=%i",
                           [[self class] webAPIURL],
                           pageNumber,
                           recordsPerPage,
                           sortId];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:kTimeout];
    
    [request setHTTPMethod:@"GET"];
    
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    requestOperation.responseSerializer = [AFJSONResponseSerializer serializer];
    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@", responseObject);
        
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Fail with error %@", [error localizedDescription]);
    }];
    
    [requestOperation start];

}

@end
