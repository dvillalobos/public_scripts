#!/bin/bash

# Welcome
clear
echo ""
echo ""
echo "                           W E L C O M E                    "
echo ""
echo "This is an automatic Server Setup for Data Science and more!"
echo "Created by: Duubar Villalobos      Email: mydvtech@gmail.com"
echo ""
echo "Starting..."
echo ""
echo ""

# apt-fast
# Use apt-fast instead of apt-get for a speedy update
# apt-fast is a shell script wrapper for “apt-get” that improves updated and 
# package download speed by downloading packages from multiple connections simultaneously.
sudo add-apt-repository ppa:apt-fast/stable
sudo apt-get update
sudo apt-get -y install apt-fast

# Update and Upgrade
sudo apt-fast update
sudo apt-fast -y upgrade

# Synchronize the System Clock
# It is a good idea to synchronize the system clock with an NTP (network time protocol)
# server over the Internet when you run a physical server.
# In case you run a virtual server then you should skip this step.
sudo apt-fast -y install ntp

# Lubuntu
# Light Weight Desktop Environment:
# Lubuntu is a fast and lightweight operating system with a clean and easy-to-use user interface.
# It is a Linux system, that uses the minimal desktop LXDE, and a selection of light applications.
# Because of this, Lubuntu has very low hardware requirements.
# https://lubuntu.net/
sudo apt-fast -y install lubuntu-desktop

# Build Essentials
sudo apt-fast -y install gdebi-core
sudo apt-fast -y install build-essential checkinstall

# Chromium
# Chromium is the open source project behind Google Chrome.
# https://www.chromium.org/
sudo apt-fast install -y chromium-browser

# Clamav
# ClamAV® is an open source antivirus engine for detecting trojans, viruses, malware & other malicious threats.
# Documentation: https://www.clamav.net/documents
# https://www.clamav.net
sudo apt-fast -y install  clamav clamav-daemon clamav-freshclam clamtk
sudo service clamav-daemon start

# Install Media restrictive Codecs
# In order to play media files like MP#, MPEG4, AVI etc, you’ll need to install media codecs.
# Ubuntu has them in their repository but doesn’t install it by default because of copyright issues in various countries.
# In order to install, you have to accept the Eula License.
sudo apt-fast -y install ubuntu-restricted-extras

# SSH Secure Shell
# Cryptographic network protocol for operating network services securely over an unsecured network.
# Manuals: https://www.openssh.com/manual.html
# www.ssh.com
sudo apt-fast -y install ssh openssh-server

# Tmux
# Terminal of choice for SSH connections.
# Tmux is a terminal multiplexer. It lets you switch easily between several programs in one terminal,
# detach them (they keep running in the background) and reattach them to a different terminal. And do a lot more!
# User Guide: https://robots.thoughtbot.com/a-tmux-crash-course
# https://github.com/tmux/tmux/wiki
sudo apt-fast -y install tmux

# Samba
# A Samba file server enables file sharing across different operating systems over a network.
# It lets you access your desktop files from a laptop and share files with Windows and macOS users.
# Documentation: https://www.samba.org/samba/docs/
# https://www.samba.org
sudo apt-fast -y install tasksel
sudo tasksel install samba-server

# Fresh clean configuration file
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf_backup
sudo bash -c 'grep -v -E "^#|^;" /etc/samba/smb.conf_backup | grep . > /etc/samba/smb.conf'

# Command to create a new Samba user: 
sudo smbpasswd -a $USER

# Add to Samba configuration file: /etc/samba/smb.conf
sudo tee -a /etc/samba/smb.conf <<< "[homes]"
sudo tee -a /etc/samba/smb.conf <<< "   comment = Home Directories"
sudo tee -a /etc/samba/smb.conf <<< "   browseable = yes"
sudo tee -a /etc/samba/smb.conf <<< "   read only = no"
sudo tee -a /etc/samba/smb.conf <<< "   create mask = 0700"
sudo tee -a /etc/samba/smb.conf <<< "   directory mask = 0700"
sudo tee -a /etc/samba/smb.conf <<< "   valid users = %S"

# For Samba GUI to work
sudo touch /etc/libuser.conf

