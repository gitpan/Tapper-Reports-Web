use strict;
use warnings;
use Test::More;

use DateTime::Format::DateParse;


{
        package Stash;
        use Moose;

        has 'stash_element' => (is => 'rw');
        sub stash {return };
}
my $stash = Stash->new();

BEGIN { use_ok 'Tapper::Reports::Web::Util::Filter' }
my $filter = Tapper::Reports::Web::Util::Filter->new(context => $stash);

# /tapper/reports/date/2010-09-20/
my $filter_condition = $filter->parse_filters(['date','2010-09-20']);
is($filter_condition->{error}, undef, 'No error during parse');
is(ref $filter_condition->{late}->[0]->{'created_at'}->{'>='}, 'DateTime', 'Date parsing returns a date');
is($filter_condition->{late}->[0]->{'created_at'}->{'>='}->dmy('.'), '20.09.2010', 'Date parsing returns a expected date');

is(ref $filter_condition->{late}->[1]->{'created_at'}->{'<'}, 'DateTime', 'Date parsing returns a date');
is($filter_condition->{late}->[1]->{'created_at'}->{'<'}->dmy('.'), '21.09.2010', 'Date parsing returns a expected date');
                                       



$filter = Tapper::Reports::Web::Util::Filter->new(context => $stash);
$filter_condition = $filter->parse_filters(['date','2010-09-20', 'days','2']);
is_deeply($filter_condition->{error}, ["Time filter already exists, only using first one"], 'Multiple date filter detected');


done_testing();
