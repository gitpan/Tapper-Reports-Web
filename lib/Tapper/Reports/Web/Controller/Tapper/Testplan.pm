package Tapper::Reports::Web::Controller::Tapper::Testplan;

use parent 'Tapper::Reports::Web::Controller::Base';

use common::sense;
## no critic (RequireUseStrict)
use Tapper::Model 'model';

=head2 index



=cut

sub index :Path :Args()
{
        my ( $self, $c, @args ) = @_;
        my $error_msg : Stash;

        my $filter = Tapper::Reports::Web::Util::Filter->new(context => $c);
        my $filter_condition = $filter->parse_filters(\@args, ['days']);

        if ($filter_condition->{error}) {
                $error_msg = join("; ", @{$filter_condition->{error}});
                $c->res->redirect("/tapper/testplan/days/2");
        }


        my $testplan_instances : Stash;
        $testplan_instances = [];
        foreach my $instance (model('TestrunDB')->resultset('TestplanInstance')->search($filter_condition->{early})->all) {
                my $details = {
                               name => $instance->name,
                               id   => $instance->id,
                               path => $instance->path,
                              };
                $details->{count_unfinished} = int grep {$_->testrun_scheduling and
                                                           $_->testrun_scheduling->status ne 'finished'} $instance->testruns->all;

                foreach my $testrun_id (map {$_->id} $instance->testruns->all) {
                        my $stats   = model('ReportsDB')->resultset('ReportgroupTestrunStats')->search({testrun_id => $testrun_id})->first;

                        $details->{count_fail}++ if $stats and $stats->success_ratio  < 100;
                        $details->{count_pass}++ if $stats and $stats->success_ratio == 100;
                }
                push @$testplan_instances, $details;
        }
        return;
}





=head1 NAME

Tapper::Reports::Web::Controller::Tapper::Testplan - Catalyst Controller for test plans

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=head2 index



=head1 AUTHOR

AMD OSRC Tapper Team, C<< <tapper at amd64.org> >>

=head1 LICENSE

This program is released under the following license: freebsd

=cut

1;