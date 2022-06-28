 
#!/bin/perl

#### script to remove mod_privileges Virtual Host file
#### Demo for using Apache-Admin-Config perl module


my $conf_file = "/etc/httpd/conf/httpd.conf";

use Apache::Admin::Config;

my $conf = new Apache::Admin::Config $conf_file ;

 
foreach($conf->section(-name => "virtualhost"))
{

        print $_->directive("documentroot"),"\n" ;

        if ( $_->section("ifmodule") )

                {

                print $_->section("ifmodule"),"\n" ;

                $_->section("ifmodule")->delete;

                }

        #print $_->name,"\n" ;
        #print $_->value,"\n" ;
        #print $_->type,"\n" ;
}

$conf->save;
