#!/usr/bin/perl -i.bak

# for drbd_protocol.h packet sizes

sub BEGIN 
{
	@ARGV = grep(/drbd_protocol\.h/, @ARGV);
#	warn "No protocol.h on the commandline.\n", 
	exit unless @ARGV;
	undef $/;
}

while (<>) {
	print "#pragma pack(push, 1)\n" . $_ . "\n#pragma pack(pop)\n";
}
