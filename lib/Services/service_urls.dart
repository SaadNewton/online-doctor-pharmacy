/// base url
///
// String baseUrl = 'http://192.168.88.44:8000/api/';
String baseUrl = 'https://onlinedoctor.softwaresbranding.com/api/';

/// image base url
///
// String imageBaseUrl = 'http://192.168.88.44:8000/';
String imageBaseUrl = 'https://onlinedoctor.softwaresbranding.com/';

/// fcm service
///
String fcmService = 'https://fcm.googleapis.com/fcm/send';

///customer signUp
///
String customerSignUpService = baseUrl + 'user-signup';

///phone email valid
///
String phoneEmailCheckService = baseUrl + 'check-phone-status';

///login
///
String loginService = baseUrl + 'login';

/// all categories
///
String getAllCategoriesService = baseUrl + 'get-all-category';

/// get product by category
///
String getProductByCategoryService = baseUrl + 'get-product-by-category';

/// get recent orders requests
///
String getRecentOrderRequestsService = baseUrl + 'order-request';

/// accept request
///
String acceptOrderRequestService = baseUrl + 'order-accept';

/// Get All Accepted Orders
///
String getAllAcceptedOrdersService = baseUrl + 'get-all-pharmacy-orders';

/// Get All Test Categories of Lab
///
String getAllLabTestCategoriesService = baseUrl + 'get-test-category-by-lab';

/// Delete Test Category of Lab
///
String deleteTestCategoryService = baseUrl + 'test-category-delete';

/// Add New Test Category
///
String addNewTestCategory = baseUrl + 'test-category-store';

/// Edit Test Category
///
String editTestCategoryService = baseUrl + 'test-category-update';

/// Tests under Test Category
///
String getAllTestsUnderTestCategoryService =
    baseUrl + 'get-test-by-test-category';

/// Add new Test under Tests of Test Category
///
String addNewTestUnderTestCategoryService = baseUrl + 'test-store';

/// Delete Test under Tests of TestCategory
///
String deleteTestUnderTestCategoryService = baseUrl + 'test-delete';

/// Update the Test under Test Category
///
String updateTestUnderTestCategoryService = baseUrl + 'test-update';

/// Pharmacy Profile Wizard
///
String pharmacyProfileUpdateWizardService =
    baseUrl + 'pharmacy-update-profile-wizard';

/// Lab Profile Wizard
///
String labProfileUpdateWizardService = baseUrl + 'lab-update-profile-wizard';

/// Pharmacy Approved Service
String pharmacyApprovalCheckService = baseUrl + 'pharmacy-is-approved';

/// Lab Approved Service
String labApprovalCheckService = baseUrl + 'lab-is-approved';

/// Lab All Orders Service
String labAllOrdersService = baseUrl + 'lab-order-list';

/// Lab Order Change Status
///
String changeOrderStatusService = baseUrl + 'change-order-status';

/// Forgot Password Email
String passwordEmailService = baseUrl + "forgot-password-email";

/// Forgot Password Email Verify
///
String passwordEmailVerifyService = baseUrl + 'forgot-password-email-verify';

/// Reset Password
String resetPasswordService = 'reset-password';

/// Change Password Service
///
String changePasswordService = baseUrl + 'change-password';

///medicine-filter
///
String medicineSearchService = baseUrl + 'medicine-filter';

/// Contact Us
///
String contactUsService = baseUrl + 'contact-us';

/// order-update
///
String editOrderService = baseUrl + 'order-update';

/// get-notify-token-by-user
///
String getNotifyTokenService = baseUrl + 'get-notify-token-by-user';

/// create-notify-user
///
String createNotifyUserService = baseUrl + 'create-notify-user';