# Samba GUI
# sudo apt-fast -y install system-config-samba
# To run need to type:
#sudo system-config-samba

# Restart Samba Server
sudo systemctl restart smbd
sudo systemctl status smbd

# Libre Office: free and open source office suite.
# www.libreoffice.org
sudo apt-fast -y install libreoffice

# OBS Studio for Open Broadcaster Software
# Free and open-source streaming and recording program.
# www.obsproject.com
sudo apt-fast -y install ffmpeg
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt-fast update
sudo apt-fast -y install obs-studio

# GIMP graphics editor used for image retouching and editing.
# www.gimp.org
sudo apt-fast -y install gimp

# VLC Media player is a free and open-source, portable, cross-platform media player and streaming media server.
# www.videolan.org/vlc/
sudo apt-fast -y install vlc

# FileZilla
# Cross-platform FTP application, consisting of FileZilla Client and FileZilla Server.
# Client binaries are available for Windows, Linux, and macOS.
# www.filezilla-project.org
sudo apt-fast -y install filezilla

# Spotify
# Music streaming service.
# www.spotify.com
sudo apt-fast -y install snapd
sudo snap install spotify

# ﻿SageMath
# Computer algebra system with features covering many aspects of mathematics, including algebra,
# combinatorics, graph theory, numerical analysis, number theory, calculus and statistics.
# Documentation: http://www.sagemath.org/library.html
# www.sagemath.org/
sudo apt-fast -y install sagemath

# Maxima
# Maxima is a computer algebra system (CAS) based on a 1982 version of Macsyma.
# It is written in Common Lisp and runs on all POSIX platforms such as macOS, Unix, BSD, and Linux,
# as well as under Microsoft Windows and Android.
# Documentation: http://maxima.sourceforge.net/documentation.html
# http://maxima.sourceforge.net
sudo apt-fast -y install wxmaxima

# Geogebra
# GeoGebra is an interactive geometry, algebra, statistics and calculus application,
# intended for learning and teaching mathematics and science from primary school to university level.
# Resources: https://www.geogebra.org/materials
# https://www.geogebra.org
sudo apt-fast -y install geogebra-gnome


# Emacs for large files editing.
# Family of text editors that are characterized by their extensibility.
# www.gnu.org/software/emacs/
sudo apt-fast -y install emacs

# Geany
# Lightweight GUI text editor.
# www.geany.org
sudo apt-fast -y install geany

# LaTeX
# ﻿De facto standard for the communication and publication of scientific documents.
# www.latex-project.org
sudo apt-fast -y install texlive-full
sudo apt-fast -y install texmaker

# Ruby
# Ruby is a dynamic, open source programming language with a focus on simplicity and productivity.
# It has an elegant syntax that is natural to read and easy to write.
# Documentation: https://www.ruby-lang.org/en/documentation/
# https://www.ruby-lang.org/en/
sudo apt-fast -y install ruby ruby-dev

# Ruby Gems
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME=$HOME/gems' >> ~/.bashrc
echo 'export PATH=$HOME/gems/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
sudo gem update --system

# Atom
# Free and open-source text and source code editor for macOS, Linux, and Microsoft Windows
# with support for plug-ins written in Node.js, and embedded Git Control.
# Manual: https://flight-manual.atom.io
# www.atom.io
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-fast update
sudo apt-fast -y install atom

# Hydrogen
# Hydrogen is an interactive coding environment that supports Python, R, JavaScript
# and other Jupyter kernels.
# Usage: https://nteract.gitbooks.io/hydrogen/docs/Usage/GettingStarted.html
# https://nteract.gitbooks.io/hydrogen/
# apm stands for "atom package manager"
apm install hydrogen

# Jekyll
# Transform your plain text into static websites and blogs.
# Jekyll is a simple, blog-aware, static site generator for personal, project, or organization sites.
# Written in Ruby by Tom Preston-Werner, GitHub's co-founder, it is distributed under an open source license.
# Documentation: https://jekyllrb.com/docs/home/
# https://jekyllrb.com
gem install jekyll bundler
jekyll --version
gem list jekyll
gem update jekyll
#bundle install

