// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Gmail API (gmail/v1)
// Description:
//   Access Gmail mailboxes including sending user email.
// Documentation:
//   https://developers.google.com/gmail/api/

#import "GTLRGmailObjects.h"

// ----------------------------------------------------------------------------
// Constants

// GTLRGmail_AutoForwarding.disposition
NSString * const kGTLRGmail_AutoForwarding_Disposition_Archive = @"archive";
NSString * const kGTLRGmail_AutoForwarding_Disposition_DispositionUnspecified = @"dispositionUnspecified";
NSString * const kGTLRGmail_AutoForwarding_Disposition_LeaveInInbox = @"leaveInInbox";
NSString * const kGTLRGmail_AutoForwarding_Disposition_MarkRead = @"markRead";
NSString * const kGTLRGmail_AutoForwarding_Disposition_Trash   = @"trash";

// GTLRGmail_FilterCriteria.sizeComparison
NSString * const kGTLRGmail_FilterCriteria_SizeComparison_Larger = @"larger";
NSString * const kGTLRGmail_FilterCriteria_SizeComparison_Smaller = @"smaller";
NSString * const kGTLRGmail_FilterCriteria_SizeComparison_Unspecified = @"unspecified";

// GTLRGmail_ForwardingAddress.verificationStatus
NSString * const kGTLRGmail_ForwardingAddress_VerificationStatus_Accepted = @"accepted";
NSString * const kGTLRGmail_ForwardingAddress_VerificationStatus_Pending = @"pending";
NSString * const kGTLRGmail_ForwardingAddress_VerificationStatus_VerificationStatusUnspecified = @"verificationStatusUnspecified";

// GTLRGmail_ImapSettings.expungeBehavior
NSString * const kGTLRGmail_ImapSettings_ExpungeBehavior_Archive = @"archive";
NSString * const kGTLRGmail_ImapSettings_ExpungeBehavior_DeleteForever = @"deleteForever";
NSString * const kGTLRGmail_ImapSettings_ExpungeBehavior_ExpungeBehaviorUnspecified = @"expungeBehaviorUnspecified";
NSString * const kGTLRGmail_ImapSettings_ExpungeBehavior_Trash = @"trash";

// GTLRGmail_Label.labelListVisibility
NSString * const kGTLRGmail_Label_LabelListVisibility_LabelHide = @"labelHide";
NSString * const kGTLRGmail_Label_LabelListVisibility_LabelShow = @"labelShow";
NSString * const kGTLRGmail_Label_LabelListVisibility_LabelShowIfUnread = @"labelShowIfUnread";

// GTLRGmail_Label.messageListVisibility
NSString * const kGTLRGmail_Label_MessageListVisibility_Hide = @"hide";
NSString * const kGTLRGmail_Label_MessageListVisibility_Show = @"show";

// GTLRGmail_Label.type
NSString * const kGTLRGmail_Label_Type_System = @"system";
NSString * const kGTLRGmail_Label_Type_User   = @"user";

// GTLRGmail_PopSettings.accessWindow
NSString * const kGTLRGmail_PopSettings_AccessWindow_AccessWindowUnspecified = @"accessWindowUnspecified";
NSString * const kGTLRGmail_PopSettings_AccessWindow_AllMail   = @"allMail";
NSString * const kGTLRGmail_PopSettings_AccessWindow_Disabled  = @"disabled";
NSString * const kGTLRGmail_PopSettings_AccessWindow_FromNowOn = @"fromNowOn";

// GTLRGmail_PopSettings.disposition
NSString * const kGTLRGmail_PopSettings_Disposition_Archive    = @"archive";
NSString * const kGTLRGmail_PopSettings_Disposition_DispositionUnspecified = @"dispositionUnspecified";
NSString * const kGTLRGmail_PopSettings_Disposition_LeaveInInbox = @"leaveInInbox";
NSString * const kGTLRGmail_PopSettings_Disposition_MarkRead   = @"markRead";
NSString * const kGTLRGmail_PopSettings_Disposition_Trash      = @"trash";

// GTLRGmail_SendAs.verificationStatus
NSString * const kGTLRGmail_SendAs_VerificationStatus_Accepted = @"accepted";
NSString * const kGTLRGmail_SendAs_VerificationStatus_Pending  = @"pending";
NSString * const kGTLRGmail_SendAs_VerificationStatus_VerificationStatusUnspecified = @"verificationStatusUnspecified";

