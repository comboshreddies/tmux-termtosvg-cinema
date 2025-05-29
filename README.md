# tmux-termtosvg-cinema
Replay cli terminal demo for purpose of recording via termtosvg by using tmux

For kubectl-tks repo I wanted to have repeatable command line interface demo
I've created awk script that commands tmux what to do by reading textual file

this is early but functional version of a script

run tmux on one console, and on other run
cat demo2.ttc | ./run_demo.sh

In some tks demos I've did ssh to remote machine and I've executed tmux instructions
on remote machine.

TTC file parsing rules:
* if line starts with #C , everything after is considered as a command so executed
* if lines start with "banner" "reset" "termtosvg" and "exit" those lines would be sent 
as a complete line
* in any other case line would be executed character by character, like someone
is typing terminal demo with following rules:
  * if there are two consecutive ' ' characters that would make a second pause
  * single qoute chart "'" would be speciall handled
  * ; and  \  characters are escape quoted ie "\\" when sending