# Docker
# Docker is a computer program that performs operating-system-level virtualization also known as containerization.
# The following linux commands will start Docker and ensure that starts after the reboot.
# https://www.docker.com
sudo apt-fast -y install docker.io
sudo systemctl start docker
sudo systemctl enable docker
docker --version

# Dropbox
# Dropbox brings your files together, in one central place.
# They’re easy to find and safely synced across all your devices—so you can access them anytime, anywhere.
# No more wasting the day tracking down work.
# https://www.dropbox.com
sudo apt install -y nautilus-dropbox

# RStudio Desktop 64 bits Version:  1.1.453 Released:  2018-05-16
# RStudio is a free and open-source integrated development environment for R,
# a programming language for statistical computing and graphics.
sudo apt-fast -y install r-base
sudo apt-fast -y install libssl-dev libcurl4-openssl-dev libxml2-dev
wget https://download1.rstudio.org/rstudio-xenial-1.1.453-amd64.deb
sudo dpkg -i rstudio-xenial-1.1.453-amd64.deb
rm -f rstudio-xenial-1.1.453-amd64.deb
sudo apt-fast -y -f install
sudo su - -c "R -e \"install.packages('rmarkdown', repos='https://cran.rstudio.com/')\""

# RStudio Server 64 bits Version:  1.1.456 Released:  2018-07-19
# RStudio is a free and open-source integrated development environment for R,
# a programming language for statistical computing and graphics.
# Documentation: http://docs.rstudio.com/ide/server-pro/
# Open browser and go to http://your_server_name:8787
# https://www.rstudio.com/products/rstudio/
wget https://download2.rstudio.org/rstudio-server-1.1.456-amd64.deb
sudo dpkg -i rstudio-server-1.1.456-amd64.deb
rm -f rstudio-server-1.1.456-amd64.deb
sudo apt-fast -y -f install

# Shiny Server
# Open Source Shiny Server provides a platform on which you can host multiple Shiny applications
# on a single server, each with their own URL or port.
# Documentation: http://docs.rstudio.com/shiny-server/
# Open browser and go to http://your_server_name:3838
# https://www.rstudio.com/products/shiny/download-server/
sudo su - -c "R -e \"install.packages('shiny', repos='https://cran.rstudio.com/')\""
wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.7.907-amd64.deb
sudo dpkg -i shiny-server-1.5.7.907-amd64.deb
rm -f shiny-server-1.5.7.907-amd64.deb
sudo apt-fast -y -f install

# R Essential Packages
sudo su - -c "R -e \"install.packages('repr', repos='https://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('IRdisplay', repos='https://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('evaluate', repos='https://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('crayon', repos='https://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('pbdZMQ', repos='https://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('uuid', repos='https://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('digest', repos='https://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('devtools', repos='https://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('tidyverse', repos='https://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('caret', repos='https://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('nnet', repos='https://cran.rstudio.com/')\""

# An alternative one command line will be as follows:
# $ sudo su - -c "R -e \"install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon') , repos='https://cran.rstudio.com/')\""
# $ sudo su - -c "R -e \"install.packages(c('pbdZMQ', 'uuid', 'digest', 'devtools') , repos='https://cran.rstudio.com/')\""
# $ sudo su - -c "R -e \"install.packages(c('tidyverse', 'caret', 'nnet') , repos='https://cran.rstudio.com/')\""

# In order to know the path to your R libraries:
sudo su - -c "R -e \".libPaths()\""

# Spyder
# Spyder is an open source cross-platform integrated development environment for scientific programming
# in the Python language. Spyder integrates NumPy, SciPy, Matplotlib and IPython, as well as other open source software.
# https://pythonhosted.org/spyder/
sudo apt-fast -y install spyder3

# MariaDB
# One of the most popular database servers. Made by the original developers of MySQL. Guaranteed to stay open source.
# MariaDB is a community-developed fork of the MySQL relational database management system
# intended to remain free under the GNU GPL.
# https://mariadb.org
sudo apt-fast -y install mariadb-server mariadb-client
sudo mysql_secure_installation

# You will be asked these questions:
# Enter current password for root (enter for none): <-- press enter
# Set root password? [Y/n] <-- y
# New password: <-- Enter the new MariaDB root password here
# Re-enter new password: <-- Repeat the password
# Remove anonymous users? [Y/n] <-- y
# Disallow root login remotely? [Y/n] <-- y
# Reload privilege tables now? [Y/n] <-- y