// GTLRGmail_SmtpMsa.securityMode
NSString * const kGTLRGmail_SmtpMsa_SecurityMode_None          = @"none";
NSString * const kGTLRGmail_SmtpMsa_SecurityMode_SecurityModeUnspecified = @"securityModeUnspecified";
NSString * const kGTLRGmail_SmtpMsa_SecurityMode_Ssl           = @"ssl";
NSString * const kGTLRGmail_SmtpMsa_SecurityMode_Starttls      = @"starttls";

// GTLRGmail_WatchRequest.labelFilterAction
NSString * const kGTLRGmail_WatchRequest_LabelFilterAction_Exclude = @"exclude";
NSString * const kGTLRGmail_WatchRequest_LabelFilterAction_Include = @"include";

// ----------------------------------------------------------------------------
//
//   GTLRGmail_AutoForwarding
//

@implementation GTLRGmail_AutoForwarding
@dynamic disposition, emailAddress, enabled;
@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_BatchDeleteMessagesRequest
//

@implementation GTLRGmail_BatchDeleteMessagesRequest
@dynamic ids;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"ids" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_BatchModifyMessagesRequest
//

@implementation GTLRGmail_BatchModifyMessagesRequest
@dynamic addLabelIds, ids, removeLabelIds;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"addLabelIds" : [NSString class],
    @"ids" : [NSString class],
    @"removeLabelIds" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_Draft
//

@implementation GTLRGmail_Draft
@dynamic identifier, message;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"identifier" : @"id" };
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_Filter
//

@implementation GTLRGmail_Filter
@dynamic action, criteria, identifier;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"identifier" : @"id" };
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_FilterAction
//

@implementation GTLRGmail_FilterAction
@dynamic addLabelIds, forward, removeLabelIds;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"addLabelIds" : [NSString class],
    @"removeLabelIds" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_FilterCriteria
//

@implementation GTLRGmail_FilterCriteria
@dynamic excludeChats, from, hasAttachment, negatedQuery, query, size,
         sizeComparison, subject, to;
@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_ForwardingAddress
//

@implementation GTLRGmail_ForwardingAddress
@dynamic forwardingEmail, verificationStatus;
@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_History
//

@implementation GTLRGmail_History
@dynamic identifier, labelsAdded, labelsRemoved, messages, messagesAdded,
         messagesDeleted;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"identifier" : @"id" };
}

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"labelsAdded" : [GTLRGmail_HistoryLabelAdded class],
    @"labelsRemoved" : [GTLRGmail_HistoryLabelRemoved class],
    @"messages" : [GTLRGmail_Message class],
    @"messagesAdded" : [GTLRGmail_HistoryMessageAdded class],
    @"messagesDeleted" : [GTLRGmail_HistoryMessageDeleted class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_HistoryLabelAdded
//

@implementation GTLRGmail_HistoryLabelAdded
@dynamic labelIds, message;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"labelIds" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_HistoryLabelRemoved
//

@implementation GTLRGmail_HistoryLabelRemoved
@dynamic labelIds, message;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"labelIds" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_HistoryMessageAdded
//

@implementation GTLRGmail_HistoryMessageAdded
@dynamic message;
@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_HistoryMessageDeleted
//

@implementation GTLRGmail_HistoryMessageDeleted
@dynamic message;
@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_ImapSettings
//

@implementation GTLRGmail_ImapSettings
@dynamic autoExpunge, enabled, expungeBehavior, maxFolderSize;
@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_Label
//

@implementation GTLRGmail_Label
@dynamic identifier, labelListVisibility, messageListVisibility, messagesTotal,
         messagesUnread, name, threadsTotal, threadsUnread, type;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"identifier" : @"id" };
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_ListDraftsResponse
//

