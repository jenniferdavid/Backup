# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/jendav/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


######## Stage and Player ######################################
export CMAKE_INCLUDE_PATH=/usr/local/include 
export CMAKE_LIBRARY_PATH=/usr/local/lib 
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/local/lib64:/usr/lib 
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib64/pkgconfig/
export STAGEPATH=/usr/local/lib:/home/jendav/stage4:/usr/local/lib64:/usr/local/lib:/home/jendav/stg:/home/jendav/Stage-3.2.2-Source
export PLAYERPATH=/usr/local/lib:/home/jendav/player-3.0.2:/usr/local/lib64
export TURTLEBOT_STAGE_WORLD_FILE="/opt/ros/indigo/share/turtlebot_stage/maps/stage/maze.world"
export TURTLEBOT_STAGE_MAP_FILE="/opt/ros/indigo/share/turtlebot_stage/maps/maze.yaml"

######## ArduPilot ############################################
export PATH=$PATH:$HOME/ardupilot/Tools/autotest
export PATH=/usr/lib/ccache:$PATH
export PATH=/usr/lib/ccache:/opt/ros/indigo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/jendav/ardupilot/Tools/autotest:/home/jendav/.local/bin

######## Matlab ###############################################
alias matlab="/usr/local/MATLAB/R2017a/bin/matlab"

######### ROS indigo setup ####################################
ROS_DISTRO=indigo
ROS_ETC_DIR=/opt/ros/indigo/etc/ros
export ROS_MASTER_URI=http://192.168.10.4:11311
ROS_ROOT=/opt/ros/indigo/share/ros
ROS_WORKSPACE=/home/jendav/catkin_ws
PATH=$ROS_ROOT/bin:$PATH
ROS_PACKAGE_PATH=/home/jendav/catkin_ws:/opt/ros/indigo/share:/opt/ros/indigo/stacks:/opt/ros/indigo/share
export ROS_IP=192.168.10.5
export ROS_HOSTNAME=192.168.10.5
source /opt/ros/indigo/setup.zsh
source /home/jendav/catkin_ws/devel/setup.zsh


########### Gazebo setup #####################################
source /usr/share/gazebo/setup.sh
#source /usr/share/gazebo-2.2/setup.sh
#export TURTLEBOT_GAZEBO_WORLD_FILE=/usr/share/gazebo-2.2/worlds/wall.world
export LC_NUMERIC=C

########### GUROBI setup #####################################
export GUROBI_HOME="/opt/gurobi/gurobi702/linux64"
export PATH="${PATH}:${GUROBI_HOME}/bin"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"
#export LD_LIBRARY_PATH="${GUROBI_HOME}/lib"
#export GRB_LICENSE_FILE=/usr/home/cargoants/gurobi.lic

############ Others ##########################################
#export PATH=/home/jendav/anaconda3/bin:$PATH
#export PATH=$PATH:/usr/java/jre1.8.0_65/bin
PYTHONPATH=$PYTHONPATH:/opt/ros/indigo/share:$ROS_ROOT/core/roslib/src:/usr/lib/python2.7/dist-packages
