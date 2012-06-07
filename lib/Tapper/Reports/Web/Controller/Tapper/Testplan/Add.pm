package Tapper::Reports::Web::Controller::Tapper::Testplan::Add;
BEGIN {
  $Tapper::Reports::Web::Controller::Tapper::Testplan::Add::AUTHORITY = 'cpan:AMD';
}
{
  $Tapper::Reports::Web::Controller::Tapper::Testplan::Add::VERSION = '4.0.4';
}

use parent 'Tapper::Reports::Web::Controller::Base';

use common::sense;
## no critic (RequireUseStrict)


sub index :Path :Args(0)
{
        my ( $self, $c ) = @_;
        return;
}





1;

__END__
=pod

=encoding utf-8

=head1 NAME

Tapper::Reports::Web::Controller::Tapper::Testplan::Add

=head1 DESCRIPTION

Catalyst Controller.

=head2 index

=head1 NAME

Tapper::Reports::Web::Controller::Tapper::Testplan - Catalyst Controller for test plans

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

