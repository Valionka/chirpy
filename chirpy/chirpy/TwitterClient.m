//
//  TwitterClient.m
//  chirpy
//
//  Created by Valentin Mihaylov on 9/20/16.
//  Copyright © 2016 valionka. All rights reserved.
//

#import "TwitterClient.h"


NSString * const kTwitterConsumerKey = @"4upW03xXgen3emlYyk4OYEhkv";
NSString * const kTwitterConsumerSecret = @"YWW2Zvy5qHWMqvjvYZ9MDUbiZ52KUu8cBGygLwdEp5Q4m4czjb";
NSString * const kTwitterBaseUrl = @"https://api.twitter.com";

@implementation TwitterClient


+ (TwitterClient *)sharedInstance {
    static TwitterClient *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once (&onceToken, ^{
        if(instance == nil){
            instance = [[TwitterClient alloc] initWithBaseURL:[NSURL URLWithString:kTwitterBaseUrl] consumerKey:kTwitterConsumerKey consumerSecret:kTwitterConsumerSecret];
        }
    });
    
    return instance;
}

@end
