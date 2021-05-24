#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    NSString *month = [NSString new];
    NSArray *months = [[NSArray alloc] initWithObjects:@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December", nil];
    // int n = (int) monthNumber;
    if (0 < monthNumber && monthNumber <= 12) {
        month = months[monthNumber - 1];
    } else {
        month = nil;
    }
    return month;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    long x = 0;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate *dateFromS = [dateFormatter dateFromString:date];
    NSDateFormatter *dayFormatter = [[NSDateFormatter alloc] init];
    [dayFormatter setDateFormat:@"dd"];
    x = [dayFormatter stringFromDate:dateFromS].longLongValue;
    return x;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSString *dayOfTheWeek = [NSString new];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    [dateFormatter setDateFormat:@"E"];
    
    dayOfTheWeek = [dateFormatter stringFromDate:date];
    
    return dayOfTheWeek;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSDate *currentDate = [NSDate now];

    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *receivedWeek = [gregorian components:NSCalendarUnitWeekOfYear fromDate:date];
    NSDateComponents *currentWeek = [gregorian components:NSCalendarUnitWeekOfYear fromDate:currentDate];
    
    if (receivedWeek.weekOfYear == currentWeek.weekOfYear && receivedWeek.year == currentWeek.year ) {
        return YES;
    } else {
        return NO;
    }
}

@end
