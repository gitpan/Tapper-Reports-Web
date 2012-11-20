package Tapper::Reports::Web::Controller::Tapper::Schedule;
BEGIN {
  $Tapper::Reports::Web::Controller::Tapper::Schedule::AUTHORITY = 'cpan:TAPPER';
}
{
  $Tapper::Reports::Web::Controller::Tapper::Schedule::VERSION = '4.1.2';
}

use strict;
use warnings;
use parent 'Catalyst::Controller';




sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    my $body = qx(tapper-testrun listqueue -v);

    $c->response->body("<pre>
$body
</pre>");
}

1;

__END__
=pod

=encoding utf-8

=head1 NAME

Tapper::Reports::Web::Controller::Tapper::Schedule

=head1 DESCRIPTION

Catalyst Controller.

=head1 NAME

Tapper::Reports::Web::Controller::Tapper::Schedule - Catalyst Controller

=head1 METHODS

=head2 index

=head1 AUTHOR

AMD OSRC Tapper Team <tapper@amd64.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Advanced Micro Devices, Inc..

This is free software, licensed under:

  The (two-clause) FreeBSD License

=cut

