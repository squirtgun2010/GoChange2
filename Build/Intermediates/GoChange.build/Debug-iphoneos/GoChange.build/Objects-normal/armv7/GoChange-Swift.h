// Generated by Apple Swift version 2.1.1 (swiftlang-700.1.101.15 clang-700.1.81)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if defined(__has_include) && __has_include(<uchar.h>)
# include <uchar.h>
#elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
#endif

typedef struct _NSZone NSZone;

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted) 
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
#endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import Foundation;
@import ObjectiveC;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class NSURLSession;
@class UIButton;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC8GoChange21AddIdeaViewController")
@interface AddIdeaViewController : UIViewController
@property (nonatomic, copy) NSString * __nonnull apiKey;
@property (nonatomic, copy) NSString * __nonnull requestURL;
@property (nonatomic, copy) NSString * __nonnull petitionURL;
@property (nonatomic, copy) NSString * __nonnull petitionId;
@property (nonatomic, strong) NSURLSession * __nonnull session;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)doneAddingIdea:(UIButton * __nonnull)sender;
- (IBAction)cancelAddingIdea:(UIButton * __nonnull)sender;
- (IBAction)addPetition:(UIButton * __nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8GoChange22AddTweakViewController")
@interface AddTweakViewController : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)addTweakClick:(UIButton * __nonnull)sender;
- (IBAction)cancelClick:(UIButton * __nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIWindow;
@class UIApplication;
@class NSObject;
@class NSURL;
@class NSManagedObjectModel;
@class NSPersistentStoreCoordinator;
@class NSManagedObjectContext;

SWIFT_CLASS("_TtC8GoChange11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * __nullable window;
- (BOOL)application:(UIApplication * __nonnull)application didFinishLaunchingWithOptions:(NSDictionary * __nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * __nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * __nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * __nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * __nonnull)application;
- (void)applicationWillTerminate:(UIApplication * __nonnull)application;
@property (nonatomic, strong) NSURL * __nonnull applicationDocumentsDirectory;
@property (nonatomic, strong) NSManagedObjectModel * __nonnull managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator * __nonnull persistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectContext * __nonnull managedObjectContext;
- (void)saveContext;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8GoChange27ChangePreviewViewController")
@interface ChangePreviewViewController : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)saveChangeClick:(UIButton * __nonnull)sender;
- (void)leftButtonAction;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8GoChange20ChangeViewController")
@interface ChangeViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIButton * __null_unspecified addIdeaButton;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)viewIdeaClick:(UIButton * __nonnull)sender;
- (IBAction)addIdeaClick:(UIButton * __nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITextField;
@class UITextView;

SWIFT_CLASS("_TtC8GoChange26CreateChangeViewController")
@interface CreateChangeViewController : UIViewController <UIScrollViewDelegate, UITextFieldDelegate, UITextViewDelegate>
@property (nonatomic, weak) IBOutlet UITextField * __null_unspecified nameTextfield;
@property (nonatomic, weak) IBOutlet UITextView * __null_unspecified detailsTextView;
@property (nonatomic, weak) IBOutlet UITextView * __null_unspecified inputTextView;
@property (nonatomic, copy) NSString * __nonnull savedText;
@property (nonatomic, copy) NSString * __nonnull currentField;
@property (nonatomic, copy) NSString * __nonnull currentNameData;
@property (nonatomic, copy) NSString * __nonnull currentDetailData;
@property (nonatomic, readonly, copy) NSString * __nonnull nameInputPrompt;
@property (nonatomic, readonly, copy) NSString * __nonnull detailInputPrompt;
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)homeButtonClick:(UIButton * __nonnull)sender;
- (void)textFieldDidBeginEditing:(UITextField * __nonnull)textField;
- (void)textViewDidBeginEditing:(UITextView * __nonnull)textView;
- (BOOL)textView:(UITextView * __nonnull)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString * __nonnull)text;
- (IBAction)previewChange:(UIButton * __nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8GoChange23FollowingViewController")
@interface FollowingViewController : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)HomeButtonClick:(UIButton * __nonnull)sender;
- (IBAction)FollowedChangeButton:(UIButton * __nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8GoChange14GoChangeClient")
@interface GoChangeClient : NSObject
- (void)printName;
+ (GoChangeClient * __nonnull)sharedInstance;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


@interface GoChangeClient (SWIFT_EXTENSION(GoChange))
@end

@class NSData;
@class NSError;

@interface GoChangeClient (SWIFT_EXTENSION(GoChange))
- (NSString * __nonnull)escapedParameters:(NSDictionary<NSString *, id> * __nonnull)parameters;
- (void)parseJSON:(NSData * __nonnull)data completionHandler:(void (^ __nonnull)(id __null_unspecified, NSError * __nullable))completionHandler;
@end

@class Firebase;
@class UILabel;

SWIFT_CLASS("_TtC8GoChange18HomeViewController")
@interface HomeViewController : UIViewController
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified welcomeLabel;
@property (nonatomic, strong) Firebase * __null_unspecified ref;
- (void)viewDidLoad;
- (IBAction)addUserData:(UIButton * __nonnull)sender;
- (void)viewDidAppear:(BOOL)animated;
- (IBAction)logout:(UIButton * __nonnull)sender;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8GoChange18IdeaViewController")
@interface IdeaViewController : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)addTweakClick:(UIButton * __nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8GoChange21ResultsViewController")
@interface ResultsViewController : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)ResultLinkButton:(UIButton * __nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8GoChange20SearchViewController")
@interface SearchViewController : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (IBAction)homeButtonClick:(UIButton * __nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8GoChange20SignupViewController")
@interface SignupViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic, weak) IBOutlet UITextField * __null_unspecified usernameTextfield;
@property (nonatomic, weak) IBOutlet UITextField * __null_unspecified emailTextfield;
@property (nonatomic, weak) IBOutlet UITextField * __null_unspecified passwordTextfield;
@property (nonatomic, strong) Firebase * __null_unspecified ref;
- (void)viewDidLoad;
- (IBAction)signupButton:(UIButton * __nonnull)sender;
- (BOOL)textFieldShouldReturn:(UITextField * __nonnull)textField;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8GoChange17WebViewController")
@interface WebViewController : UIViewController
- (void)viewDidLoad;
- (void)didReceiveMemoryWarning;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC8GoChange19loginViewController")
@interface loginViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic, strong) Firebase * __null_unspecified ref;
@property (nonatomic, weak) IBOutlet UITextField * __null_unspecified emailTextfield;
@property (nonatomic, weak) IBOutlet UITextField * __null_unspecified passwordTextfield;
@property (nonatomic, copy) NSString * __nullable userID;
- (void)viewDidLoad;
- (void)viewDidAppear:(BOOL)animated;
- (IBAction)login:(id __nonnull)sender;
- (BOOL)textFieldShouldReturn:(UITextField * __nonnull)textField;
- (void)didReceiveMemoryWarning;
- (void)segueToHomeScreen;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
