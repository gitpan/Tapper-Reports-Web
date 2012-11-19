package Tapper::Reports::Web::Controller::Tapper::Testplan::Taskjuggler;
BEGIN {
  $Tapper::Reports::Web::Controller::Tapper::Testplan::Taskjuggler::AUTHORITY = 'cpan:TAPPER';
}
{
  $Tapper::Reports::Web::Controller::Tapper::Testplan::Taskjuggler::VERSION = '4.1.1';
}

use parent 'Tapper::Reports::Web::Controller::Base';
use Tapper::Testplan::Reporter;
use Tapper::Testplan::Plugins::Taskjuggler;
use Tapper::Config;
use Hash::Merge 'merge';

use common::sense;
## no critic (RequireUseStrict)


sub index :Path :Args(0)
{
        my ( $self, $c ) = @_;
        my $taskjuggler = Tapper::Testplan::Plugins::Taskjuggler->new(cfg => Tapper::Config->subconfig->{testplans}{reporter}{plugin});
        my $reporter    = Tapper::Testplan::Reporter->new();
        $c->stash->{platforms} = $taskjuggler->prepare_task_data();
        $c->stash->{title} = "Testplan Taskjuggler matrix";

        return;
}






1;

__END__
=pod

=encoding utf-8

=head1 NAME

Tapper::Reports::Web::Controller::Tapper::Testplan::Taskjuggler

=head1 DESCRIPTION

Catalyst Controller.

=head2 index

Generate data for /tapper/testplan/taskjuggler/.

=head1 NAME

Tapper::Reports::Web::Controller::Tapper::Testplan::OSRC - Show testplans for OSRC project planning

=head1 METHODS

=head2 index

=head1 AUTHOR

AMD OSRC Tapper Team, C<< <tapper at amd64.org> >>

=head1 LICENSE

This program is released under the following license: freebsd

=head1 AUTHOR

AMD OSRC Tapper Team <tapper@amd64.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Advanced Micro Devices, Inc..

This is free software, licensed under:

  The (two-clause) FreeBSD License

=cut

