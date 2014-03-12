use strict;

open IN, "GRM_CLK_BUFGCTRL_T.xml" or die;

my @lines = <IN>;


foreach my $line (@lines)
{
    my $idx;
    my $idx2;
    if ($line=~ /CLK_BUFGCTRL_I[10]P(\d+)/)
    {
        $idx = $1;
        # print $idx;
        if ($idx >= 0 and $idx <=15)
        {
        #print "yes";
            $idx = 15-$idx;
        }
    }
    #print $idx;
    $line =~ s/CLK_BUFGCTRL_I([10])P\d+/CLK_BUFGCTRL_I$1P$idx/;
    #print $line;

}

print @lines;
close IN;