package Tapper::Reports::Web::Controller::Root;
BEGIN {
  $Tapper::Reports::Web::Controller::Root::AUTHORITY = 'cpan:TAPPER';
}
{
  $Tapper::Reports::Web::Controller::Root::VERSION = '4.1.2';
}

use strict;
use warnings;
use parent 'Catalyst::Controller';

# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm

__PACKAGE__->config->{namespace} = '';

sub index :Path :Args(0)
{
        my ( $self, $c ) = @_;

        # the easy way, to avoid fiddling with Mason autohandlers on
        # simple redirects

        my $body = <<EOF;
<html>
<head>
<meta http-equiv="refresh" content="0; URL=/tapper">
<meta name="description" content="Tapper"
<title>Tapper</title>
</head>
EOF
        $c->response->body($body);
}

sub default :Path
{
        my ( $self, $c ) = @_;
        $c->response->body( 'Bummer! Page not found' );
        $c->response->status(404);
}

1;

sub end : ActionClass('RenderView') {}




=pod

=encoding utf-8

=head1 NAME

Tapper::Reports::Web::Controller::Root

=head1 DESCRIPTION

[enter your description here]

=head1 NAME

Tapper::Reports::Web::Controller::Root - Root Controller for Tapper::Reports::Web

=head1 METHODS

=head2 end

Attempt to render a view, if needed.

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


