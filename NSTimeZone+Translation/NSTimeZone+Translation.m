//
//  NSTimeZone+Translation.m
//  Summertime
//
//  Created by Oliver Drobnik on 3/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSTimeZone+Translation.h"


@implementation NSTimeZone (Translation)

- (NSString *)localizedGeoName
{
	return NSLocalizedStringFromTable(self.name, @"LocalizableTimezones", @"NSTimeZone+Translation");
}

@end
