gource-live
===========

This program will launch gource, and everytime a commit is pushed it updates.

Setup
-----
### github
Add the gource-live url to your github repo

### self-hosted
Add `curl -X POST --header "X-Git-Event: push" <live-gource-url> &` to hooks/post-receive on the server

or for a Windows server add `Invoke-RestMethod -Method POST -Headers @{'X-Git-Event'='push'} <live-gource-url>` to hooks/post-receive on the server