sudo systemctl stop mariadb.service
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service

# PostgreSQL
# PostgreSQL is a powerful, open source object-relational database system with over 30 years 
# of active development that has earned it a strong reputation for reliability, 
# feature robustness, and performance.
# Documentation: https://www.postgresql.org/docs/
# https://www.postgresql.org
sudo apt-fast -y install postgresql-10

# Setup password for PostgreSQL
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'psqlpassword';"

# Open pgAdmin:
# user: postgres
# password: psqlpassword

# pgAdmin
# pgAdmin is the most popular and feature rich Open Source administration and development platform for PostgreSQL, 
# the most advanced Open Source database in the world.
# Documentation: https://www.pgadmin.org/docs/
# https://www.pgadmin.org
sudo apt-fast -y install pgadmin3

# DB Browser for SQLite
# DB Browser for SQLite is a high quality, visual, open source tool to create, design, 
# and edit database files compatible with SQLite.
# https://sqlitebrowser.org
sudo apt-fast -y install sqlitebrowser


# Apache Web Server
# The goal of this project is to provide a secure, efficient and extensible server
# that provides HTTP services in sync with the current HTTP standards.
# The document root of the apache default vhost is /var/www/html on Ubuntu
# and the main configuration file is /etc/apache2/apache2.conf.
# The configuration system is fully documented in /usr/share/doc/apache2/README.Debian.gz.
# Open browser and go to http://your_server_name
# https://httpd.apache.org
sudo apt-fast -y install apache2
sudo apt-fast -y install apache2-doc apache2-utils apache2-suexec-pristine libapache2-mod-fcgid libapache2-mod-python

# PHP 7.2
# PHP: Hypertext Preprocessor is a server-side scripting language designed for Web development,
# but also used as a general-purpose programming language.
# http://www.php.net
sudo apt-fast -y install php7.2 libapache2-mod-php7.2
sudo systemctl restart apache2

# Get MySQL / MariaDB support in PHP
php -v
apt-cache search --names-only ^php

# Configuring Apache to use PHP
a2enmod php7.2

# Adding PHP support
sudo apt-fast -y install memcached imagemagick libruby
sudo apt-fast -y install php7.2-mysql php7.2-sqlite3 libapache2-mod-php php7.2 php7.2-common php7.2-gd php7.2-imap
sudo apt-fast -y install php7.2-cgi  php-pear mcrypt php7.2-curl php7.2-intl php7.2-pspell php7.2-cli
sudo apt-fast -y install php7.2-recode  php7.2-tidy php7.2-xmlrpc php7.2-xsl php-memcache
sudo apt-fast -y install php-imagick php-gettext php7.2-zip php7.2-mbstring php-soap php7.2-soap

sudo systemctl restart apache2

# Install the Opcache + APCu PHP cache to speed up PHP
sudo apt-fast -y install php7.2-opcache php-apcu

sudo systemctl restart apache2

# Let's encript
sudo apt-fast -y install certbot

# PureFTPd and Quota
# Pure-FTPd is a free FTP Server with a strong focus on software security.
# It can be compiled and run on a variety of Unix-like computer operating systems including Linux, OpenBSD, NetBSD, FreeBSD,...
# https://www.pureftpd.org
sudo apt-fast -y install pure-ftpd-common pure-ftpd-mysql quota quotatool
# Edit the file /etc/default/pure-ftpd-common
#sudo nano /etc/default/pure-ftpd-common
# and make sure that the start mode is set to standalone and set VIRTUALCHROOT=true:
#	[...]
#	STANDALONE_OR_INETD=standalone
#	[...]
#	VIRTUALCHROOT=true
#	[...]
# To allow FTP and TLS sessions, run
sudo echo 1 > /etc/pure-ftpd/conf/TLS

# In order to use TLS, we must create an SSL certificate.
# I create it in /etc/ssl/private/, therefore I create that directory first:
sudo mkdir -p /etc/ssl/private/

# Generate the SSL certificate as follows:
sudo openssl req -x509 -nodes -days 7300 -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem

