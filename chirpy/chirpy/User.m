//
//  User.m
//  chirpy
//
//  Created by Valentin Mihaylov on 9/20/16.
//  Copyright © 2016 valionka. All rights reserved.
//

#import "User.h"
#import "TwitterClient.h"
#import "LoginViewController.h"

@interface User()

@property (nonatomic, strong) NSDictionary *dictionary;

@end

@implementation User

static User *_currentUser = nil;

NSString * const kCurrentUserKey = @"kCurrentUserKey";
NSString * const kTokensKey = @"kTokensKey";


- (id)initWithDictionary:(NSDictionary *)dictionary {
    self =[super init];
    
    if(self) {
        self.dictionary = dictionary;
        self.name = dictionary[@"name"];
        self.screenname = dictionary[@"screen_name"];
        self.profileImageUrl = dictionary[@"profile_image_url"];
        self.tagline = dictionary[@"description"];
        self.backgroundImageUrl = dictionary[@"profile_background_image_url"];
        self.tweetCount = [dictionary[@"statuses_count"] integerValue];
        self.friendCount = [dictionary[@"friends_count"] integerValue];
        self.followerCount = [dictionary[@"followers_count"] integerValue];
        self.bannerUrl = dictionary[@"profile_banner_url"];

    }
    return self;
}

+ (User *)currentUser {
    if (_currentUser == nil) {
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:kCurrentUserKey];
        if (data != nil) {
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
            _currentUser = [[User alloc] initWithDictionary:dictionary];
        }
    }
    
    return _currentUser;
}


+ (void)setCurrentUser:(User *)currentUser {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if (currentUser != nil) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:currentUser.dictionary options:0 error:NULL];
        [userDefaults setObject:data forKey:kCurrentUserKey];
        
    } else {
       // [self removeUser:_currentUser];
        [self removeUser:_currentUser view:self];
    }
    
    _currentUser = currentUser;
    
    [userDefaults synchronize];
}

+ (void)logout {
    [User setCurrentUser:nil];
    [[TwitterClient sharedInstance].requestSerializer removeAccessToken];
}

+ (void)removeUser:(User *)user view:(UIViewController *) view{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    // if user is current user, invalidate session
    if ([user.screenname isEqualToString:_currentUser.screenname]) {
        [userDefaults setObject:nil forKey:kCurrentUserKey];
    }

    [userDefaults synchronize];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    [view presentViewController:[[LoginViewController alloc] init] animated:YES completion:nil];
    
}

+ (void)storeToken:(BDBOAuth1Credential *)token {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSJSONSerialization dataWithJSONObject:token options:0 error:NULL];
    [userDefaults setObject:data forKey:kTokensKey];
}


@end
