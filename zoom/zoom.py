import json
from urllib.parse import urlencode
import sys
import subprocess

class Zoom: 
    def __init__(self, config_file_path: str):
        with open(config_file_path, 'r', encoding='utf-8') as config_file:
            self.config = json.load(config_file)

    def read_config(self, meeting_alias: str):
        meeting_alias = self.config.get(meeting_alias)
        if not meeting_alias:
            print('Meeting alias not found')
            sys.exit(1)
        
        meeting_id = meeting_alias.get('meeting_id')
        meeting_password = meeting_alias.get('meeting_password')
        if not meeting_id or not meeting_password:
            print('Meeting id or password not found')
            sys.exit(1)
        
        return meeting_id, meeting_password
    
    def start_meeting(self, meeting_alias: str):
        url = 'zoommtg://zoom.us/join?'
        meeting_id, meeting_password = self.read_config(meeting_alias)
        command = url + urlencode({
            'confno': meeting_id,
            'pwd': meeting_password,
        })
        print("Opening Zoom meeting")
        return subprocess.run(["open", command], check=True)



if __name__ == '__main__':
    if len(sys.argv) < 3:
        print('Usage: python zoom.py <config_file_path> <meeting_alias>')
        sys.exit(1)

    Zoom(sys.argv[1]).start_meeting(sys.argv[2])
    sys.exit(0)
