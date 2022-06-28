#!/usr/bin/perl
# Simple file sender using MIME-LIte module used in common linux environment
# creted by Mohammed.Eltahir@gmail.com

use MIME::Lite;


$num_args = $#ARGV + 1;

if ($num_args != 4) {

    print "\nUsage: mailme.pl <from> <to> <subject> /path/to/file\n";

    exit;

}

 

$to = $ARGV[1];

$cc = 'cc_email@mydomain.com';

$from = $ARGV[0];

$subject = $ARGV[2];

$message = 'This is test email sent by Perl Script';

 

$msg = MIME::Lite->new(

                 From     => $from,
                 To       => $to,
                 Cc       => $cc,
                 Subject  => $subject,
                 Type     => 'multipart/mixed'
                 );

                

# Add your text message.

$msg->attach(Type         => 'text',

             Data         => $message

             );

           

# Specify your file as attachement.

$msg->attach(Type         => 'text/txt',

             Path         => $ARGV[3],

#             Filename     => 'logo.gif',

             Disposition  => 'attachment'

            );      

$msg->send;

print "Email Sent Successfully\n";
