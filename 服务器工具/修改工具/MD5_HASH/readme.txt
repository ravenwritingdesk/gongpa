


HashMyFiles v2.01
Copyright (c) 2007 - 2013 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

HashMyFiles is small utility that allows you to calculate the MD5 and
SHA1 hashes of one or more files in your system. You can easily copy the
MD5/SHA1 hashes list into the clipboard, or save them into text/html/xml
file.
HashMyFiles can also be launched from the context menu of Windows
Explorer, and display the MD5/SHA1 hashes of the selected file or folder.



System Requirements
===================

This utility works on Windows 2000/XP/2003/Vista/Windows 7/Windows 8.
Older versions of Windows are not supported.



Versions History
================


* Version 2.01:
  o If SHA256 hash is not active, 'Open In VirusTotal Web site'
    option now works with MD5 hashes.

* Version 2.00:
  o Added 'Open In VirusTotal Web site' option. (Works only when
    SHA256 hash is active)
    If you have a software file that other people already submitted to
    VirusTotal, this option will open a Web page in VirusTotal Web site
    with the Antivirus scanning result.

* Version 1.97:
  o You can now use environment strings in the 'Add Folder' and 'Add
    By Wildcard' options (For example: %AppData%\*.* )
  o Added 64-bit build.

* Version 1.96:
  o Fixed bug: HashMyFiles displayed hashes for empty files, and
    marked them as identical to the string in the clipboard.
  o Fixed the flickering while scrolling the hash list.

* Version 1.95:
  o When selecting one or more files located on a remote network and
    choosing 'Move To Recycle Bin', HashMyFiles now asks you whether you
    want to delete the files, because remote network files cannot be sent
    to Recycle Bin.
  o When HashMyFiles asks you whether to delete files or move them to
    Recycle Bin, the default answer is now set to 'No'.
  o Accelerator keys change: Del key is now used for 'Remove Selected
    Files' option.
  o Added 'Mark Odd/Even Rows' option, under the View menu. When it's
    turned on, the odd and even rows are displayed in different color, to
    make it easier to read a single line.
  o Added 'Auto Size Columns+Headers' option, which allows you to
    automatically resize the columns according to the row values and
    column headers.

* Version 1.90:
  o Fixed bug: HashMyFiles failed to detect identical files properly
    if the user unchecked the MD5, SHA1, and CRC32 hash types.

* Version 1.89:
  o Fixed bug: HashMyFiles didn't display any hash if the user
    unchecked the MD5, SHA1, and CRC32 hash types.

* Version 1.88:
  o Fixed the 'Mark Hash In Clipboard' option to work with CRC32.

* Version 1.87:
  o Fixed bug: The 'Mark Hash In Clipboard' option failed to work
    with the SHA-256, SHA-512, and SHA-384 hashes.

* Version 1.86:
  o Fixed bug: HashMyFiles failed to display the size and date/time
    information for a filename that begins with dot character.

* Version 1.85:
  o Added support for SHA-384 hashes. (Supported on Windows XP/SP3,
    Windows Vista, Windows 7, Windows Server 2003, and Windows Server
    2008)

* Version 1.81:
  o Added 'CRC32 Display Mode' - Hexadecimal or Decimal.

* Version 1.80:
  o Added support for SHA-256 and SHA-512 hashes. These hashes are
    supported on Windows XP/SP3, Windows Vista, Windows 7, Windows Server
    2003, and Windows Server 2008.

* Version 1.72:
  o You can now drag one or more files from the window of HashMyFiles
    into Explorer window or other application.

* Version 1.71:
  o Added 'Remove Selected Files' (Ctrl+R), which remove the selected
    files from the list of hashes.

* Version 1.70:
  o Added 'Add Header Line To CSV/Tab-Delimited File' option. When
    this option is turned on, the column names are added as the first
    line when you export to csv or tab-delimited file.

* Version 1.68:
  o Added 'Copy CRC32' to the context menu.

* Version 1.67:
  o Added 'Copy CRC32' option.

* Version 1.66:
  o In 'Add By Wildcard' window, the browse button now works properly.

* Version 1.65:
  o Added 'Add By Wildcard' option (F6), which allows you to add
    multiple files by specifying wildcard and subfolder depth.
  o Added /wildcard command-line option for using the new 'Add By
    Wildcard' option from command-line.

* Version 1.61:
  o Fixed bug: Export to .csv files didn't work well if one of the
    values contained comma characters.

