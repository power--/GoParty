//
//  AFGoPartyApiClient.h
//  GoParty
//
//  Created by JoeTang on 14-3-2.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"
#import "ErrorModel.h"

@interface AFGoPartyApiClient : AFHTTPClient

+ (AFGoPartyApiClient *)sharedClient;
- (void)getPathExt:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void (^)(AFHTTPRequestOperation *operation, NSString *responseObject))success
        failure:(void (^)(AFHTTPRequestOperation *operation, ErrorModel *error))failure;

- (void)postPathExt:(NSString *)path
        parameters:(NSDictionary *)parameters
           success:(void (^)(AFHTTPRequestOperation *operation, NSString *responseObject))success
           failure:(void (^)(AFHTTPRequestOperation *operation, ErrorModel *error))failure;

- (void)deletePathExt:(NSString *)path
        parameters:(NSDictionary *)parameters
           success:(void (^)(AFHTTPRequestOperation *operation, NSString *responseObject))success
           failure:(void (^)(AFHTTPRequestOperation *operation, ErrorModel *error))failure;

- (void)putPathExt:(NSString *)path
        parameters:(NSDictionary *)parameters
           success:(void (^)(AFHTTPRequestOperation *operation, NSString *responseObject))success
           failure:(void (^)(AFHTTPRequestOperation *operation, ErrorModel *error))failure;

- (void)patchPathExt:(NSString *)path
        parameters:(NSDictionary *)parameters
           success:(void (^)(AFHTTPRequestOperation *operation, NSString *responseObject))success
           failure:(void (^)(AFHTTPRequestOperation *operation, ErrorModel *error))failure;

@end
