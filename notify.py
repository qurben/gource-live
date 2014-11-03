import os

from subprocess import check_output
import time
from urllib.request import Request, urlopen

def main():
    os.chdir('../..')
    username = check_output(['git', 'config', '--get', 'user.name']).decode().replace('\n', '')
    commithash = check_output(['git', 'log', '--format=format:%H', '-1']).decode()
    changes = check_output(['git', 'diff', '--name-status', commithash]).decode()
    changeslist = changes.splitlines();

    out = ''
    for change in changeslist:
        data = change.split('\t')
        out += '%s|%s|%s|%s\n' % (int(time.time()), username, data[0], data[1])

    print('change: %s' %out.encode())

    req = Request('http://localhost:3000', data=out.encode())
    req.add_header('X-Git-Event', 'commit')

    resp = urlopen(req)
    print(resp.read())
    
if __name__=="__main__":
    main()
