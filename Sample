#import "Restfulie.h"
@interface Sample : NSObject {
  id<RestClient> client;
}
@property (nonatomic, assign) id<RestClient> client;
@end

//Sample.m

#import "Sample.h"
#import "Restfulie.h"
#import "User.h"

@implementation Sample
@synthesize client;

- (id) init
{
	self = [super init];
	if (self != nil) {
		self.client = [Restfulie customWithTypes:[NSArray arrayWithObjects:[User class], nil] 
					andCollectionNames:[NSArray arrayWithObjects:@"users", nil]];
	}
	return self;
}

- (void)get {
	
	Response *response = [[self.client at:@"http://localhost:3000/users"] get];
	
	if (response.code == 200) {
		NSArray *users = [response resource];
		NSLog(@"returned users %@", users);
	}
	else {
		NSLog(@"fail with code %i", response.code);
	}
	
}

- (void)post:(User*)user {
	
	Response *response = [self.client at:@"http://localhost:3000/users"] post:user];
	
	if (response.code == 200) {
		User *userWithId = [response resource];
		NSLog(@"user created with id %@", userWithId.userId);
	}
	else {
		NSLog(@"user post failed with http code %i", response.code);
	}
	
}

</pre>
