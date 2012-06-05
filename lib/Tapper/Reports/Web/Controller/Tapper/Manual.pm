package Tapper::Reports::Web::Controller::Tapper::Manual;
BEGIN {
  $Tapper::Reports::Web::Controller::Tapper::Manual::AUTHORITY = 'cpan:AMD';
}
{
  $Tapper::Reports::Web::Controller::Tapper::Manual::VERSION = '4.0.3';
}

use strict;
use warnings;

use parent 'Catalyst::Controller::BindLex';
__PACKAGE__->config->{bindlex}{Param} = sub { $_[0]->req->params };
__PACKAGE__->config->{unsafe_bindlex_ok} = 1;

sub index :Path :Args(0)
{
        my ( $self, $c ) = @_;
}

1;



=pod

=encoding utf-8

=head1 NAME

Tapper::Reports::Web::Controller::Tapper::Manual

=head1 DESCRIPTION

Catalyst Controller.

=head1 NAME

Tapper::Reports::Web::Controller::Tapper::Hardware - Catalyst Controller

=head1 METHODS

=head1 AUTHOR

Steffen Schwigon,,,

=head1 LICENSE

This program is released under the following license: freebsd

=head1 AUTHOR

AMD OSRC Tapper Team <tapper@amd64.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Advanced Micro Devices, Inc..

This is free software, licensed under:

  The (two-clause) FreeBSD License

=cut


__END__

