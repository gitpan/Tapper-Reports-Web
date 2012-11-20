package Tapper::Reports::Web::Controller::Tapper::Hardware;
BEGIN {
  $Tapper::Reports::Web::Controller::Tapper::Hardware::AUTHORITY = 'cpan:TAPPER';
}
{
  $Tapper::Reports::Web::Controller::Tapper::Hardware::VERSION = '4.1.2';
}

use strict;
use warnings;

use parent 'Tapper::Reports::Web::Controller::Base';

sub index :Path :Args(0)
{
        my ( $self, $c ) = @_;
}

1;



=pod

=encoding utf-8

=head1 NAME

Tapper::Reports::Web::Controller::Tapper::Hardware

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

