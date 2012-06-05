package Tapper::Reports::Web::Model::TestrunDB;
BEGIN {
  $Tapper::Reports::Web::Model::TestrunDB::AUTHORITY = 'cpan:AMD';
}
{
  $Tapper::Reports::Web::Model::TestrunDB::VERSION = '4.0.3';
}

use strict;
use warnings;

use Tapper::Reports::Web;
use Tapper::Config;

use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
                    schema_class => 'Tapper::Schema::TestrunDB',
                    connect_info => [
                                     Tapper::Config->subconfig->{database}{TestrunDB}{dsn},
                                     Tapper::Config->subconfig->{database}{TestrunDB}{username},
                                     Tapper::Config->subconfig->{database}{TestrunDB}{password},
                                    ],
                   );


1;

__END__
=pod

=encoding utf-8

=head1 NAME

Tapper::Reports::Web::Model::TestrunDB

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<Tapper::Schema::TestrunDB>

=head1 NAME

Tapper::Reports::Web::Model::TestrunDB - Catalyst DBIC Schema Model
=head1 SYNOPSIS

See L<Tapper::Reports::Web>

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

