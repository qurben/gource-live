gource-live
-----------

This program will launch gource, and everytime a commit is pushed it updates.

Setup
=====
### github
Add the gource-live url to your github repo

### self-hosted
Add `curl -X POST <live-gource-url>` to hooks/pos-receive on the server