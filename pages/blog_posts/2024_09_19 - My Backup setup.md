---
title: My backup setup
author: Written by Sureshkumar Senthilkumar
date: 2024-09-19
# toc: true
# toc-depth: 2
---
[Back to all posts](/blog.html)


<!-- start from here -->
Im in my third of PhD and I still don't have a automated way of backing things up. Sure, I can use google drive or Dropbox. But those fail for projects with files that are in the 100,000s. I was manually copying files to different hard disks and servers. But thats tedious and easy to mess up. I wanted a simple straight forward automated 3-2-1 backup setup for my project files, where even hidden files are synced.

- 3 copies of the work (1 original and 2 backups)
- 2 different mediums
- 1 off-shore copy

So far I never stuck with a single machine to work on my projects. This is biting me in the butt now. Im starting a new project this week and I wanted to put a stop to this laziness/chaos. I wiped my lab PC and installed a fresh copy of linux. I decided Im going to stick with all my work to this machine. If I need to use a server, I will just simple "scp && run". 

Rsync has always impressed me and its something that one of my mentors preaches about. It can do all sorts of things which you would expect from a syncing tool. It can find incremental changes, it can compress your files and then send, and many more. So I wrote a simple bash script to use ``rsync`` to make backups of a folder. The script only backs up incremental changes and also deletes the oldest backup when the set limit is reached. The ``--link-dest`` flag is used to direct to the last backup and then sync only new changes.I use two ``cronjob``s to run this script twice:

- One, every hour, to backup to my external hard drive in the same PC
- two, three times a day, to backup to my lab's server's external archival HDD.

I have set a limit of 24 on my local backup cron job and a limit of 30 on my server backup cron job. Therefore I can retrieve files from any hour, in the last 24 hours and also from any day in the last 10 days.

You can find these two scripts on [my github gists](https://gist.github.com/0x536b/26792a1a3905e11515e997982420eb07). 
<!-- <script src="https://gist.github.com/0x536b/26792a1a3905e11515e997982420eb07.js"></script> -->



<!-- finish above here -->


[Back to all posts](/blog.html)