# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# JAVA
# export JAVA_HOME=~/Applications/jdk1.6.0_25

# ANT
export ANT_HOME=~/Applications/apache-ant-1.8.4

# PLAY
export PLAY_HOME=~/Applications/play-2.0.2

# MAVEN
export MAVEN_HOME=~/Applications/apache-maven-3.0.3

# TOMCAT6
export TOMCAT_HOME=~/Applications/apache-tomcat-6.0.35

export PATH=$PATH:$MAVEN_HOME/bin:$PLAY_HOME:~/.cabal/bin:~/bin:.

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

export  GTK_IM_MODULE=ibus
export  QT_IM_MODULE=ibus
export  XMODIFIERS=@im=ibus

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

`echo $- | grep -qs i` && which byobu-launcher > /dev/null && byobu-launcher && exit