* Version 1.60:
  o Added 'File Attributes' column.
  o Added 'Show Time in GMT' option.
  o Added 'Move To Recycle Bin' option.
  o Fixed missing icons problem in Windows7/x64.

* Version 1.55:
  o Added 'Delete Selected Files' option, which allows you to easily
    delete duplicated files.

* Version 1.52:
  o Added sorting command-line options.

* Version 1.51:
  o Fixed bug: Modified Time and Created Time displayed the same
    date/time.

* Version 1.50:
  o Added 'Explorer Paste' option, which allows you to paste a list
    of files that copied from Explorer window or from any other software
    that copy files to the clipboard, including some utilities of
    NirSoft, like SearchMyFiles, IECacheView, and RegDllView. (by using
    the 'Explorer Copy' option)

* Version 1.47:
  o Fixed bug: Save command-line options failed to work in the last
    release.

* Version 1.46:
  o Fixed issue: When HashMyFiles window is hidden and there is an
    icon in the taskbar, running HashMyFiles again will open the existing
    instance of HashMyFiles, instead of creating another one.

* Version 1.45:
  o Added 'Put Icon In Tray' option.

* Version 1.43:
  o When you specify empty string ("") in the /folder command-line
    option, HashMyFiles will now use the current folder.

* Version 1.42:
  o Added AutoComplete to select folder dialog-box

* Version 1.41:
  o Fixed bug: 'Mark Hash In Clipboard' option marked all hashes when
    one or more hash types were deselected.

* Version 1.40:
  o Added 'Hash Types' sub-menu under options. Allows you to select
    which types of hashes you want to calculate.

* Version 1.37:
  o Fixed bug: When dragging a file into HashMyFiles window while
    it's already processed by HashMyFiles, the file was added multiple
    times.

* Version 1.36:
  o Fixed bug: When 'Add files in subfolders' was selected, only
    sub-folders files were added.

* Version 1.35:
  o Added 'Select Folder' dialog-box.
  o Added new option: 'Add files in subfolders'.
  o Added /folders command-line option
  o Added file extension column.
  o 'Select Process' dialog-box is now resizable.

* Version 1.31:
  o Added support for adding multiple files in 'Add File' option.

* Version 1.30:
  o Added new columns: File Version and Product Version. (for exe and
    dll files)

* Version 1.29:
  o Fixed bug: The main window lost the focus when the user switched
    to another application and then returned back to HashMyFiles.

* Version 1.28:
  o Display single file progress information (in percent) while
    hashing large files.

* Version 1.27:
  o Added new file type in save - comma-delimited file (.csv)
  o Added new command-line option - /scomma

* Version 1.26:
  o 'Mark Identical Hashes' option - now also works with saved HTML
    files and HTML reports.

* Version 1.25:
  o Add new column: 'Identical' - When there are 2 or more identical
    hashes, this column is filled with a number (1 for the first
    identical hashes, 2 for the second, and so on...)
  o Add 'Mark Identical Hashes' option - Mark identical hashes with
    up to 8 different colors.

* Version 1.20:
  o Fixed bug: When using 'Add Process Files' option, the filenames
    displayed in short path format.

* Version 1.19:
  o New command-line option: /files (support for loading multiple
    files)

* Version 1.18:
  o Fixed bug in Unicode version: wrong characters added to clipboard
    copy option.

* Version 1.17:
  o Added 'Mark Hash In Clipboard' option. If this options is
    selected, the hash that you copy to the clipboard is compared to the
    MD5/SHA1 hashes that are currently displayed in HashMyFiles. If there
    is a match, the hash line is marked in green color.

* Version 1.16:
  o Added 'FF FE' characters in the beginning of the saved Unicode
    files (Unicode version only).

* Version 1.15:
  o Fixed bug: HashMyFiles remained in memory if you closed it while
    calculating hashes.
  o New option: 'Add Process Files' - Allows you to get the hashes of
    all DLL files of the selected process.

* Version 1.10:
  o Explorer Context Menu - If an instance of HashMyFiles is already
    running, the selected files will be added to the existing instance,
    instead of creating a new one.
  o File icons are now displayed according to the file type.
  o New option: Always On Top.
  o Added 'Stop' menu item while calculating the hashes.
  o Added CRC32 calculations.
  o Added new columns: Modified Time, Created Time, and File Size.

* Version 1.00 - First Release.



Using HashMyFiles
=================