# Change the permissions of the SSL certificate:
sudo chmod 600 /etc/ssl/private/pure-ftpd.pem

# Then restart PureFTPd:
sudo service pure-ftpd-mysql restart

# phpMyAdmin
# phpMyAdmin is a free and open source administration tool for MySQL and MariaDB.
# As a portable web application written primarily in PHP, it has become one of the
# most popular MySQL administration tools, especially for web hosting services.
# https://www.phpmyadmin.net
sudo apt-fast -y install phpmyadmin

# You will see the following questions:

# Web server to configure automatically: <-- Select the option: apache2
# Configure database for phpmyadmin with dbconfig-common? <-- Yes
# MySQL application password for phpmyadmin: <-- Press enter, apt will create a random password automatically.

# Root access to PHPMyAdmin
sudo mysql -u root -D mysql -e "CREATE USER 'admin_myphpadmin'@'localhost' IDENTIFIED BY 'myphpadminpassword'; GRANT ALL PRIVILEGES ON *.* TO 'admin_myphpadmin'@'localhost' WITH GRANT OPTION; FLUSH PRIVILEGES;"

# Alternative, you could use the following script by typing
# $ sudo mysql -u root

#﻿ > CREATE USER 'admin_myphpadmin'@'localhost' IDENTIFIED BY 'myphpadminpassword';
# > GRANT ALL PRIVILEGES ON *.* TO 'admin_myphpadmin'@'localhost' WITH GRANT OPTION;
# > FLUSH PRIVILEGES;
# > exit

# Open browser to:      http://localhost/phpmyadmin/:
# user: admin_myphpadmin
# password: myphpadminpassword

# MySQL Workbench
# MySQL Workbench is a unified visual tool for database architects, developers, and DBAs.
# MySQL Workbench provides data modeling, SQL development, and comprehensive administration
# tools for server configuration, user administration, backup, and much more.
# MySQL Workbench is available on Windows, Linux and Mac OS X.
# https://www.mysql.com/products/workbench/
sudo apt-fast -y install mysql-workbench

# Git
# Git is a version control system for tracking changes in computer files and coordinating work
# on those files among multiple people.
# Documentation: https://git-scm.com/docs
# https://git-scm.com
sudo apt-fast -y install git

# MongoDB
# MongoDB is a free and open-source cross-platform document-oriented database program.
# Classified as a NoSQL database program, MongoDB uses JSON-like documents with schemas.
# Documentation: https://docs.mongodb.com
# https://www.mongodb.com
sudo apt install -y mongodb

sudo systemctl status mongodb
# Execute this command to verify connection status:
# A returned value of 1 for the ok field in the response indicates that the server is working properly.
mongo --eval 'db.runCommand({ connectionStatus: 1 })'

# Node.JS
# Node.js® is a JavaScript runtime built on Chrome's V8 JavaScript engine needed in order to install Mongoose
# and to connect to MongoDB.
# Documentation: https://nodejs.org/en/docs/
# https://nodejs.org/en/
sudo apt-fast install -y nodejs

# Execute this command to verify connection status:
node -v

# Mongoose
# This will be used to connect from Python3 or any other package using a script.
# Mongoose provides a straight-forward, schema-based solution to model your application data.
# It includes built-in type casting, validation, query building, business logic hooks and more, out of the box.
# Documentation: http://mongoosejs.com/docs/guide.html
# http://mongoosejs.com
sudo apt-fast install -y npm
npm install mongoose

# OpenJDK
# OpenJDK is a free and open source implementation of the Java Platform, Standard Edition.
# http://openjdk.java.net
sudo apt-fast install -y openjdk-8-jre
sudo apt-fast install -y openjdk-8-jdk

clear
echo ""
echo "***************************** I M P O R T A N T ****************************"
echo ""
echo "Please select >> java-8-openjdk << in order for Neo4j to run in your system!"
echo ""
echo ""
echo ""
echo ""

# To switch versions:
sudo update-alternatives --config java
# Make sure your system is using the correct JDK:
java -version

