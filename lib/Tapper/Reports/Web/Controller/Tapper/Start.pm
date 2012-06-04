package Tapper::Reports::Web::Controller::Tapper::Start;
BEGIN {
  $Tapper::Reports::Web::Controller::Tapper::Start::AUTHORITY = 'cpan:AMD';
}
{
  $Tapper::Reports::Web::Controller::Tapper::Start::VERSION = '4.0.2';
}

use parent 'Tapper::Reports::Web::Controller::Base';

use common::sense;
## no critic (RequireUseStrict)

sub auto :Private
{
        my ( $self, $c ) = @_;
}

sub index :Path :Args()
{
        my ( $self, $c ) = @_;
}

1;

__END__
=pod

=encoding utf-8

=head1 NAME

Tapper::Reports::Web::Controller::Tapper::Start

=head1 AUTHOR

AMD OSRC Tapper Team <tapper@amd64.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Advanced Micro Devices, Inc..

This is free software, licensed under:

  The (two-clause) FreeBSD License

=cut