HashMyFiles doesn't require any installation process or additional DLL
files. In order to start using it, simply run the executable file
(HashMyFiles.exe).
After you run it, you can add files and folders that you want to view
their MD5/SHA1 hashes. You can do it by using the 'Add File' and 'Add
Folder' options under the File menu, or simply by draging the files and
folder from Explorer into the main window of HashMyFiles.
After adding the desired files, you can copy the MD5/SHA1 hashes to the
clipboard, or save the hashes list into text/html/xml file.



Explorer Context Menu
=====================

HashMyFiles can also be used directly from Windows Explorer. In order to
enable this feature, go to the Options menu, and choose the 'Enable
Explorer Context Menu' option. After you enable this feature, you can
right-click on any file or folder on Windows Explorer, and choose the
'HashMyFiles' item from the menu.
If you run the HashMyFiles option for a folder, it'll display the hashes
for all files in the selected folder.
If you run the HashMyFiles option for a single file, it'll display only
the hashes for that file.

Notice: Static menu items of Explorer do not support multiple file
selection. If you want to get the hash of multiple files from Explorer
window, use Copy & Explorer Paste, or drag the files into the HashMyFiles
window.




Command-Line Options
====================



/file <Filename | Folder | Wildcard>
Specifies the filename, folder, or wildcard that you want to hash.

/files <Filename> <Filename> <Filename> ...
Specify multiple filenames, folders, or wildcards that you want to hash.

/folder <Folder>
Specifies a folder and all its subfolders.

/wildcard <Full Path Wildcard> <Subfolder Depth>
Specifies wildcard with full path (e.g: c:\folder\*.exe) and the depth of
subfolders to scan. For <Subfolder Depth> parameter: 0 = no subfolders, 1
= one level of subfolders, 2 = two level of subfolders, and so on... 1000
= Infinite number of subfolders.

/stext <Filename>
Save the hashes list into a regular text file.

/stab <Filename>
Save the hashes list into a tab-delimited text file.

/stabular <Filename>
Save the hashes list into a tabular text file.

/shtml <Filename>
Save the hashes list into HTML file (Horizontal).

/sverhtml <Filename>
Save the hashes list into HTML file (Vertical).

/sxml <Filename>
Save the hashes list to XML file.

/scomma <Filename>
Save the hashes list to comma-delimited file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "Filename" and "Identical". You can specify the '~' prefix character
(e.g: "~Identical") if you want to sort in descending order. You can put
multiple /sort in the command-line if you want to sort by multiple
columns.



/nosort
When you specify this command-line option, the list will be saved without
any sorting.

Examples:
HashMyFiles.exe /file "c:\temp\*.zip" /shtml "c:\temp\1.html"
HashMyFiles.exe /file "d:\temp\myfile.zip" /stab "d:\temp\myfile.txt"
HashMyFiles.exe /file "d:\my files"
HashMyFiles.exe /files "c:\temp\*.zip" "c:\temp\1234.exe"
"c:\temp\Hello.exe" /shtml "c:\temp\1.html"
HashMyFiles.exe /folder "c:\temp" /shtml "c:\temp\1.html"
HashMyFiles.exe /folder "c:\temp" /shtml "c:\temp\1.html" /sort
"Identical" /sort "Filename"
HashMyFiles.exe /folder "c:\temp" /shtml "c:\temp\1.html" /sort ~1
HashMyFiles.exe /wildcard "c:\temp\*.zip" 1 /shtml "c:\temp\1.html"



Translating HashMyFiles to other languages
==========================================

In order to translate HashMyFiles to other language, follow the
instructions below:
1. Run HashMyFiles with /savelangfile parameter:
   HashMyFiles.exe /savelangfile
   A file named HashMyFiles_lng.ini will be created in the folder of
   HashMyFiles utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run HashMyFiles, and all
   translated strings will be loaded from the language file.
   If you want to run HashMyFiles without the translation, simply rename
   the language file, or move it to another folder.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via floppy disk, CD-ROM, Internet, or in any
other way, as long as you don't charge anything for this. If you
distribute this utility, you must include all files in the distribution
package, without any modification !



Disclaimer
==========

The software is provided "AS IS" without any warranty, either expressed
or implied, including, but not limited to, the implied warranties of
merchantability and fitness for a particular purpose. The author will not
be liable for any special, incidental, consequential or indirect damages
due to loss of data or any other reason.



Feedback
========

If you have any problem, suggestion, comment, or you found a bug in my
utility, you can send a message to nirsofer@yahoo.com