# Neo4J
# Neo4j is a graph database management system developed by Neo4j, Inc.
# Described by its developers as an ACID-compliant transactional database with native graph storage and processing,
# Neo4j is the most popular graph database according to DB-Engines ranking.
# Learn: https://neo4j.com/graphacademy/
# https://neo4j.com
sudo wget -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -
sudo echo 'deb https://debian.neo4j.org/repo stable/' | sudo tee -a /etc/apt/sources.list.d/neo4j.list
sudo apt-fast update
sudo apt-fast install -y neo4j

sudo systemctl start neo4j

# With default configuration Neo4j only accepts local connections.
# To accept non-local connections, uncomment this line from /etc/neo4j/neo4j.conf
# For that you need to run the following command:
# $ sudo nano /etc/neo4j/neo4j.conf
# Eliminate the "#" symbol infront of the following line and exit by saving your changes.
# dbms.connectors.default_listen_address=0.0.0.0
# For changes to take effect run the following command:
# $ sudo systemctl restart neo4j

# Open browser to:      http://localhost:7474/browser/
# user: neo4j
# password: neo4j

# Audacity
# Audacity is an easy-to-use, multi-track audio editor and recorder for Windows, Mac OS X, GNU/Linux
# and other operating systems.
# Documentation: https://www.audacityteam.org/help/documentation/
# https://www.audacityteam.org
sudo apt-fast install -y  audacity

# Blender
# Blender is the free and open source 3D creation suite.
# It supports the entirety of the 3D pipeline—modeling, rigging, animation, simulation,
# rendering, compositing and motion tracking, even video editing and game creation.
# Support, tutorials and documentation: https://www.blender.org/support/
# https://www.blender.org
sudo apt-fast install -y blender

# Ardour
# Record, Edit, and Mix on Linux, macOS and Windows.
# http://ardour.org

# Joomla
# Joomla! is a free and open-source content management system for publishing web content,
# developed by Open Source Matters, Inc. It is built on a model–view–controller web application
# framework that can be used independently of the CMS.
# Documentation: https://docs.joomla.org
# https://www.joomla.org

# Creating Joomla database called 'joomladb'
sudo mysql -u root -D mysql -e "CREATE DATABASE joomladb; CREATE USER 'admin_joomla'@'localhost' IDENTIFIED BY 'myjoomlapassword'; GRANT ALL ON joomladb.* TO 'admin_joomla'@'localhost' IDENTIFIED BY 'myjoomlapassword' WITH GRANT OPTION; FLUSH PRIVILEGES;"

wget https://github.com/joomla/joomla-cms/releases/download/3.8.10/Joomla_3.8.10-Stable-Full_Package.tar.bz2
sudo mkdir -p /var/www/html/joomla
sudo tar xvjf Joomla_3.8.10-Stable-Full_Package.tar.bz2 -C /var/www/html/joomla
sudo chown -R www-data:www-data /var/www/html/joomla/
sudo chmod -R 755 /var/www/html/joomla/
sudo systemctl restart apache2.service
rm -f Joomla_3.8.10-Stable-Full_Package.tar.bz2

# Open browser to:      http://localhost/joomla
# database: joomladb
# user: admin_joomla
# password: myjoomlapassword

# WordPress
# WordPress.com is a blogging platform that is owned and hosted online by Automattic.
# It is run on a modified version of WordPress, an open source piece of software used by bloggers.
# https://wordpress.org

# Creating WordPress database called 'wordpressdb'
sudo mysql -u root -D mysql -e "CREATE DATABASE wordpressdb; CREATE USER 'admin_wp'@'localhost' IDENTIFIED BY 'mywppassword'; GRANT ALL ON wordpressdb.* TO 'admin_wp'@'localhost' IDENTIFIED BY 'mywppassword' WITH GRANT OPTION; FLUSH PRIVILEGES;"

wget wget https://wordpress.org/latest.tar.gz
sudo tar -zxvf latest.tar.gz -C /var/www/html
sudo chown -R www-data:www-data /var/www/html/wordpress/
sudo chmod -R 755 /var/www/html/wordpress/
sudo systemctl restart apache2.service
rm -f latest.tar.gz

# Open browser to:      http://localhost/wordpress
# database: wordpressdb
# user: admin_wp
# password: mywppassword

