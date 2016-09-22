//
//  Tweet.m
//  chirpy
//
//  Created by Valentin Mihaylov on 9/20/16.
//  Copyright © 2016 valionka. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet


- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if(self) {
        self.text = dictionary[@"text"];
        self.user = [[User alloc] initWithDictionary:dictionary[@"user"]];
        
        NSString *createdAtString = dictionary[@"created_at"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"EEE MMM d HH:mm:ss Z y";
        
        self.createdAt = [formatter dateFromString:createdAtString];
    }
    
    return self;
}

- (id) initWithText:(NSString *)text {
    NSDate *now = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"EEE MMM d HH:mm:ss Z y";
    
    NSDictionary *data = [NSDictionary dictionary];
    NSDictionary *user = [NSDictionary dictionary];
    User *currentUser = [User currentUser];
    
    user = @{
             @"name" : currentUser.name,
             @"screen_name" : currentUser.screenname,
             @"profile_image_url" : currentUser.profileImageUrl
             };
    
    data = @{
             @"user" : user,
             @"text" : text,
             @"created_at" : [formatter stringFromDate:now]
             };
    
     return [self initWithDictionary:data];
}

+ (NSArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [NSMutableArray array];
    
    for(NSDictionary *dictionary in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:dictionary]];
    }
    
    return tweets;
}


@end
