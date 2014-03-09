use strict;

open IN, "GRM_CLK_HROW.xml" or die;

my @lines = <IN>;


foreach my $line (@lines)
{
    my $idx;
    if ($line=~ /from="I(\d+)"/)
    {
        $idx = $1;
        # print $idx;
        if ($idx >= 0 and $idx <=15)
        {
        #print "yes";
            $idx = $idx + 16;
        }
        elsif ($idx >=16 and $idx <=31)
        {
            $idx = $idx - 16;
        }
    }
    #print $idx;
    $line =~ s/from="I\d+"/from="I$idx"/;
    #print $line;

}

print @lines;
close IN;