# Ardour
# Ardour is a hard disk recorder and digital audio workstation application.
# It runs on Linux, macOS, FreeBSD and Microsoft Windows.
# Documentation: http://manual.ardour.org/toc/
# http://ardour.org
sudo apt-fast install -y ardour

# Data Science World

# System info
lsb_release -a

# Python
# Python is a programming language that lets you work quickly
# and integrate systems more effectively.
# Documentation: https://www.python.org/doc/
# https://www.python.org
python3 --version

# Jupyter Notebooks
# The Jupyter Notebook is an open-source web application that allows you to create
# and share documents that contain live code, equations, visualizations and narrative text.
# Uses include: data cleaning and transformation, numerical simulation, statistical modeling,
# data visualization, machine learning, and much more.
# Documentation: http://jupyter.org/documentation
# http://jupyter.org
pip3 install jupyter

# Connecting to the server using SSH Tunneling
# If you are using Linux or Mac, this can be done simply by running the following SSH command:
#
# ssh -L 8888:localhost:8888 server_username@<server ip address>
#
# Open browser to:      localhost:8888


# IRKernel for Jupyter
# If you have Jupyter installed, you can create a notebook using IRkernel from the dropdown menu.
sudo su - -c "R -e \"devtools::install_github('IRkernel/IRkernel')\""
sudo su - -c "R -e \"IRkernel::installspec()\""

# Pandas
# In computer programming, pandas is a software library written for the Python programming language
# for data manipulation and analysis. In particular, it offers data structures and operations for
# manipulating numerical tables and time series.
# Documentation: http://pandas.pydata.org/pandas-docs/stable/
# https://pandas.pydata.org
sudo apt-fast install -y python3-pandas

# An alternative is to install it using pip, you should use pip3 for Python3 as follows:
# $ sudo -H pip3 install pandas

# Numpy
# NumPy is a library for the Python programming language, adding support for large,
# multi-dimensional arrays and matrices, along with a large collection of high-level mathematical
# functions to operate on these arrays.
# Documentation: https://docs.scipy.org
# http://www.numpy.org
# sudo apt install -y python3-numpy

# SciPy
# SciPy is a free and open-source Python library used for scientific computing and technical computing.
# Documentation" https://www.scipy.org/docs.html
# https://www.scipy.org
# sudo apt install -y python3-scipy

# Matplotlib
# Matplotlib is a plotting library for the Python programming language and its numerical mathematics extension NumPy.
# Tutorial: https://matplotlib.org/tutorials/
# https://matplotlib.org
# sudo apt install -y python3-matplotlib

# Seaborn
# Seaborn is a Python data visualization library based on matplotlib.
# It provides a high-level interface for drawing attractive and informative statistical graphics.
# Tutorial: http://seaborn.pydata.org/tutorial.html
# http://seaborn.pydata.org
sudo apt-fast install -y libatlas-base-dev gfortran
pip3 install Seaborn

# Scikit-learn
# Scikit-learn (formerly scikits.learn) is a free software machine learning library
# for the Python programming language.[3] It features various classification,
# regression and clustering algorithms including support vector machines, random forests,
# gradient boosting, k-means and DBSCAN, and is designed to interoperate with the Python numerical
# and scientific libraries NumPy and SciPy.
# Documentation: http://scikit-learn.org/stable/documentation.html
# http://scikit-learn.org/stable/
pip3 install scikit-learn

# Statsmodels
# statsmodels is a Python module that provides classes and functions for the estimation of many
# different statistical models, as well as for conducting statistical tests, and statistical data exploration.
# Examples: http://www.statsmodels.org/stable/examples/
# http://www.statsmodels.org
pip3 install statsmodels

# Cython
# Cython is a superset of the Python programming language, designed to give C-like
# performance with code that is written mostly in Python. Cython is a compiled language
# that generates CPython extension modules.
# Documentation: http://docs.cython.org/en/latest/
# http://cython.org
pip3 install Cython

# rpy2
# rpy2 is an interface to R running embedded in a Python process.
# Also includes functionality to deal with pandas DataFrames.
# Converting data frames back and forth between rpy2 and pandas should be largely automated
# (no need to convert explicitly, it will be done on the fly in most rpy2 functions).
# To convert explicitly, the functions are pandas2ri.py2ri() and pandas2ri.ri2py().
# Documentation: https://rpy2.github.io
# https://rpy2.bitbucket.io
pip3 install rpy2

