   Select
convert(char(10), e.ActionDateTime,120) as Date,
e.MessageID as JobID,
e.IsTest as IsTest,
CampaignID as Campaign,
e.KeywordID as Keyword,
e.Sent as Sent,
e.Delivered as Received,
e.Undelivered as Skipped,
e.Unsub as Unsubscribes,
e.SendSplitID,
e.SendJobID,
e.MessageText,
e.SubscriberID,
e.SendID,
e.Mobile,
e.MobileMessageTrackingID,
e.EID,
e.MID,
e.CodeID,
e.ConversationID

From _smsmessagetracking e
where MessageID = 26
or MessageID = 39
OR MessageID = 40