//
//  Constants.swift
//  YISCustomerApp
//
//  Created by Calibrage Mac on 17/08/17.
//  Copyright © 2017 Calibrage Mac. All rights reserved.
//

import Foundation

// MARK: - AppDelegate Constant


let BASE_API = "http://192.168.1.157/PayZanAPI/api/"


let Registartion_API        =  BASE_API + "Register/Register"
let LOGIN_API               =  BASE_API + "Register/Login"
let USERLOGIN_API           =  BASE_API + "Account/Login"
let COUNTRIES_API           =  BASE_API + "Countries/GetCountries/"
let STATES_API              =  BASE_API + "States/GetStates/"
let DISTRICTS_API           =  BASE_API + "Districts/GetDistricts/"
let ADDAGENT_API            =  BASE_API + "Agent/AddAgent"
let BUSINESSCATEGORY_API    =  BASE_API + "TypeCdDmts/GetTypeCdDmtsByClassType/"
let BANKNAMES_API           =  BASE_API + "TypeCdDmts/GetTypeCdDmtsByClassType/"
let BANKBRANCHES_API        =  BASE_API + "Banks/Get/"
let PERSONALIDS_API         =  BASE_API + "TypeCdDmts/GetTypeCdDmtsByClassType/"
let FINANCIALIDS_API        =  BASE_API + "TypeCdDmts/GetTypeCdDmtsByClassType/"
let PROVINCE_API            =  BASE_API + "Province/GetProvinces/"
let GENDER_API              =  BASE_API + "TypeCdDmts/GetTypeCdDmtsByClassType/"
let AGENTREQUESTINFO_API    =  BASE_API + "AgentRequestInfo/GetAgentRequestInfo/f1df3305-f345-490b-aee0-7cffdaeb7e0e/"
let UPDATEAGENTREQUESTINFO_API =  BASE_API + "AgentRequestInfo/UpdateAgentRequestStatus"




let kToastDuration  = 3.0


