package Tapper::Reports::Web;
BEGIN {
  $Tapper::Reports::Web::AUTHORITY = 'cpan:AMD';
}
{
  $Tapper::Reports::Web::VERSION = '4.0.3';
}
# ABSTRACT: Tapper - Frontend web application based on Catalyst

use strict;
use warnings;

use 5.010;

use Catalyst::Runtime '5.70';
use Hash::Merge;
use Tapper::Config;

use Class::C3::Adopt::NEXT;

# Set flags and add plugins for the application
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

use parent qw/Catalyst/;

# used by Catalyst::Plugin::ConfigLoader
sub finalize_config
{
        my $c = shift;

        $c->NEXT::ACTUAL::finalize_config;
        my $env =
            $ENV{HARNESS_ACTIVE}                 ? 'test'
                : $ENV{TAPPER_REPORTS_WEB_LIVE} ? 'live'
                    : 'development';
        Hash::Merge::set_behavior('RIGHT_PRECEDENT');
        $c->config(
                   Hash::Merge::merge(
                                      $c->config,
                                      $c->config->{ $env } || {} ,
                                     )
                  );
        $c->config->{tapper_config} = Tapper::Config->subconfig;


        return;
}

sub debug
{
        return $ENV{TAPPER_REPORTS_WEB_LIVE} || $ENV{HARNESS_ACTIVE} ? 0 : 1;
}

# I am sick of getting relocated/rebase on our local path!
# Cut away a trailing 'tapper/' from base and prepend it to path.
# All conditionally only when this annoying environment is there.
sub prepare_path
{
        my $c = shift;

        $c->NEXT::prepare_path(@_);

        my $base        =  $c->req->{base}."";
        $base           =~ s,tapper/$,, if $base;
        $c->req->{base} =  bless( do{\(my $o = $base)}, 'URI::http' );
        $c->req->path('tapper/'.$c->req->path) unless ( $c->req->path =~ m,^tapper/?,);
}


# Configure the application.
__PACKAGE__->config( name => 'Tapper::Reports::Web',
                    'Plugin::Authentication' => {
                                                 'realms' => {
                                                              'default' => {
                                                                            'credential' => {
                                                                                             'class' => 'Authen::Simple',
                                                                                             'authen' => [
                                                                                                          {
                                                                                                           'class' => 'PAM',
                                                                                                           args => {
                                                                                                                    service => 'login'
                                                                                                                   },
                                                                                                          },
                                                                                                         ]
                                                                                            }
                                                                           }
                                                             }
                                                }

                   );

__PACKAGE__->config->{static}->{dirs} = [
                                         'tapper/static',
                                        ];



# Start the application
__PACKAGE__->setup(qw/-Debug
                      ConfigLoader

                      Authentication
                      Static::Simple Session
                      Session::State::Cookie
                      Session::Store::File/,

                  );

1;

__END__
=pod

=encoding utf-8

=head1 NAME

Tapper::Reports::Web - Tapper - Frontend web application based on Catalyst

=head1 AUTHOR

AMD OSRC Tapper Team <tapper@amd64.org>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2012 by Advanced Micro Devices, Inc..

This is free software, licensed under:

  The (two-clause) FreeBSD License

=cut