@implementation GTLRGmail_ListDraftsResponse
@dynamic drafts, nextPageToken, resultSizeEstimate;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"drafts" : [GTLRGmail_Draft class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"drafts";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_ListFiltersResponse
//

@implementation GTLRGmail_ListFiltersResponse
@dynamic filter;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"filter" : [GTLRGmail_Filter class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_ListForwardingAddressesResponse
//

@implementation GTLRGmail_ListForwardingAddressesResponse
@dynamic forwardingAddresses;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"forwardingAddresses" : [GTLRGmail_ForwardingAddress class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_ListHistoryResponse
//

@implementation GTLRGmail_ListHistoryResponse
@dynamic history, historyId, nextPageToken;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"history" : [GTLRGmail_History class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"history";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_ListLabelsResponse
//

@implementation GTLRGmail_ListLabelsResponse
@dynamic labels;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"labels" : [GTLRGmail_Label class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_ListMessagesResponse
//

@implementation GTLRGmail_ListMessagesResponse
@dynamic messages, nextPageToken, resultSizeEstimate;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"messages" : [GTLRGmail_Message class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"messages";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_ListSendAsResponse
//

@implementation GTLRGmail_ListSendAsResponse
@dynamic sendAs;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"sendAs" : [GTLRGmail_SendAs class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_ListSmimeInfoResponse
//

@implementation GTLRGmail_ListSmimeInfoResponse
@dynamic smimeInfo;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"smimeInfo" : [GTLRGmail_SmimeInfo class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_ListThreadsResponse
//

@implementation GTLRGmail_ListThreadsResponse
@dynamic nextPageToken, resultSizeEstimate, threads;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"threads" : [GTLRGmail_Thread class]
  };
  return map;
}

+ (NSString *)collectionItemsKey {
  return @"threads";
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_Message
//

@implementation GTLRGmail_Message
@dynamic historyId, identifier, internalDate, labelIds, payload, raw,
         sizeEstimate, snippet, threadId;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"identifier" : @"id" };
}

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"labelIds" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_MessagePart
//

@implementation GTLRGmail_MessagePart
@dynamic body, filename, headers, mimeType, partId, parts;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"headers" : [GTLRGmail_MessagePartHeader class],
    @"parts" : [GTLRGmail_MessagePart class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_MessagePartBody
//

@implementation GTLRGmail_MessagePartBody
@dynamic attachmentId, data, size;
@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_MessagePartHeader
//

@implementation GTLRGmail_MessagePartHeader
@dynamic name, value;
@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_ModifyMessageRequest
//

@implementation GTLRGmail_ModifyMessageRequest
@dynamic addLabelIds, removeLabelIds;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"addLabelIds" : [NSString class],
    @"removeLabelIds" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_ModifyThreadRequest
//

@implementation GTLRGmail_ModifyThreadRequest
@dynamic addLabelIds, removeLabelIds;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"addLabelIds" : [NSString class],
    @"removeLabelIds" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_PopSettings
//

@implementation GTLRGmail_PopSettings
@dynamic accessWindow, disposition;
@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_Profile
//

@implementation GTLRGmail_Profile
@dynamic emailAddress, historyId, messagesTotal, threadsTotal;
@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_SendAs
//

@implementation GTLRGmail_SendAs
@dynamic displayName, isDefault, isPrimary, replyToAddress, sendAsEmail,
         signature, smtpMsa, treatAsAlias, verificationStatus;
@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_SmimeInfo
//

@implementation GTLRGmail_SmimeInfo
@dynamic encryptedKeyPassword, expiration, identifier, isDefault, issuerCn, pem,
         pkcs12;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"identifier" : @"id" };
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_SmtpMsa
//

@implementation GTLRGmail_SmtpMsa
@dynamic host, password, port, securityMode, username;
@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_Thread
//

@implementation GTLRGmail_Thread
@dynamic historyId, identifier, messages, snippet;

+ (NSDictionary<NSString *, NSString *> *)propertyToJSONKeyMap {
  return @{ @"identifier" : @"id" };
}

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"messages" : [GTLRGmail_Message class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_VacationSettings
//

@implementation GTLRGmail_VacationSettings
@dynamic enableAutoReply, endTime, responseBodyHtml, responseBodyPlainText,
         responseSubject, restrictToContacts, restrictToDomain, startTime;
@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_WatchRequest
//

@implementation GTLRGmail_WatchRequest
@dynamic labelFilterAction, labelIds, topicName;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"labelIds" : [NSString class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRGmail_WatchResponse
//

@implementation GTLRGmail_WatchResponse
@dynamic expiration, historyId;
@end
