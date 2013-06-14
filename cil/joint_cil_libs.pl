#!/usr/bin/perl -w
use strict;

use 5.010001;

my ($sec,$min,$hour,$day,$mon,$year,$weekday,$yeardate,$savinglightday)
  = (localtime(time));
$year += 1900;
$min  = ($min < 10)? "0$min":$min;
$hour = ($hour < 10)? "0$hour":$hour;
$day  = ($day < 10)? "0$day":$day;
$mon  = ($mon < 9)? "0".($mon+1):($mon+1);
my $version = join"_", ($year, $mon.$day, $hour.$min);
my $author = "chwang";

my $chip_family = "fdp5";

# declare libs we want to joint together
my @cil_libs = qw (
    element_lib
    grm_lib
    site_lib
    cluster_lib
    tile_lib
    chip_lib
);



#opendir DIR, "." or die;
#
#my @dirs = readdir DIR;


open XML, ">fdp5p15_cil_$version.xml" or die;

# xml declaration
say XML "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";

say XML "<cil family=\"$chip_family\" author=\"$author\" version=\"$version\">";


my $cil_body;

undef $/;

foreach my $lib (@cil_libs)
{
    $cil_body .= "<$lib>\n";
    opendir LIBDIR, "./$lib" or die "Cannot open dir $lib because : $!\n";
    
    my @xml_files = grep !/^..?$/, readdir LIBDIR;
    #say join "\n", @xml_files;
    foreach (sort @xml_files)
    {
        #say "$_";
        open IN, "./$lib/$_" or die "$!";
        $cil_body .= <IN>;
        close IN;
        
    }
    $cil_body .= "</$lib>\n";
    
    closedir LIBDIR;
}

print XML $cil_body;

say XML  "</cil>";

#closedir DIR;

close XML;
