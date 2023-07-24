# Project Documentation

This project provides a Python class named `Zoom` for managing and launching Zoom meetings.  
The project reads from a configuration file, extracts meeting configuration details such as meeting id and password and launches the Zoom meeting based on that.

## Prerequisites

The script is written in Python, hence ensure you have Python 3 installed in your environment. Also, this script makes use of `json` and `urllib` standard Python libraries.

## Configuration

You need to provide a zoom configuration file. The file should contain meeting aliases as keys, and for each alias, a dictionary containing keys `meeting_id` and `meeting_password`.  
Here is an example of a `zoom.config.json` file:

```json
{
   "test_meeting":{
      "meeting_id":"123456789",
      "meeting_password":"abc123"
   }, 
   "another_meeting":{
      "meeting_id":"987654321",
      "meeting_password":"def456"
   }
}
```

## Execution
To execute the script, pass in your meeting alias as a command line argument. For instance, to launch the test_meeting found in the configuration file, run:

```shell
python zoom.py "zoom.config.json" "123"
```

You can also export in your `.zshrc` file

```shell
source "$WU_FOLDER/zoom/zoom.sh"
```