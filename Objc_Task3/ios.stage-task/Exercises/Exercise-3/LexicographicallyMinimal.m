#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSMutableString *mutString1 = [[NSMutableString alloc] initWithString:string1];
    NSMutableString *mutString2 = [[NSMutableString alloc] initWithString:string2];
    NSMutableString *finalString = [[NSMutableString alloc] init];

    while ((mutString1.length != 0) && (mutString2.length != 0)) {

        if ([mutString1 UTF8String][0] <= [mutString2 UTF8String][0]) {
                    [finalString appendFormat:@"%c", [mutString1 characterAtIndex:0]];
                    [mutString1 deleteCharactersInRange:NSMakeRange(0, 1)];
                } else {
                    [finalString appendFormat:@"%c", [mutString2 characterAtIndex:0]];
                    [mutString2 deleteCharactersInRange:NSMakeRange(0, 1)];
                }
    }
    
    if (mutString1.length == 0) {
        [finalString appendString: mutString2];
    } else {
        [finalString appendString: mutString1];
    }
    return finalString;
}

@end
