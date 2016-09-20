//
//  User.m
//  chirpy
//
//  Created by Valentin Mihaylov on 9/20/16.
//  Copyright © 2016 valionka. All rights reserved.
//

#import "User.h"

@implementation User

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self =[super init];
    
    if(self) {
        self.name = dictionary[@"name"];
        self.screenname = dictionary[@"screen_name"];
        self.profileImageUrl = dictionary[@"profile_image_url"];
        self.tagline = dictionary[@"description"];
    }
    return self;
}

@end
