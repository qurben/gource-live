gource-live
===========

This program will launch gource, and every time a commit is pushed it updates.

Setup
-----
Run `coffee app.coffee` on the gource-live presentation machine.

Each developer must add the `client/post-commit` and `client/notify.py` to the `.git/hooks` folder of their repository and change the `destination` value in `notify.py`.

Now, each time a developer commits a change it is send to the presentation machine.