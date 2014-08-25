use strict;
use warnings;
use Search::Elasticsearch;
use File::Slurp;
use IO::File;


my $e = Search::Elasticsearch->new();

my @files = `ls -d -1 /home/invincible/dataset/*.*`;

#print STDERR Dumper (\@files);
foreach my $file (@files) {
       my $text = `cat $file`;
       $e->index(
       index   => 'slurp1',
       type    => 's1',
       #id      => 1,
       body    => $text
   );
} 