# ﻿tzlocal
# This Python module returns a tzinfo object with the local timezone information under Unix and Win-32.
# It requires pytz, and returns pytz tzinfo objects.
# https://pypi.org/project/tzlocal/
pip3 install tzlocal

# Virtualenv
# virtualenv is a tool to create isolated Python environments.
# User Guide: https://virtualenv.pypa.io/en/stable/userguide/
# https://virtualenv.pypa.io
pip3 install virtualenv virtualenvwrapper

# NLTK
# The Natural Language Toolkit, or more commonly NLTK, is a suite of libraries and programs
# for symbolic and statistical natural language processing for English written in the Python programming language.
# http://www.nltk.org
pip3 install nltk

# Matplotlib
# Matplotlib is a Python 2D plotting library which produces publication quality figures in a variety
# of hardcopy formats and interactive environments across platforms. Matplotlib can be used in Python
# scripts, the Python and IPython shells, the Jupyter notebook, web application servers, and four graphical
# user interface toolkits.
# Documentation: https://matplotlib.org/contents.html
# https://matplotlib.org
# python3 -mpip install -U matplotlib
sudo apt-fast -y install python3-matplotlib

# PyQt5
# Qt is a set of C++ libraries and development tools that includes platform independent abstractions
# for graphical user interfaces, networking, threads, regular expressions, SQL databases, SVG, OpenGL,
# XML, user and application settings, positioning and location services, short range communications
# (NFC and Bluetooth) and access to the cloud. PyQt5 implements over 1000 of these classes as a set
# of Python modules.
# http://pyqt.sourceforge.net/Docs/PyQt5/
sudo apt-fast -y install python3-pyqt5

# Plotly for Python
# Plotly creates leading open source tools for composing, editing, and sharing interactive
# data visualization via the Web.
# User guide: https://plot.ly/python/user-guide/
# https://plot.ly
pip3 install plotly
pip3 install plotly --upgrade

# Webmin
# Webmin is a web-based interface for system administration for Unix. 
# Using any modern web browser, you can setup user accounts, Apache, DNS, 
# file sharing and much more. Webmin removes the need to manually edit Unix 
# configuration files like /etc/passwd, and lets you manage a system from 
# the console or remotely
# http://www.webmin.com/
wget -qO- http://www.webmin.com/jcameron-key.asc | sudo apt-key add
sudo add-apt-repository "deb http://download.webmin.com/download/repository sarge contrib"
sudo apt update
sudo apt-fast -y install webmin

# Webmin install complete. 
# Open browser to:      https://localhost:10000/
# User name: your_user_name
# Password: your_password

# Preload
# Preload monitors applications that users run, and by analyzing this
# data, predicts what applications users might run, and fetches those
# binaries and their dependencies into memory for faster startup times.
# sudo apt-fast install preload
sudo apt-fast -y install preload

# ufw Firewall
# Uncomplicated Firewall is a program for managing a netfilter firewall designed to be easy to use.
# It uses a command-line interface consisting of a small number of simple commands, and uses iptables for configuration.
# https://linuxize.com/post/how-to-setup-a-firewall-with-ufw-on-ubuntu-18-04/
sudo apt-fast -y install ufw
sudo ufw enable

# Open ports
sudo ufw allow ssh
sudo ufw allow samba
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp # Https
sudo ufw allow 4000/tcp # Jekyll
sudo ufw allow 3306/tcp # MariaDB
sudo ufw allow 5432/tcp # PostgreSQL
sudo ufw allow 8787/tcp # R Studio Server
sudo ufw allow 3838/tcp # Shiny
sudo ufw allow 7474/tcp # Neo4j
sudo ufw allow 8888/tcp # Jupyter Notebooks
sudo ufw allow from any to any port 10000 proto tcp # Webmin

# Final Clean up
sudo apt-fast clean
sudo apt-fast autoremove

# Final Message
clear
echo ""
echo ""
echo ""
echo "CONGRATULATIONS, now you have an awesome system!"
echo ""
echo "Time to Collaborate!"
echo ""
echo ""
