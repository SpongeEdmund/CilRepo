use strict;

open IN, "GRM_CLK_BUFGCTRL_T.xml" or die;

my @lines = <IN>;


foreach my $line (@lines)
{
    my $idx;
    if ($line=~ /CLK_BUFGCTRL_MUXED_CLK(\d+)/)
    {
        $idx = $1;
        # print $idx;
        if ($idx >= 0 and $idx <=15)
        {
        #print "yes";
            $idx = $idx*2;
        }
        elsif ($idx >=16 and $idx <=31)
        {
            $idx = 2*$idx-31;
        }
    }
    #print $idx;
    $line =~ s/CLK_BUFGCTRL_MUXED_CLK\d+/CLK_BUFGCTRL_MUXED_CLK$idx/;
    #print $line;

}

print @lines;
close IN;