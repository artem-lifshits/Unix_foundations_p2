#Ensure that some extra UNIX shells are installed
cat /etc/shells
#Create an extra user, named trainee2
sudo adduser trainee2
#Set C Shell or Korn Shell as a default shell for the user
sudo usermod --shell /bin/csh trainee2