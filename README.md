gource-live
===========

This program will launch gource, and every time a commit is created it updates.

Setup
-----
Run `coffee app.coffee` on the gource-live presentation machine.

Each developer must add the `client/post-commit` and `client/notify.py` to the `.git/hooks` folder of their repository and change the `destination` value in `notify.py`.

Now, each time a developer commits a change it is send to the presentation machine.

The software relies on every developer having the notify hook installed. It doesn't detect any changes from a source without the hook installed.
