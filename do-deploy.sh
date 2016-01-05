function exe_cmd()
{
    echo $1
    eval $1
}

root_dir=`pwd`

config_file=$root_dir'/.appcfg_oauth2_tokens'
home_config_file='~/.appcfg_oauth2_tokens'

# use the previous authorization information
if [ -f $config_file ]; then
    exe_cmd "cp $config_file $home_config_file"
else
    exe_cmd "rm $home_config_file"
fi

# here we update the Application

# After a successful authorization, the authorization will be saved to
# ~/.appcfg_oauth2_tokens

# use --noauth_local_webserver
# Do not run a local web server to
# handle redirects during OAuth authorization.

# change this line do the things you want
exe_cmd "appcfg.py update app.yaml --noauth_local_webserver"

# save authorization information
exe_cmd "cp $home_config_file $config_file"
