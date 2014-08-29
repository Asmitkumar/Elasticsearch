use strict;
use warnings;
use Search::Elasticsearch;
use Data::Dumper;

my $e = Search::Elasticsearch->new();

# query 1 - Returns all documents from queries which contain either apple and ipad
my $results = $e->search(
        index => 'newdata',
        body  => {
            query => {
            	bool => {
            		must => {
            			match => {name => 'Apple Ipad'}
            		},
                    must_not => {
                        match => {name => 'nothing'}
                    },
                    should => {
                        match => {name => 'ipad, air'}
                    }
            	}
            }
        }
    );

print STDERR Dumper( $results );

# query 2 - Returns all documents from queries which contain only apple ipad

my $results2 = $e->search(
        index => 'newdata',
        body  => {
            query => {
                bool => {
                    must => {
                        match => {name => 'Apple Ipad'}
                    },
                    must_not => {
                        match => {name => 'macbook, iphone'}
                    },
                    should => {
                        match => {name => 'ipad, air'}
                    }
                }
            }
        }
    );

print STDERR Dumper( $results2 );

# query 3 - Returns all documents from queries which start with appl

my $results3 = $e->search(
        index => 'newdata',
        body  => {
            query => {
                regexp => {name => 'appl.*'}
            }
        }
    );

print STDERR Dumper( $results3 );

