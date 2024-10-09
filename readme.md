# Music Playlist Automation with AppleScript

This AppleScript automates the process of adding audio files from a folder (and its subfolders) to the Apple Music app and creating a playlist with the current date and time as the title.

## Features
- Automatically creates a new playlist in Apple Music named with the current date and time.
- Recursively processes folders at any depth, adding audio files (`.mp3`, `.m4a`, `.flac`, `.wav`, `.aiff`) to the playlist.
- Supports dynamic detection of folders and files within any added directory.
  
## How It Works
1. A folder action is triggered when files or folders are added to a specified directory.
2. The script identifies audio files in the folder or subfolders.
3. It adds the audio files to the Apple Music library and automatically creates a new playlist.
4. Files are recursively processed, ensuring even deeply nested files are added.

## Setup
1. Attach the script to a folder using **Folder Actions Setup** on macOS.
2. Once the script is attached, any audio files added to that folder (or its subfolders) will be automatically processed.

## Usage
Simply drag and drop audio files or folders into the monitored directory. A playlist named with the current date and time will be created in Apple Music with the audio files added.

## Requirements
- macOS
- Apple Music app
