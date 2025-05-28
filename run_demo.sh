#!/bin/bash
cat $1 | \
grep -v "^##" | \
awk '{ 
  if (length($0)==0) { system("sleep 2"); } \
  if($0 ~ "#C") {system(substr($0,3,100))} else \
      { if ($1 ~ "^banner" || $1 ~ "^reset" || $1 ~ "^termtosvg" || $1 ~ "exit") { \
                a="tmux send-keys -t 0 \047" $0 " \n\047";system(a);system("sleep 2") \
            } else { \
                for(i=1;i<=length($0);i++) { \
                    x=substr($0,i,1); \
                    if(p==" " && x== " ") { system("sleep 1")}; \
                    if(x == ";" || x == "\\") { x = "\\"x} \
                    if(x == "\047"){ \
                        system("tmux send-keys -l -t 0 \"" x "\"") \
                    }else{ \
                        system("tmux send-keys -l -t 0 \047" x "\047") } ; \
                   system("sleep 0.04");p=x; \
                } \
                system("tmux send-keys -c /dev/ttys000 -t 0 \047\n\047"); \ 
                system("sleep 2"); \
            } \
      } \
}'