let SVHUDMESSAGE = "Loading..."
let KFirstTimeLogin = "first Time Login"
/*

var APP_DELEGATE : AppDelegate = UIApplication.shared.delegate as! AppDelegate
//let MANAGED_OBJECT_CONTEXT = APP_DELEGATE.managedObjectContext

//MARK: - URLs



//Base URLs
let BASE_TEST_SERVICE_URL = "https://www.youngsinc.com/YISCUSTAPPTEST_SERVICE/"
let BASE_PRODUCTION_SERVICE_URL = "https://www.youngsinc.com/YIS_APP_REP_SERVICES/V2/"
let BASE_LOCAL_SERVICE_URL = "http://192.168.1.149/YISCustAppService/"

let BASE_SIGNIN_URL = BASE_TEST_SERVICE_URL + "applogin"
let BASE_URL = BASE_TEST_SERVICE_URL
let BASE_CLAIMS_URL = BASE_TEST_SERVICE_URL + "api/RepApp/"
let API_ITEM_IMAGE = "http://www.youngsinc.com/images/"
let BASE_URL_SHARE = BASE_TEST_SERVICE_URL

//API constants

let API_FORGOT_PASSWORD = "app/ForgotPassword"
let API_INSERT_REFERRALCODE = "app/InsertReferralCode"
let API_GET_CATEGORIES_MENU = "app/GetCategoriesMenu"
let API_DISPLAY_ITEMS = "Items/DisplayItems"
let API_GET_WISHLIST = "Items/GetWishList"
let API_INSERT_UPDATE_WISHLIST = "Items/InsertUpdateWishList"
let API_DELETEITEMFROM_WISHLIST = "Items/DeleteItemFromWishList"
let API_GETRECENTLY_VIEWEDPRODUCTS = "Items/GetRecentlyViewedProducts"
let API_INSERT_UPDATE_SHOPPINGCART = "Cart/InsertUpdateShoppingCart"
let API_GETTOTALSTODISPLAY = "Cart/GetTotalsToDisplay"
let API_DISPLAY_SIMILAR_ITEMS = "Items/DisplaySimilarItems"
let API_DISPLAY_COLLECTION_ITEMS = "Items/DisplayCollectionItems"
let API_GETSHOPPINGCARTITEMS = "Cart/GetShoppingCartItems"
let API_DISPLAYCOUNTSHEETITEMS = "Items/DisplayCountSheetItems"
let API_INSERTCUSTOMER_TRACKINGDETAILS = "Items/InsertCustomerTrackDetails"
let API_GETITEMQUANTITIESINOPENORDERS = "Items/GetItemQuantitiesInOpenOrders"
let API_GETCOMPLETEORDERDETAILS = "Order/GetCompleteOrderDetails"
let API_GETFRIEGHTTERMS = "Config/GetFreightTerms"
let API_GETPAYMENTTERMS = "Config/GetPaymentTerms"
let API_VALIDATEPROMOTIONS = "Order/ValidatePromotions"
let API_GETORDERBILLINGSHIPPINGPAYMENTINFO = "Order/GetOrderBillingShippingPaymentInfo"
let API_GETCUSTOMERADDRESSES = "Order/GetCustomerAddresses"
let API_GETADDRESSTYPES = "Config/GetAddressTypes"
let API_GETSHIPVIATYPES = "Config/GetShipViaTypes"
let API_GETCOUNTRIES = "Config/GetCountries"
let API_GETSTATES = "Config/GetStates"
let API_INSERTORUPDATEADDRESS = "Order/InsertUpdateCustomerAddress"
let API_GETCREDITCARDSFORCUSTOMER = "Order/GetCustomerExistingCCs"
let API_INSERTUPDATECREDITCARD = "Order/InsertUpdateCCInfo"
let API_VALIDATECREDITCARD = "Config/ValidateCreditCard"
let API_DELETECREDITCARDINFO = "Order/DeleteCreditCardInfo"
let API_INSERTUPDATESHOPPINGCARTADDRESSES = "Cart/InsertUpdateShoppingCartAddresses"
let API_DELETECUSTOMERADDRESS = "Order/DeleteCustomerAddress"
let API_INSERTUPDATESHOPPINGCARTCOMPLETEORDERDETAILS = "Order/InsertUpdateShoppingCartCompleteOrderDetails"
let API_SUBMITORDER = "Order/SubmitOrder/"
let API_GET_CONTACT_TYPES = "Config/GetContactTypes"
let API_INSERT_UPDATE_CUSTOMER_CONTACTS = "app/InsertUpdateCustomerContacts"
let API_GETCUSTOMERGENERALINFO = "app/GetCustomerGeneralInfo"
let API_GETCUSTOMER_CONTACTS_CUSTOMER_NUMBER = "app/GetCustomerContacts"
let API_DELETE_CUSTOMER_CONTACTS = "app/DeleteCustomerContacts"
let API_UPDATECUSTOMERGENERALINFO = "app/UpdateCustomerGeneralInfo"
let API_GETPAYMENTSDUE = "app/GetPaymentsDue"
let API_GETORDERANDINVOICES = "Order/GetOrdersAndInvoices"
let API_GETORDERSANDINVOICEDETAILS = "Order/GetOrdersAndInvoiceDetails"
let API_GETORDERHEADERINFORMATION = "Order/GetOrderHeaderInformation"





let API_SEARCH_ITEM = "searchitem"
let API_GET_ITEM_DETAILS = "GetItemdetails/"
let API_GET_SUB_CATEGORIES = "getbestsellers/"
let API_GET_ITEM_GROUPS = "GetItemGroups"
let API_GET_ITEMS_BY_FILTERS = "GetItemsListByFilters"
let API_GET_CATALOGS = "GetCatalogs"
let API_SEARCH_CUSTOMER_FOR_QUOTES = "Quotes/SearchCustomerForQuotes"
let API_DISPLAY_EXSTINING_QUOTES = "Quotes/DisplayExistingQuotes"
let API_GET_BUYERS = "Quotes/getBuyers/"
let API_GET_COUNTRIES = "Quotes/GetCountries"
let API_GET_STATES = "Quotes/GetStates"
let API_GET_QUOTE_FOR_LIST = "Quotes/GetQuoteForList"
let API_GET_SHOWROOMS = "Quotes/GetShowrooms"
let API_INSERT_UPDATE_QUOTE_HEADERS = "Quotes/InsertUpdateQuoteHeader/"
let API_GET_QUOTE_ITEM_DETAILS = "Quotes/GetQuoteItemDetails"
let API_INSERT_UPDATE_QUOTE_ITEM = "Quotes/InsertUpdateQuoteItem"
let API_DELETE_QUOTE_ITEM = "Quotes/DeleteQuoteItem"
let API_DELETE_MULTIPLE_QUOTE_ITEMS = "Quotes/DeleteMultipleQuoteItem"
let API_GET_QUOTE_FOR_SHOWLIST = "Quotes/GetQuoteForShowsList/"
let API_GET_QUOTE_ITEMS = "Quotes/GetQuoteItems/"
let API_FAV_QUOTE_API = "Quotes/InsertQuoteDetailFromSalesPersonFavorites"
let API_GET_CURRENT_SPECIALS  = "getcurrentspecials/"
let API_GET_QUOTE_HEADER_INFO = "Quotes/GetQuoteHeaderInfo/"
let API_GET_CUSTOMER_BILLING_ADDRESS = "Quotes/GetcustomerBillingAddress/"
let API_CURRENT_SPECIAL_SHOW = "SHOW/"
let API_CURRENT_SPECIAL_ROAD = "ROAD/"
let API_LOOKUP_CUSTOMER = "Customers/SearchCustomer"
let API_ADD_ORDER = "Customers/InsertNewOrder"
let API_VIEW_ORDER = "Customers/GetOrdersforSelectedCustomer/"                      // {CustNo}/{Status}
let API_MAIN_ACCOUNT_DETAILS = "Customers/GetCustomerMainAccountDetails/"           // {CustNo}
let API_GET_CUSTOMER_ADDRESS = "Customers/GetCustomerAddresses/" //{CustomerNumber}/{AddressType}/{AddressNumber}
let API_GET_CUSTOMER_CONTACTS = "Customers/GetCustomerContacts/"                    // {CustNo}
let API_GET_COUNT_SHEET = "Customers/GetReorderItems"
let API_BOOKING_SHIPPING_HISTORY = "Customers/DisplayBookingAndShippingHistory/"    // {CustNo}
let API_LIFE_STYLE_BOUGHT = "Customers/GetLifeStylesBought/"                        // {CustNo}"
let API_GET_TOPACCOUNTS = "Customers/GetRepTopAccounts/"                            // {salesPerson}
let API_GET_FAVCUSTOMERS = "Customers/GetSalesrepFavoriteCustomers/"                // {salesPerson}
let API_GETORDERINFO = "Orders/GetOrderItemInfo"
let API_GETTOTALCATEGORIES = "Orders/GetOrderTotalsByCategory"
let API_INSERTUPDATEORDERITEMS = "Orders/InsertUpdateOrderItems"
let API_DELETEITEMFROMORDER = "Orders/DeleteItemFromOrder"
let API_GETORDERITEMS = "Orders/GetOrderItems"
let API_INSERTDELETEFAVORITEITEMS = "InsertDeleteFavoriteItems"
let API_GETHEADERINFORMATION = "Orders/GetOrderHeaderInformation"


let API_INSERTORUPDATEBILLINGADDRESS = "Orders/InsertUpdateOrderBillingShipping"
let API_COMPLETEORDER = "Orders/GetCompleteOrderDetails"
let API_FINALIZEORDER = "Orders/FinalizeOrder"
let API_UPDATECREDITCARD = "Orders/UpdateCCToOrder"
let API_ORDERNOTE = "Orders/InsertUpdateOrderNote"
let API_DELETECOMPLETESCRINFOFROMTEMPTABLE = "Orders/DeleteCompleteScrInfoFromTempTable"
let API_SAVECOMPLETESCRINFOINTEMPTABLE = "Orders/SaveCompleteScrInfoInTempTable"
let API_REINSTATEMAINSEQ = "Orders/ReinstateMainSeq"
let API_SENDOUTOFBUSINESSNOTIFICATION = "Customers/SendOutOfBusinessNotification"
let API_SENDNOTMYCUSTOMERNOTIFICATION = "Customers/SendNotMyCustomerNotification"
let API_INSERTDELETEFAVORITECUSTOMERS = "Customers/InsertDeleteFavoriteCustomers"
let API_GETORDERSFORSELECTEDCUSTOMER = "Customers/GetOrdersforSelectedCustomer"
let API_UPDATECUSTOMERADDRESS = "Customers/UpdateCustomerInfo"
let API_GETCUSTOMERCONTACTS = "Customers/GetCustomerContacts"
let API_GETCONTACTTYPES = "Config/GetContactTypes"
let API_INSERTUPDATECUSTOMERCONTACTS = "Customers/InsertUpdateCustomerContacts"
let API_DELETECUSTOMERCONTACT = "Customers/DeleteCustomerContact"
let API_GETLIFESTYLES = "Customers/GetLifeStylesBought"
let API_DISPLAYBOOKINGANDSHIPPINGHISTORY = "Customers/DisplayBookingAndShippingHistory"
let API_CUSTOMERCLAIMS = "CustomerClaims/GetCustomerClaims"
let API_GETCUSTOMERCLAIMINVOICEITEMINFORMATION = "CustomerClaims/GetCustomerClaimInvoiceItemInformation"
let API_GETNEWCLAIMNUMBER = "CustomerClaims/GenerateCustomerNewClaimNumber"
let API_GETCUSTOMERCLAIMITEMS = "CustomerClaims/GetCustomerClaimItems"
let API_GET_RECENT_CUSTOMERS = "Customers/GetCustomerSearchHistory/"
let API_GET_ACTIVE_CUTOMERS = "Customers/GetRepActiveCustomers"
let API_INSERTINTOCUSTOMERHISTORY = "Customers/InsertIntoCustomerSearchHistory"

let API_ORDER_SUMMARY = "RepHome/GetRepRoadAndTotalOrders/"
let API_LAST_YEAR_VS_CURRENT_YEAR = "RepHome/GetSalespersonLYCYBookingAndShippingDetails/"
let API_REPORT_VIEW = "Reports/ViewOrder"
let API_REPORT_VIEW_INVOICE = "Reports/ViewInvoice"
let API_REPORT_DOWNLOAD = "Reports/DownloadOrder"
let API_REPORT_DOWNLOAD_INVOICE = "Reports/DownloadInvoice"
let API_VIEW_ITEM_DETAILS = "Reports/ViewItemDetails"
let API_DOWNLOAD_IMAGES = "Reports/DownloadlowResImages"
let API_DOWNLOAD_ITEM_DETAILS = "Reports/DownloadItemDetails"
let API_GETSALESREPFAVITEMS = "GetSalespersonFavoriteItems"
let API_DELETEFAVREPITEMS = "DeleteAllFavoriteItemsForRep"
let API_DOWNLOAD_IMAGE_ZIP = "Reports/DownloadlowResImages"
let API_VIEWITEMS_DETAILS = "Reports/ViewItemDetails"
let API_DOWNLOAD_HIGH_IMAGE_ZIP = "Reports/DownloadhighResImages"
let API_SEARCHFORREP = "Quotes/SearchForRep"
let API_CHANGEREPFORQUOTE = "Quotes/ChangeSalesRepForQuote"
let API_REPPROFILEDETAILS = "GetSalesRepProfileDetails"
let API_PRINT = "Reports/PrintShowOrder"
let HEADER_IMAGE_URL = "app/MAIN_HEADER"
let API_CHANGEPASSWORD = "app/ChangePassword"
let API_GENERATESHORTURLS = "Reports/GenerateShortUrls"
let API_INSERTUPDATECUSTOMERCLAIMHEADER = "CustomerClaims/InsertUpdateCustomerClaimHeader"
let API_INSERTNEWCUSTOMER = "Orders/InsertOrderForNEWCustomers"
let API_INSERTCREDITCARDFORNEWCUSTOMER = "Customers/InsertCCInfoForNewCustomer"
let API_CALLFORCC = "Orders/InsertUpdateOrderNote"
let API_CALIMSUBCODES  = "Config/GetClaimSubCodes"
let API_INSERTUPDATECUSTOMERCLAIMITEMS = "CustomerClaims/InsertUpdateCustomerClaimItems"
let API_GETCLAIMINFORMATIONFORITEMADD = "CustomerClaims/GetClaimInformationForFinalItemAdd"
let API_UPDATECLAIMSDISCOUNTANDREFUNDMETHOD = "CustomerClaims/UpdateClaimsDiscountAndRefundMethod"
let API_COMPLETECLAIM = "CustomerClaims/CompleteClaim"
let API_INSERTUPDATECLAIMRETURNDETAILS = "CustomerClaims/InsertUpdateClaimReturnDetails"
let API_INSERTCLAIMIMAGE = "CustomerClaims/InsertClaimImage"
let API_DELETECLAIM = "CustomerClaims/DeleteClaim"
let API_DELETECLAIMITEM = "CustomerClaims/DeleteClaimItem"
let API_GETCLAIMRETURNINFORMATION = "CustomerClaims/GetClaimReturnInformation"
let API_GETDISPLAYCLAIMIMAGES = "CustomerClaims/DisplayClaimImages"
let API_NEWANDACTIVEACCOUNTS = "RepHome/DisplayRepActiveANDNewAccountsHistory"
let API_CLAIMSHARE = "Reports/GetClaimEmailTemplate"
let API_RECENTACTIVITIES = "Customers/RepCustomerRecentActivites"
let API_GEOLOCATIONS = "Customers/SearchCustomerByGeoLocations"



let API_SHOW = "SHOW"
let API_SHOWROOM = "SHOWROOM"

let API_VIEWCLAIM = "Reports/ViewClaim"
let API_DOWNLOADCLAIM = "Reports/DownloadClaim"

let API_Category_Gift = "Gift"
let API_Category_Garden = "GAR"
let API_Category_Holiday = "Seasonal"
let API_Category_WomansFashion = "WA"

let API_Type_Gift = "MCAT"
let API_Type_Garden = "CAT"
let API_Type_Holiday = "MCAT"
let API_Type_WomansFashion = "MCAT"

let API_InStock = "1"
let API_All = "0"

let API_JPEG = ".jpg"

let API_QUOTE_TYPE = "US"

let API_VIEW_QUOTE = "Reports/ViewQuote?query=" //15723
let API_DOWNLOAD_QUOTE = "Reports/DownloadQuote?query=" // 15726

//MARK: - Text Constants

let kAppTitle = "Young Inc"
let kLoading = "Loading..."
let kDetailLoadig = "Downloading in progress..."
let kNetworkError = "Please check the network connection and try again."
let kUnauthorizedError = "Authorization has been denied for this request."
let kSignInError = "Please enter valid credentials"
let kSearchCustomerForQuotes = "Please type atleast one character"
let kNoCustomersFound = "No Customers Found"
let kCustomerNameError = "Please enter customer name"
let kBuyerError = "Please enter buyer name"
let kAddressError = "Please enter shipping address"
let kCityError = "Please enter city"
let kZipError = "Please enter zip"
let kStateError = "Please enter State"
let kCountryError = "Please enter Country"
let kItemNotFound = "Item Not Found"
let kItemAdded = "Item added successfully"
let kItemDeleted = "Item deleted successfully"
let kItemSaved = "Item saved successfully"
let kInternalServerError = "Internal Server Error"

let kFollowUpDays = 14
let kSampleReqDays = 14
let kTimeOutInterval = 60.0

//MARK: - User Default Constants

let kUserName = "userName"
let kPassword = "password"
let kHasLoggedIn = "hasLoggedIn"
let kAccessToken = "accessToken"
let kTokenType = "tokenType"
let kSalesRepName = "SalesRepName" //WARNING:- ALSO INITIALISED IN CCKNavDrawer
let kSamples = "samples"
let kInternalUse = "internalUse"
let kEmail = "email"
let kDeviceID = "deviceID"
let kCustName = "customerName"
let kIsFromMail = "isFromMail"

let kShowName = "showName"
let kRememberMe = "rememberMe"

let kIsFirstTime = "isFirstTime"

let kShowReorderItems = "showReorderItems"

let kPriceLowToHigh = "PLH"
let kPRiceHighToLow = "PHL"
let kByAvailable = "AVA"
let kByItem = "ITEM"
let kByNew = "NEW"
let kByCatalogPage = "PAGE"
let kBestSellers = "BEST"
let kByPrice = "PRICE"

let kCustomerNamee = "CNAME"
let kCustomerNumber = "CNO"
let kZipCode = "ZIP"
let kCity = "CITY"
let kDistance = "DIST"
let kOpenOrders = "OPNORD"
let kLast12Years = "LS12M"
let kLastOrderDate  = "LOD"

let kContactType = "CTYPE"
let kName = "CNAME"
let kPhone = "CPH"

let kClaimNumber = "CLNUM"
let kClaimAmount = "CLAMT"
let kClaimDate = "CLDT"

let kItemNo = "ITEMNO"
let kPrice = "PRC"
let kAvailbleDate = "AVLDT"
let kDesctiption = "DES"

let kQuoteNum = "QNO"
let kCustomerName = "CUST"
let kQuoteDate = "QDT"
let kCreatedBy = "CREBY"
let kRepName = "REP"
let kFollowUpDate = "FLDT"

let kAscending = "ASC"
let kDescending = "DESC"

let kOrderDate = "ORDDT"
let kShipDate = "SHPDT"
let kScheduledDate = "SCHDT"

let kLast3Months = "LST3M"
let kLast6Months = "LST6M"
let kCurrentYear = "currentYear"
let kLastYear = "lastYear"
let kBeforeLastYear = "beforeLastYear"

let kRoad = "ROAD"
let kShow = "SHOW"

let kInstockBy = "ISBBY"

let kItemNum = "ITEMNUM"
let kDescription = "DESCR"

let kBillCustomerName = "BCNAME"



let k30days = 30
let k60days = 60
let k90days = 90




let kOrdNo = "ORDNO"
let kInvoiceDate = "INVDT"
let kPoNo = "PONO"
let kOrderAmount = "ORDAMT"


let kMax_Discount_Percentage = 100.0

let kNeedSamples = "QS"
let kNoNeedSamples = "QU"

let kCompleted = "COM"
let kOpen = "OPN"
let kAll = "ALL"

let kAuthTokenKey = "YOUNGS_INC_SECRECT_AUTH_TOKEN_KEY"

let kPreviousCustomers = "PREVIOUS CUSTOMERS"

let kNewOrderNumber = "newOrderNumber"
let kNewOrderSeqNumber = "newOrderSeqNumber"

//MARK: - COLORS

let NAVY_BLUE_COLOR = UIColor.init(colorLiteralRed: 7.0/255.0, green: 68.0/255.0, blue: 119.0/255.0, alpha: 1.0)
let UI_ELEMENTS_COLOR = UIColor.init(colorLiteralRed: 11.0/255.0, green: 84.0/255.0, blue: 146.0/255.0, alpha: 1.0)
let UI_ELEMENTS_COLOR_NOALPHA = UIColor.init(colorLiteralRed: 11.0/255.0, green: 84.0/255.0, blue: 146.0/255.0, alpha: 0.2)
let LIGHT_GRAY_COLOR = UIColor.init(colorLiteralRed: 170.0/255.0, green: 170.0/255.0, blue: 170.0/255.0, alpha: 0.5)

let WHITE_PATTEREN_COLOR = UIColor(red: 225.0/255.0, green: 230.0/255.0, blue: 231.0/255.0, alpha: 1.0)
let ITEM_DETAILS_BACKGROUND_COLOR = UIColor(red: 237.0/255.0, green: 237.0/255.0, blue: 237.0/255.0, alpha: 1.0)

let MENU_SECTION_COLOR = UIColor(red: 3.0/255.0, green: 62.0/255.0, blue: 160.0/255.0, alpha: 1.0)
let CATALOG_BORDER_COLOR = UIColor(red: 23.0/255.0, green: 128.0/255.0, blue: 250.0/255.0, alpha: 1.0)

let QUOTES_SECTION_COLOR = UIColor(red: 79.0/255.0, green: 110.0/255.0, blue: 253.0/255.0, alpha: 1.0)
let QUOTES_UNSELECTED_COLOR = UIColor(red: 191.0/255.0, green: 218.0/255.0, blue: 233.0/255.0, alpha: 1.0)

let ITEM_ADDED_COLOR = UIColor(red: 0.0/255.0, green: 155.0/255.0, blue: 55.0/255.0, alpha: 1.0)
let ITEM_NOT_FOUND_COLOR = UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)

let VERY_LIGHT_GRAY_COLOR : UIColor = UIColor(red: 235.0/255.0, green: 236.0/255.0, blue: 238.0/255.0, alpha: 1.0)
let TOAST_BACKGROUND_COLOR = UIColor.init(colorLiteralRed: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 0.8)

// MARK: - ALL DEVICES TYPE CHECK

struct ScreenSize {
    
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType {
    
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH >= 1024.0
}

struct Version {
    
    static let SYS_VERSION_FLOAT = (UIDevice.current.systemVersion as NSString).floatValue
    static let iOS7 = (Version.SYS_VERSION_FLOAT < 8.0 && Version.SYS_VERSION_FLOAT >= 7.0)
    static let iOS8 = (Version.SYS_VERSION_FLOAT >= 8.0 && Version.SYS_VERSION_FLOAT < 9.0)
    static let iOS9 = (Version.SYS_VERSION_FLOAT >= 9.0 && Version.SYS_VERSION_FLOAT < 10.0)
    static let iOS10 = (Version.SYS_VERSION_FLOAT >= 10.0 && Version.SYS_VERSION_FLOAT < 11.0)
}

struct GoogleAPI {
    
    static let API_KEY = "AIzaSyD1rxhujKPF5WXgR16dT4msFf4FABU5wtk"
}

//MARK: - UITableViewCell Names

let kLoginCell = "LoginCell"
let kSignInCell = "SignInCell"
let kForgetPasswordCell = "ForgetPasswordCell"
let kItemsCell = "ItemsTableViewCell"
let kItemsCollectionCell = "ItemsCollectionViewCell"
let kItemDetailsCell = "ItemDetailsCell"
let kItemImageCell = "ItemImageCell"
let kMoreItemsCell = "MoreItemsCell"
let kSortItemsCell = "SortItemsCell"
let kFilterItemsCell = "FilterItemsCell"
let kFilterByPriceCell = "FilterByPriceCell"
let kCancelApplyCell = "CancelApplyCell"
let kCatalogCollectionCell = "CatalogCollectionCell"
let kSearchCustomerCell = "SearchCustomerCell"
let kQuotesCell = "QuoteCell"
let kDisplayOptionsCell = "DisplayOptionsCell"
let kCustomerCell = "CustomerCell"
let kCommonTextFieldCell = "CommonTextFieldCell"
let kDatesCell = "DatesCell"
let kDiscountCell = "DiscountCell"
let kHomeMenuCell = "HomeMenuCell"
let kWelcomeCell = "WelcomeCell"
let kItemStatusCell = "ItemStatusCell"
let kItemNumberCell = "ItemNumberCell"
let kNoteAndSellCell = "NoteAndSellCell"
let kStateAndCountryCell = "StateAndCountryCell"
let kQuoteItemCell = "QuoteItemCell"
let kCategoryCell = "CategoryCell"
let kCouponCell = "CouponCell"
let kBuyerCell = "BuyerCell"
let kQuoteStatusCell = "QuoteStatusCell"
let kMapViewCell = "MapTableViewCell"
let kAutoAddTableViewCell = "AutoAddTableViewCell"
let kQuantitySellTableViewCell = "QuantitySellTableViewCell"
let kNoteTableViewCell = "NoteTableViewCell"
let kOrderCategoriesTableViewCell = "OrderCategoriesTableViewCell"
let kCollectionViewCell = "CollectionViewCell"
let kListItemOuterTableViewCell = "ListItemOuterTableViewCell"
let kOrderInnerTableViewCell = "OrderInnerTableViewCell"
let kCustomerResultCell = "CustomerResultCell"
let kInnerTableViewCell = "InnerTableViewCell"
let kListOrderOuterTableViewCell = "ListOrderOuterTableViewCell"
let kListOrderInnerTableViewCell = "ListOrderInnerTableViewCell"
let kViewOrderInfoTableViewCell  = "ViewOrderInfoTableViewCell"
let kViewOrderTwoFieldsTableViewCell = "ViewOrderTwoFieldsTableViewCell"
let kViewOrderCheckMarkTableViewCell = "ViewOrderCheckMarkTableViewCell"
let kViewAddressInfoTableViewCell    = "ViewAddressInfoTableViewCell"
let kBillingAddressTableViewCell     = "BillingAddressTableViewCell"
let kBillingAddressInnerTableViewCell = "BillingAddressInnerTableViewCell"
let kStateCountryTableViewCell        = "StateCountryTableViewCell"
let kAddressTableViewCell = "AddressTableViewCell"
let kDropDownTableViewCell = "DropDownTableViewCell"
let kEmailAcceptTableViewCell = "EmailAcceptTableViewCell"
let kOrderDetailsTableViewCell = "OrderDetailsTableViewCell"
let kOrderDetailsInnerTableViewCell = "OrderDetailsInnerTableViewCell"
let kCustomButtonTableViewCell = "CustomButtonTableViewCell"
let kDisplayOrderTableViewCell = "DisplayOrderTableViewCell"
let kTotalOrderSelectionTableViewCell = "TotalOrderSelectionTableViewCell"
let kSelectAllTableViewCell = "SelectAllTableViewCell"
let kThankyouTableViewCell = "ThankyouTableViewCell"
let kFinalizeButtonTableViewCell = "FinalizeButtonTableViewCell"
let kListOrderTableViewCell  = "ListOrderTableViewCell"
let kCreditCardTableViewCell = "CreditCardTableViewCell"
let kCreditCardTwoTFTableViewCell = "CreditCardTwoTFTableViewCell"
let kCreditCardSingleTFTableViewCell = "CreditCardSingleTFTableViewCell"
let kListItemsTableViewCell = "ListItemsTableViewCell"
let kCustomerSingleTFTableViewCell = "CustomerSingleTFTableViewCell"
let kCustomerInfoTwoTFTableViewCell = "CustomerInfoTwoTFTableViewCell"
let kCustomerCheckMarkTableViewCell = "CustomerCheckMarkTableViewCell"
let kCustomerAddressTableViewCell = "CustomerAddressTableViewCell"
let kClaimInnerTableViewCell = "ClaimInnerTableViewCell"
let kClaimsListAndShareTableViewCell = "ClaimsListAndShareTableViewCell"
let kClaimOuterTableViewCell = "ClaimOuterTableViewCell"
let kListClaimsTableViewCell = "ListClaimsTableViewCell"
let kAddClaimTableViewCell = "AddClaimTableViewCell"
let kNewClaimTableViewCell = "NewClaimTableViewCell"
let kToClaimReasonVC = "ToClaimReasonVC"
let kUploadImageTableViewCell = "UploadImageTableViewCell"
let kImageCollectionViewCell = "ImageCollectionViewCell"
let kCheckMarkTableViewCell = "CheckMarkTableViewCell"
let kPreviousMonthsFilterTableViewCell = "PreviousMonthsFilterTableViewCell"
let kOrderAndShipDateTableViewCell = "OrderAndShipDateTableViewCell"
let kLastAddedItemDetailTableViewCell = "LastAddedItemDetailTableViewCell"
let kStepperTableViewCell = "StepperTableViewCell"
let kRoadShowTableViewCell = "RoadShowTableViewCell"
let kItemImageTableViewCell = "ItemImageTableViewCell"
let kItemDetailsTableViewCell = "ItemDetailsTableViewCell"
let kPrintOrderDetailsInnerTableViewCell = "PrintOrderDetailsInnerTableViewCell"
let kPrintListOrderTableViewCell = "PrintListOrderTableViewCell"
let kQuoteInnerTableViewCell = "QuoteInnerTableViewCell"
let kQuoteModelInnerTableViewCell = "QuoteModelInnerTableViewCell"
let kProfileTableViewCell = "ProfileTableViewCell"
let kGrossDisplayTableViewCell = "GrossDisplayTableViewCell"
let kInStockFilterTableViewCell = "InStockFilterTableViewCell"
let kClaimFilterTableViewCell = "ClaimFilterTableViewCell"
let kAddNewCustomerTableViewCell = "AddNewCustomerTableViewCell"
let kNewCustomerTableViewCell = "NewCustomerTableViewCell"
let kDescriptionTableViewCell = "DescriptionTableViewCell"
let kClaimsSingleTFTableViewCell = "ClaimsSingleTFTableViewCell"
let kShipDateTableViewCell = "ShipDateTableViewCell"
let kPriceCorrectionTableViewCell = "PriceCorrectionTableViewCell"
let kClaimQuantityTableViewCell = "ClaimQuantityTableViewCell"
let kClaimResolveTableViewCell = "ClaimResolveTableViewCell"
let kClaimHalfCreditTableViewCell = "ClaimHalfCreditTableViewCell"
let kClaimRefundTableViewCell = "ClaimRefundTableViewCell"
let kClaimSummaryTableViewCell = "ClaimSummaryTableViewCell"
let kClaimReturnAddressTableViewCell = "ClaimReturnAddressTableViewCell"
let kSwitchControllerCustomCell = "SwitchControllerCustomCell"
let kCustomTableViewCell = "CustomTableViewCell"
let kOrderCategoryTableViewCell = "OrderCategoryTableViewCell"
let kOrderCollectionViewCell = "OrderCollectionViewCell"
let kLeftImageNotificationTableViewCell = "LeftImageNotificationTableViewCell"
let kRightImageNotificationTableViewCell = "RightImageNotificationTableViewCell"
let kSelectDressSizeCell = "SelectDressSizeCell"
let kDiffrentDressColorsCell = "DiffrentDressColorsCell"
let kIteamDetailCell = "IteamDetailCell"
let kItemAvailabilityImPieceCell = "ItemAvailabilityImPieceCell"
let kItemMeasureCell = "ItemMeasureCell"
let kImageCollectionViewTableViewCell = "ImageCollectionViewTableViewCell"
let kCollectionItemsCollectionViewCell = "CollectionItemsCollectionViewCell"
let kCartListTableViewCell = "CartListTableViewCell"
let kCountSheetTableViewCell = "CountSheetTableViewCell"
let kOrderHeaderCustomCellTableViewCell = "OrderHeaderCustomCellTableViewCell"
let kCouponTableViewCell = "CouponTableViewCell"
let kPopOverTableViewCell = "PopOverTableViewCell"
let kPaymentInformationTableViewCell = "PaymentInformationTableViewCell"
let kOrderNumberTableViewCell  = "OrderNumberTableViewCell"
let kSharingOrderTableViewCell = "SharingOrderTableViewCell"
let kOrderCollectionViewTableViewCell = "OrderCollectionViewTableViewCell"
let kChekmarkTableViewCell = "ChekmarkTableViewCell"
let kBillingInformationCell = "BillingInformationCell"
let kAccountTitleTableViewCell = "AccountTitleTableViewCell"
let kAccountOptionsTableViewCell = "AccountOptionsTableViewCell"
let kConnectTableViewCell = "ConnectTableViewCell"
let kPersonProfileCell = "PersonProfileCell"
let kContactAddressTableViewCell = "ContactAddressTableViewCell"
let kCouponInfoTableViewCell = "CouponInfoTableViewCell"
let kChageButtonTableViewCell = "ChageButtonTableViewCell"
let kAcceptBOYesNoTableViewCell = "AcceptBOYesNoTableViewCell"
let kDueInvoicesCustomCellTableViewCell = "DueInvoicesCustomCellTableViewCell"
let kSingleLineTableViewCell = "SingleLineTableViewCell"
let kProfileReferralCodeTableViewCell = "ProfileReferralCodeTableViewCell"
let kSaveButtonTableViewCell = "SaveButtonTableViewCell"
let kListOfInvoiceAmountDetailsCell = "ListOfInvoiceAmountDetailsCell"
let kPaymentInformationAddNewCardTableViewCell = "PaymentInformationAddNewCardTableViewCell"
let kSubmittedOrderCell = "SubmittedOrderCell"
let kScheduledTableViewCell = "ScheduledTableViewCell"
let kShippedTableViewCell = "ShippedTableViewCell"
let kListOfItemCell = "ListOfItemCell"
let kOrderItemCell = "OrderItemCell"


//MARK: - UINavigation Segue Identifiers

let kFromLoginToHomeVC = "FromLoginToHomeVC"
let kFromHomeVCToNotificationsVC = "FromHomeVCToNotificationsVC"
let kToSubCategoriesVC = "ToSubCategoriesViewController"
let kFromHomeVCToSearchVC = "FromHomeVCToSearchVC"
let kFromSubCategoriesToSearchVC = "FromSubCategoriesToSearchVC"
let kFromHomeToRecentVC = "FromHomeToRecentVC"
let kFromRecentVCToSearchVC = "FromRecentVCToSearchVC"
let kFromWishListToSearchVC = "FromWishListToSearchVC"
let kFromSubCategoriesToItemDetails = "FromSubCategoriesToItemDetails"
let kFromItemDetailsToSearchVC = "FromItemDetailsToSearchVC"
let kFromRecentlyViewedToItemDetailsVC = "FromRecentlyViewedToItemDetailsVC"
let kFromSearchResultsToItemDetails = "FromSearchResultsToItemDetails"
let kFromCartListVCToItemDetailsVC = "FromCartListVCToItemDetailsVC"
let kFromWishListVCToItemDetailsVC = "FromWishListVCToItemDetailsVC"
let kFromCartVCToSearchResultsVC = "FromCartVCToSearchResultsVC"
let kFromCartToCountSheetVC = "FromCartToCountSheetVC"
let kFromCountSheetVCToSearchResultsVC = "FromCountSheetVCToSearchResultsVC"
let kFromCountSheetToItemDetails = "FromCountSheetToItemDetails"
let kFromCartListToCompleteOrder = "FromCartListToCompleteOrder"
let kFromCompleteVCToSearchResultsVC = "FromCompleteVCToSearchResultsVC"
let kFromCompleteOrderVCToTotalOrderVC = "FromCompleteOrderVCToTotalOrderVC"
let kFromCompleteOrderToOrderSummary = "FromCompleteOrderToOrderSummary"
let kFromOrderSummaryToSearchResults = "FromOrderSummaryToSearchResults"
let kFromOrderSummaryToOrderSubmission = "FromOrderSummaryToOrderSubmission"
let kFromOrderSubmittedToSearchResults = "FromOrderSubmittedToSearchResults"
let kFromOrderSummaryToCreditCardVC = "FromOrderSummaryToCreditCardVC"
let kFromCreditCardToAddNewCardVC = "FromCreditCardToAddNewCardVC"
let kFromOrderSummaryToShippingAddress = "FromOrderSummaryToShippingAddress"
let kFromOrderSummaryToBillingAddressVC = "FromOrderSummaryToBillingAddressVC"
let kFromBillingAddressToNewAddress = "FromBillingAddressToNewAddress"
let kFromShippingAddressToNewAddress = "FromShippingAddressToNewAddress"
let kFromAccountVCToInformationVC = "FromAccountVCToInformationVC"
let kFromSubmittedVCToItemDetailsVC = "FromSubmittedVCToItemDetailsVC"
let kFromAccountVCToCountSheetVC = "FromAccountVCToCountSheetVC"
let kFromAccountToOrdersVC = "FromAccountToOrdersVC"
let kFromListOrdersToSearchResultsVC = "FromListOrdersToSearchResultsVC"
let kFromMyInformationToSearchResultsVC = "FromMyInformationToSearchResultsVC"
let kFromItemDetailsToImageZoom = "FromItemDetailsToImageZoom"
let kFromAccountMenuToMakePaymentVC = "FromAccountMenuToMakePaymentVC"
let kFromPaymentVCToSearchResultsVC = "FromPaymentVCToSearchResultsVC"
let kFromMakePaymentToExistingCardsVC = "FromMakePaymentToExistingCardsVC"
let kFromMakePaymentToNewCardVC = "FromMakePaymentToNewCardVC"
let kFromOrderSummaryToAddNewCardVC = "FromOrderSummaryToAddNewCardVC"

//MARK: - Notification Center Notifications

let kSortViewDidHideNotification = "HideSortOverlayView"
let kFilterViewDidHideNotification = "HideFilterOverlayView"

let kCurrentQuotesSortViewDidHideNotification = "HideCurrentQuotesSortOverlayView"
let kCurrentQuotesFilterViewDidHideNotification = "HideCurrentQuotesFilterOverlayView"

let kPreviousQuotesSortViewDidHideNotification = "HidePreviousQuotesSortOverlayView"
let kPreviousQuotesFilterViewDidHideNotification = "HidePreviousQuotesFilterOverlayView"

let kResignKeyBoardOfSearch = "HideKeyboardOnTap"

//Customer Lookup
let kCustomerSortViewDidHideNotification = "HideCustomerSortOverlayView"
let kCustomerFilterViewDidHideNotification = "HideCustomerFilterOverlayView"

//Regex Constants
let REGEX_USER_NAME_LIMIT = "^.{3,10}$"

let REGEX_USER_NAME = "[A-Za-z0-9]{3,10}"

let REGEX_EMAIL = "[A-Z0-9a-z._%+-]{3,}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"

let REGEX_PASSWORD_LIMIT = "^.{6,20}$"

let REGEX_PASSWORD = "[A-Za-z0-9]{6,20}"

let REGEX_PHONE_DEFAULT = "[0-9]{3}\\-[0-9]{3}\\-[0-9]{4}"


*/
