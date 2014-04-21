//
//  AFGoPartyApiClient.m
//  GoParty
//
//  Created by JoeTang on 14-3-2.
//  Copyright (c) 2014年 goParty. All rights reserved.
//

#import "AFJSONRequestOperation.h"
#import "AFGoPartyApiClient.h"
#import "GlobalTokenManager.h"
#import "UserModel.h"
#import "ErrorModel.h"
#import "AFJSONUtilities.h"


static NSString * const gopartyAPIBaseURLString = @"http://goparty.cloudapp.net/cxf/rest/";

@implementation AFGoPartyApiClient

+ (AFGoPartyApiClient *)sharedClient {
    static AFGoPartyApiClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFGoPartyApiClient alloc] initWithBaseURL:[NSURL URLWithString:gopartyAPIBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    [self setDefaultHeader:@"Content-Type" value:@"application/json"];
    
    self.parameterEncoding = AFJSONParameterEncoding;
    [[NSNotificationCenter defaultCenter] addObserverForName:userModelNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notification) {
        UserModel *user = (UserModel *)[notification object];
        if(user)
        {
            [self setDefaultHeader:@"token" value:user.token];
        }
    }];
    
    return self;
}

-(void)getPathExt:(NSString *)path
       parameters:(NSDictionary *)parameters
          success:(void (^)(AFHTTPRequestOperation *operation, NSString *responseObject))success
          failure:(void (^)(AFHTTPRequestOperation *operation, ErrorModel *error))failure{
    [self getPath:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self querySuccess:success queryFailure:failure response:responseObject opt:operation];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            ErrorModel *err = [[ErrorModel alloc] init];
            err.data = [error localizedDescription];
            failure(operation, err);
        }
    }];
}

- (void)postPathExt:(NSString *)path
         parameters:(NSDictionary *)parameters
            success:(void (^)(AFHTTPRequestOperation *operation, NSString *responseObject))success
            failure:(void (^)(AFHTTPRequestOperation *operation, ErrorModel *error))failure{
    [self postPath:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self querySuccess:success queryFailure:failure response:responseObject opt:operation];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            ErrorModel *err = [[ErrorModel alloc] init];
            err.data = [error localizedDescription];
            failure(operation, err);
        }
    }];
}

- (void)deletePathExt:(NSString *)path
           parameters:(NSDictionary *)parameters
              success:(void (^)(AFHTTPRequestOperation *operation, NSString *responseObject))success
              failure:(void (^)(AFHTTPRequestOperation *operation, ErrorModel *error))failure{
    [self deletePath:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self querySuccess:success queryFailure:failure response:responseObject opt:operation];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            ErrorModel *err = [[ErrorModel alloc] init];
            err.data = [error localizedDescription];
            failure(operation, err);
        }
    }];
}

- (void)putPathExt:(NSString *)path
        parameters:(NSDictionary *)parameters
           success:(void (^)(AFHTTPRequestOperation *operation, NSString *responseObject))success
           failure:(void (^)(AFHTTPRequestOperation *operation, ErrorModel *error))failure{
    [self putPath:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self querySuccess:success queryFailure:failure response:responseObject opt:operation];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            ErrorModel *err = [[ErrorModel alloc] init];
            err.data = [error localizedDescription];
            failure(operation, err);
        }
    }];
}

- (void)patchPathExt:(NSString *)path
          parameters:(NSDictionary *)parameters
             success:(void (^)(AFHTTPRequestOperation *operation, NSString *responseObject))success
             failure:(void (^)(AFHTTPRequestOperation *operation, ErrorModel *error))failure{
    [self patchPath:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [self querySuccess:success queryFailure:failure response:responseObject opt:operation];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            ErrorModel *err = [[ErrorModel alloc] init];
            err.data = [error localizedDescription];
            failure(operation, err);
        }
    }];
}

- (void)querySuccess:(void (^)(AFHTTPRequestOperation *operation, NSString *responseObject))success
        queryFailure:(void (^)(AFHTTPRequestOperation *operation, ErrorModel *error))failure
       response:(id)responseObject
            opt:(AFHTTPRequestOperation *)operation{
    ErrorModel *err = [[ErrorModel alloc] initWithDictionary:responseObject];
    if (err)
    {
        if (err.code == 200)
        {
            if (success) {
                NSData *data = [err.data dataUsingEncoding:NSUTF8StringEncoding];
                
                success(operation, AFJSONDecode(data, nil));
            }
        }
        else
        {
            if (failure) {
                failure(operation, err);
            }
        }
    }
}

@end
