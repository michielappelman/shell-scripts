#!/usr/bin/python
#
# Check the inbox for any group emails containing links to HackerNews submitted articles.
# And delete them...
#
# Michiel Appelman <michiel.appelman@os3.nl>
#

import re, email, getpass, imaplib, json, urllib2

user = "os3_username"
pwd = "super_secret"

m = imaplib.IMAP4_SSL("imap.os3.nl")
m.login(user,pwd)
m.select("INBOX")

resp, items = m.search(None, '(TO "snestudents")')
items = items[0].split() # getting the mails id

for emailid in items:
    resp, data = m.fetch(emailid, "(RFC822)")
    email_body = data[0][1]

    urls = re.findall(r'(https?://[^\s]+)', email_body)

    for url in urls:
        hndata = json.load(urllib2.urlopen('http://api.thriftdb.com/api.hnsearch.com/items/_search?q=' + urllib2.quote(url)))
        if hndata['hits'] >= 1:
             m.store(emailid, '+FLAGS', '\\Deleted')
m.close()
m.logout()

