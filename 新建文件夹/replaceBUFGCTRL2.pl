use strict;

open IN, "GRM_CLK_BUFGCTRL_T.xml" or die;

my @lines = <IN>;


foreach my $line (@lines)
{
    my $idx;
    my $idx2;
    if ($line=~ /  <route src="CLK_BUFGCTRL_CKINT[10](\d+)" snk="CLK_BUFGCTRL_I[01]P\d+">/)
    {
        $idx = $1;
        $idx2= $1;
        # print $idx;
        if ($idx >= 0 and $idx <=15)
        {
        #print "yes";
            $idx = 15-$idx;
        }
    }
    #print $idx;
    $line =~ s/  <route src="CLK_BUFGCTRL_CKINT([10])\d+" snk="CLK_BUFGCTRL_I([01])P\d+">/  <route src="CLK_BUFGCTRL_CKINT$1$idx" snk="CLK_BUFGCTRL_I$2P$idx2">/;
    #print $line;

}

print @lines;
close IN;