use strict;

open IN, "GRM_CLK_IOB_T.xml" or die;

my @lines = <IN>;


foreach my $line (@lines)
{
    my $idx;
    if ($line=~ /CLK_IOB_MUXED_CLKP(\d+)/)
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
    $line =~ s/CLK_IOB_MUXED_CLKP\d+/CLK_IOB_MUXED_CLKP$idx/;
    #print $line;

}

print @lines;
close IN;