//
//  AppDelegate.m
//  Lesson9
//
//  Created by Timur Bernikowich on 03.05.15.
//  Copyright (c) 2015 Timur Bernikowich. All rights reserved.
//

#import "AppDelegate.h"

#define WEATHER_BASE_URL @"http://api.openweathermap.org/data/2.5/"
#define WEATHER_API_KEY_NAME @"APPID"
#define WEATHER_API_KEY_VALUE @"7fff21fb11f97e516088f4cb52e175e5"

@interface AppDelegate ()

@property (nonatomic, readonly) NSDictionary *additionalParams;
@property (nonatomic, readonly) NSDictionary *authParams;
@property (nonatomic, readonly) NSDictionary *userDefinedParams;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *requestName = @"weather";
    NSDictionary *params = @{@"lat":@(53.9),
                             @"lon":@(27.5)};
    
    NSURL *requestURL = [self URLWithRequest:requestName params:params];
    
    // GCD - Grand Central Dispatch.
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^(){
        NSData *data = [NSData dataWithContentsOfURL:requestURL];
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        dispatch_async(dispatch_get_main_queue(), ^(){
            [self updateUIWithData:response];
        });
    });
    
    // NSURLConnection (async).
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:requestURL cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (!connectionError && data.length) {
            NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            [self updateUIWithData:response];
        } else {
#warning ERROR
        }
    }];
    
    return YES;
}

- (void)updateUIWithData:(NSDictionary *)data
{
    
}

- (NSURL *)URLWithRequest:(NSString *)request params:(NSDictionary *)params
{
    if (!request.length) {
        return nil;
    }
    
    NSMutableString *requestURL = [[WEATHER_BASE_URL stringByAppendingString:request] mutableCopy];
    
    // Adding auth params.
    if (params.allKeys.count) {
        NSMutableDictionary *temp = [params mutableCopy];
        [temp addEntriesFromDictionary:self.additionalParams];
        params = temp;
    } else {
        params = self.additionalParams;
    }
    
    // Addings params.
    [requestURL appendString:@"?"];
    NSMutableArray *keyValues = [NSMutableArray new];
    for (NSString *key in params) {
        id value = [params objectForKey:key];
        NSString *keyValue = [NSString stringWithFormat:@"%@=%@", key, value];
        [keyValues addObject:keyValue];
    }
    [requestURL appendString:[keyValues componentsJoinedByString:@"&"]];
    
    return [NSURL URLWithString:requestURL];
}

- (NSDictionary *)additionalParams
{
    NSMutableDictionary *additionalParams = [NSMutableDictionary new];
    [additionalParams addEntriesFromDictionary:self.authParams];
    [additionalParams addEntriesFromDictionary:self.userDefinedParams];
    return additionalParams;
}

- (NSDictionary *)authParams
{
    return @{WEATHER_API_KEY_NAME:WEATHER_API_KEY_VALUE};
}

- (NSDictionary *)userDefinedParams
{
    return @{@"lang":@"en", @"units":@"metric"};
}

@end
