import re

with open('lib/screens/home_screen.dart', 'r') as f:
    content = f.read()

# Replace FilePicker.platform.pickFiles with FilePicker.platform.pickFiles (but wait, the error said Member not found: 'platform')
# Let's see what the documentation says or try FilePicker.pickFiles()
new_content = re.sub(r'FilePicker\.platform\.pickFiles', 'FilePicker.platform.pickFiles', content) 
# Wait, if it says Member not found: 'platform', it means 'platform' doesn't exist on FilePicker.
# It should probably be FilePicker.pickFiles() directly.

new_content = re.sub(r'FilePicker\.platform\.pickFiles', 'FilePicker.pickFiles', content)

with open('lib/screens/home_screen.dart', 'w') as f:
    f.write(new_content)
